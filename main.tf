provider "aws" {
  region = var.region
}

# Call the VPC module
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = data.aws_availability_zones.available.names
  vpc_name             = var.vpc_name
}
# Fetch the available AZs dynamically
data "aws_availability_zones" "available" {}
# Call the ALB module
module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_name       = var.alb_name
}

# Call the EC2 Auto Scaling Group module
module "ec2" {
  source               = "./modules/ec2"
  vpc_id               = module.vpc.vpc_id
  private_subnets      = module.vpc.private_subnets
  instance_type        = "t2.micro"
  key_name             = var.key_name
  alb_target_group_arn = module.alb.target_group_arn
  image_id             = var.image_id
}

# Call the RDS module
module "rds" {
  source          = "./modules/rds"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  db_name         = var.db_name
  db_username     = var.db_username
  db_password     = var.db_password
}
