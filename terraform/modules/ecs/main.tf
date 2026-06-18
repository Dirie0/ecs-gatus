resource "aws_ecs_cluster" "ecs_gatus_cluster" {
  name = "ecs_gatus_cluster"

  tags = {
    Name        = var.project_name 
    environment = var.environment
  }

}

