module "vpc1" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${lookup(var.configuration, var.environment).name}"
  cidr = "${lookup(var.configuration, var.environment).vpc_cidr}"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = "${lookup(var.configuration, var.environment).nat_gateway}"
  enable_vpn_gateway = "${lookup(var.configuration, var.environment).vpn_gateway}"

  tags = {
    Environment = "${lookup(var.configuration, var.environment).name}"
    Owner = var.owner
    TTL = var.ttl
    Classification = "${lookup(var.configuration, var.environment).classification}"
  }
}

