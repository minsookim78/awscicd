#DFT-SG.tf 기본 시큐리티 그룹 생성

resource "aws_default_security_group" "user05-vpc-dft-sg" {
    vpc_id= aws_vpc.user05-vpc.id
        ingress {
            protocol = -1
            self = true
            from_port = 0
            to_port = 0
            }
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            }
    tags = {
        Name = "user05-vpc-dft-sg"
            }
        }