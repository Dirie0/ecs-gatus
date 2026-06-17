variable "s3_bucket_name" { 
  type = string
  default = "tfstate-dirie-project"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}
