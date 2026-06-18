resource "aws_alb" "alb"{
    name = "${var.project_name}-alb"
    subnets = var.public_subnet_ids
    security_groups = [var.alb_security_group_id]

    tags = {
        Name        = var.project_name
        environment = var.environment
    }
}

resource "aws_alb_target_group" "alb_target_group" {
    name     = "${var.project_name}-alb-tg"
    port     = 8080
    protocol = "HTTPS"
    vpc_id   = var.vpc_id

    health_check {
        path                = "/health"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
        matcher             = "200-299"
    }

    tags = {
        Name        = var.project_name
        environment = var.environment
    }
}


resource "aws_alb_listener" "alb_listener" {
    load_balancer_arn = aws_alb.alb.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_alb_target_group.alb_target_group.arn
    }
}