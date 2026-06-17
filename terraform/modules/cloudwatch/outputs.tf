output "app_log_group" {
  value = aws_cloudwatch_log_group.app
}

output "monitoring_log_group" {
  value = aws_cloudwatch_log_group.monitoring
}