variable "project_name" {
  type = string
}


variable "environment" {
  type = string
}

variable "task_cpu" {
  type = number
}

variable "task_memory" {
  type = number
}   

variable "app_port" {
  type = number
}

variable  "ecr_repository_url" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "ecs_task_execution_role_arn" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "ecs_security_group_id" {
  type = string
}
variable "app_count" {
  type = number
}

variable "target_group_arn" {
  type = string
}