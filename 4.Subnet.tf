#Subnet.tf : 서브넷 생성

resource "aws_subnet" "user05-public_1a" { 
vpc_id = aws_vpc.user05-vpc.id
availability_zone = "ca-central-1a"
cidr_block = "5.0.1.0/24"
tags = {
Name = "user05-public-1a"
}
}

resource "aws_subnet" "user05-public_1b" {
vpc_id = aws_vpc.user05-vpc.id
availability_zone = "ca-central-1b"
cidr_block = "5.0.2.0/24"
tags = {
Name = "user05-public-1b"
}
}