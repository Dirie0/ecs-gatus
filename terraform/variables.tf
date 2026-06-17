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