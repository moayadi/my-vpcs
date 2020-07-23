module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${lookup(var.configuration, var.environment).name}"
  cidr = "${lookup(var.configuration, var.environment).vpc_cidr}"

  azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
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


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id = module.vpc.private_subnets[0]


  tags = {
    Name = "HelloWorld"
  }
}