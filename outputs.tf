output "size" {
  value = "${lookup(var.configuration, var.environment).size}"
}


output "vpc_id" {
  value = module.vpc.vpc_id
}
  
output "private_subnets" {
  value = module.vpc.private_subnets
}
