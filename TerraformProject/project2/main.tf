# Configue the vpc resource
module "my_vpc" {
  source              = "../modules/network"
  cidr_vpc            = var.cidr_vpc
  cidr_public_subnet  = var.cidr_public_subnet
  cidr_private_subnet = var.cidr_private_subnet

}

# Configue the ec2 resource
module "ec2-module" {
  source            = "../modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = module.my_vpc.subnet_id
  security_group_id = module.my_vpc.security_group_id
}

module "s3" {
  source            = "../modules/s3"
  bucket_s3 = var.bucket_s3
}

module "dynamodb" {
  source            = "../modules/dynamodb"
  dyn_db = var.dyn_db
  }




