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


module ecs {
  source = "./modules/ecs"

  project_name = var.project_name
  environment  = var.environment
  task_cpu     = var.task_cpu
  task_memory  = var.task_memory
  app_port     = var.app_port
  ecr_repository_url = module.ecr.repository_url
  aws_region   = var.aws_region
  ecs_execution_role_arn = module.iam.ecs_execution_role_arn
  private_subnet_ids = module.vpc.private_subnet_ids
  ecs_security_group_id = module.security_groups.security_group_ecs_id
  app_count    = var.app_count
  target_group_arn = module.alb.target_group_arn
  app_image = var.app_image
}
