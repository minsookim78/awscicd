


#autoscale-alb.tf
resource "aws_alb" "user05-alb80" {
    name = "user05-alb80"
    internal = false
    security_groups = ["${aws_security_group.user05-alb-SG.id}"]
    subnets = [
       "${aws_subnet.user05-public_1a.id}",
       "${aws_subnet.user05-public_1b.id}"
    ]
    access_logs {
         bucket = "${aws_s3_bucket.user05s3.id}"
        #bucket = "aws_s3_bucket.user05s3.id"
        prefix = "frontend-alb"
        enabled = true
    }
    tags = {
        Name = "user05-alb-autoscaling80"
    }
    lifecycle { create_before_destroy = true }
}

#resource "aws_alb" "user05-alb8080" {
#    name = "user05-alb-autoscaling8080"
#    internal = false
#    security_groups = ["${aws_security_group.user05-alb-SG.id}"]
#    subnets = [
#       "${aws_subnet.user05-public_1a.id}",
#       "${aws_subnet.user05-public_1b.id}"
#    ]
#    access_logs {
#        bucket = "${aws_s3_bucket.user05s3.id}"
#        prefix = "frontend-alb"
#        enabled = true
#    }
#    tags = {
#        Name = "user05-alb-autoscaling8080"
#    }
#    lifecycle { create_before_destroy = true }
#}