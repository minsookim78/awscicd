#alb-autoscaling-GP.tf


resource "aws_autoscaling_group" "user05-web80" {
  name = "${aws_launch_configuration.user05-web80.name}-asg"

  min_size             = 1
  desired_capacity     = 2
  max_size             = 3

  health_check_type    = "ELB"
  #load_balancers= ["${aws_alb.alb.id}" ] #classic
  target_group_arns   = ["${aws_alb_target_group.user05-frontend80.arn}"]
  #alb = "${aws_alb.alb.id}"
  
  launch_configuration = "${aws_launch_configuration.user05-web80.name}"
  ####  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]  아ㅐㄹ vpc_zone_identifier 와 중복

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity="1Minute"

  vpc_zone_identifier  = [
       "${aws_subnet.user05-public_1a.id}",
       "${aws_subnet.user05-public_1b.id}"
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "user05-web80-autoscaling"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "user05-asg-attachment80" {
  autoscaling_group_name = aws_autoscaling_group.user05-web80.id
  alb_target_group_arn   = aws_alb_target_group.user05-frontend80.arn
}