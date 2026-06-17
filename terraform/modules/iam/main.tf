resource "aws_iam_role" "ecs_execution_role" {
  name = "${var.project_name}-${var.environment}-ecs-exec-role"

  assume_role_policy = data.aws_iam_policy_document.ecs_trust.json

  tags = {
    Name        = "${var.project_name}-ecs-exec-role"
    environment = var.environment
  }
}

data "aws_iam_policy_document" "ecs_trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}


resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


resource "aws_iam_role" "ecs_task_role" {
  name = "${var.project_name}-${var.environment}-ecs-task-role"

  assume_role_policy = data.aws_iam_policy_document.ecs_trust.json

  tags = {
    Name        = "${var.project_name}-ecs-task-role"
    environment = var.environment
  }
}