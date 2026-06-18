aws_region      = "eu-west-1"
environment = "dev"
domain_name = "dirieisseprojects.co.uk" 
project_name = "ecs-gatus"
repository_name = "ecr_repository_gatus"

vpc_config = {
  cidr_block = "10.0.0.0/22"
  name       = "dev-vpc"
}

public_subnet_config = {
  public_a = {
    cidr_block = "10.0.0.0/24"
    az         = "eu-west-1a"
  }

  public_b = {
    cidr_block = "10.0.1.0/24"
    az         = "eu-west-1b"
  }
}

private_subnet_config = {
  private_a = {
    cidr_block = "10.0.2.0/24"
    az         = "eu-west-1a"
  }

  private_b = {
    cidr_block = "10.0.3.0/24"
    az         = "eu-west-1b"
  }
}


task_cpu = 256

task_memory = 512

app_port = 8080

app_count = 1

ecr_repository_url = "930067561901.dkr.ecr.eu-west-1.amazonaws.com/ecs-gatus-dev"

app_image = "930067561901.dkr.ecr.eu-west-1.amazonaws.com/ecs-gatus-dev:latest"