provider "aws" {
  region = "us-east-1"
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

}