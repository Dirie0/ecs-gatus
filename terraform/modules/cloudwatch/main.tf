resource "aws_cloudwatch_log_group" "app" {
  name              = "/${var.project_name}/${var.environment}/app"
  retention_in_days = 30

  tags = {
    Service     = "${var.project_name}"
    Environment = "${var.environment}"
  }
}


resource "aws_cloudwatch_log_group" "monitoring" {
  name              = "/${var.project_name}/${var.environment}/monitoring"
  retention_in_days = 14

  tags = {
    Service     = "${var.project_name}"
    Environment = "${var.environment}"
  }
}
