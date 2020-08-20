resource "aws_security_group" "user05-alb-SG" {
    name = "user05-alb-SG"
    description = "open HTTP port for ALB"
    vpc_id = aws_vpc.user05-vpc.id
    
        ingress {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
                }
  #      ingress {
  #          from_port = 8080
  #          to_port = 8080
  #          protocol = "tcp"
  #          cidr_blocks = ["0.0.0.0/0"]
  #              }
  #     ingress {
  #         from_port = 443
  #         to_port = 443
  #         protocol = "tcp"
  #         cidr_blocks = ["0.0.0.0/0"]
  #             }
  #     ingress {
  #         from_port = 123
  #         to_port = 123
  #         protocol = "udp"
  #         cidr_blocks = ["0.0.0.0/0"]
  #             }
  #     ingress {
  #         from_port = 9418
  #         to_port = 9418
  #         protocol = "udp"
  #         cidr_blocks = ["0.0.0.0/0"]
  #             }
        ingress {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
                 }
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
                }
    tags = {
        Name = "user05-alb-SG"
            }
}