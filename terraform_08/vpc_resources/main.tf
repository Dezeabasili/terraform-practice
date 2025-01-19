provider "aws" {
  region = "us-east-1"
}

variable "ami-id" {
  type = string
  default = "ami-0e2c8caa4b6378d8c"
}

variable "public-key-value" {
  type = map(string)
  default = {
    "dev" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ/0Ny2FEPFKWbuX40oi9A1EzihJAszE31Rh/RvsPWMI dezeabasili@DESKTOP-9L5GVCJ"
    "production" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDvJ16Gyh3PCC2U2hJoeLRRx4Gy11bVSzzTs4kSoLRHLBd9h+UIl4MZtR9pCKZeDb954LOevRUAYhPxsBvxjsc/HVdA+QvLPU4lfKDV61xd00hKvCd4quTSoOALjDX323xfu3dcQRZZsOLHRmz2GGFFcWiXuALDhXSC81vYxe+AChujnnc2hXpt4cEbKXLSxa09Rv9+/4dBc3Ng1cJmpK93AxWZzfY42Sasi/cuVb9gTo0mfohmqXYRods3rJqxjQ4Pi+YNyosNq9aZkgdC3m8JuVRFrQvKxNaYOtCjK50k42YKqZiONxyU1JyA4OMitefLlBFzEqb1IfpZAEcpskQ3AbDYPCqnA2eJ1k+9ggWZDZrABcNpB6gaW1zWBOHOQSOmeCophOiCK3TBdTLWNZcDywrOdDs7PlPOd+mzMJrer9uakNNXVpyKNHcfxki+BCH6tm8GVBmcYRBDAbmFBvpNt6FJPsoSL1Td5Mas5dUQhUgN8oSf5oa6qEqk3oSB9ps= my-default-key"
  }
}

module "vpc-Terra" {
  source = "./modules/vpc_module"
}

module "ec2-Terra" {
  source = "./modules/ec2_module"
  Public-subnet-id = module.vpc-Terra.Public-subnet-id
  Private-subnet-id = module.vpc-Terra.Private-subnet-id
  FE-Security-groups-id = module.vpc-Terra.FE-Security-groups-id
  BE-Security-groups-id = module.vpc-Terra.BE-Security-groups-id
  Public-Key-name = module.vpc-Terra.Public-Key-name
  ami-id = var.ami-id
  }