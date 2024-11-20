module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami =                     local.ami_id
  name = "${local.resource_name}-mysql"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.mysql_sg_id]
  subnet_id              = local.database_subnet_ids
 
  tags = {
        Name = "${local.resource_name}-mysql"
  }
}
module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami =                     local.ami_id
  name = "${local.resource_name}-backend"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.backend_sg_id]
  subnet_id              = local.private_subnet_ids
 
  tags = {
        Name = "${local.resource_name}-backend"
  }
}

module "frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami =                     local.ami_id
  name = "${local.resource_name}-frontend"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.frontend_sg_id]
  subnet_id              = local.public_subnet_ids
 
  tags = {
        Name = "${local.resource_name}-frontend"
  }
}

module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami =                     local.ami_id
  name = "${local.resource_name}-ansible"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.ansible_sg_id]
  subnet_id              = local.public_subnet_ids
  user_data = file("expense.sh")
  tags = {
        Name = "${local.resource_name}-ansible"
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"

  zone_name = var.zone_name
  records = [
    {
      name    = "mysql"
      type    = "A"
      ttl     = 3600
      records = [module.mysql.private_ip]
      
    },
    {
      name    = "backend"
      type    = "A"
      ttl     = 3600
      records = [module.backend.private_ip
      ]
    },
    {
      name    = "frontend"
      type    = "A"
      ttl     = 3600
      records = [module.frontend.private_ip
      ]
    },
  ]
}