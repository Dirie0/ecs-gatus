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
variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}


variable "environment" {
  description = "The environment name (dev, staging, prod)"
  type        = string
}