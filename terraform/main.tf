module "vpc" {
  source = "./modules/vpc"

  vpc_config           = var.vpc_config
  public_subnet_config = var.public_subnet_config
  private_subnet_config = var.private_subnet_config

  project_name = var.project_name
  environment  = var.environment
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment
}

module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
  environment  = var.environment
  repository_name = var.repository_name
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}


module "cloudwatch" {
  source = "./modules/cloudwatch"

  project_name = var.project_name
  environment  = var.environment
}

module alb {
  source = "./modules/alb"

  project_name = var.project_name
  environment  = var.environment
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.security_group_alb_id
  vpc_id = module.vpc.vpc_id
}

