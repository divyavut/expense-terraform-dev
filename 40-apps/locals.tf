locals {
    resource_name = "${var.project_name}-${var.environment}"
    bastion_sg_id = data.aws_ssm_parameter.import_bastion_sg_id.value
    mysql_sg_id = data.aws_ssm_parameter.import_mysql_sg_id.value
    backend_sg_id = data.aws_ssm_parameter.import_backend_sg_id.value
    frontend_sg_id = data.aws_ssm_parameter.import_frontend_sg_id.value
    ansible_sg_id = data.aws_ssm_parameter.import_ansible_sg_id.value
    # convert stringList to list , return ["publicsubnet1", "publicsubnet2"]
    public_subnet_ids = split(",", data.aws_ssm_parameter.import_public_subnet_ids.value)[0]
    # convert stringList to list , return ["databsesubnet1", "databsesubnet2"]
    database_subnet_ids = split(",", data.aws_ssm_parameter.import_database_subnet_ids.value)[0]
       # convert stringList to list , return ["privatesubnet1", "privatesubnet2"]
    private_subnet_ids = split(",", data.aws_ssm_parameter.import_private_subnet_ids.value)[0]
    ami_id = data.aws_ami.joindevops.id
}
