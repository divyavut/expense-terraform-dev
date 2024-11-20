output "mysql_sg_id" {
    value = module.mysql_sg.mysql_sg_id
}
output "backend_sg_id" {
    value = module.backend_sg.backend_sg_id
}
output "frontend_sg_id" {
    value = module.frontend_sg.frontend_sg_id
}
output "bastion_sg_id" {
    value = module.bastion_sg.bastion_sg_id
}
output "ansible_sg_id" {
    value = module.bastion_sg.ansible_sg_id
}