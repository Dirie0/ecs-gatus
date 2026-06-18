variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain_name" {
    type = string
}

variable "project_name" {
    type = string
}
variable "repository_name" {
    type = string
}

variable "vpc_config" {
  type = object({
    cidr_block = string
    name       = string
  })
}

variable "public_subnet_config" {
  type = map(object({
    cidr_block = string
    az         = string
  }))
}

variable "private_subnet_config" {
  type = map(object({
    cidr_block = string
    az         = string
  }))
}

variable "task_cpu" {
  type = number
}

variable "task_memory" {
  type = number
}
 
variable "app_port"{
  type = number
}

variable "app_count" {
  type = number
}

variable "ecr_repository_url" {
  type = string
}

variable "app_image" {
  type = string
}
