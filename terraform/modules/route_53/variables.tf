variable "aws_alb_zone_id" {
  description = "The zone ID of the ALB"
  type        = string
}

variable "aws_alb_dns_name" {
  description = "The DNS name of the ALB"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the Route 53 record"
  type        = string
}