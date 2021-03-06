#
# The name of the environment, should be set on the ws-hashicat workspace
#
variable "environment" {
    default = "dev"
}

variable "owner" {
    default = "Moayad Ismail"
}

variable "ttl" {
    default  = "12"
}


#
# Contains the configuration based on the environment variable.
# The name of the environment is the key for the map see outputs.tf
# for an example of how to lookup and reference this variables :)
#
variable "configuration" {
  default = {
    dev = { # TEST VARIABLES
      size = "a1.medium",
      name = "Development",
      vpc_cidr = "10.0.0.0/16",
      nat_gateway = "false",
      vpn_gateway = "false",
      classification = "public",
      team = "NetworkTeam"
    }
    test = { # STAGING VARIABLES
      size = "a1.large",
      name = "Test",
      vpc_cidr = "10.0.0.0/16",
      nat_gateway = "false",
      vpn_gateway = "false",
      classification = "internal",
      team = "NetworkTeam"
    }
    prod = { # PRODUCTION VARIABLES
      size = "a1.xlarge",
      name = "Production",
      vpc_cidr = "10.0.0.0/16",
      nat_gateway = "false"
      vpn_gateway = "false",
      classification = "confidential",
      team = "NetworkTeam"
    }
  }
}
