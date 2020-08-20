#alb-TG.tf :로드발란서 타겟그룹생성

resource "aws_alb_target_group" "user05-frontend80" {
name = "user05-frontend-TG80"
port = 80
protocol = "HTTP"
vpc_id = aws_vpc.user05-vpc.id
health_check {
interval = 30
path = "/"
healthy_threshold = 3
unhealthy_threshold = 3
}
tags = { Name = "Frontend Target Group" }
}

#alb-listener.tf

resource "aws_alb_listener" "user05-http80" {
load_balancer_arn = "${aws_alb.user05-alb80.arn}"
port = "80"
protocol = "HTTP"
default_action {
target_group_arn = "${aws_alb_target_group.user05-frontend80.arn}"
type = "forward"
}
}
