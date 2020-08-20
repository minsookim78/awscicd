
resource "aws_internet_gateway" "user05-IGW" {
vpc_id = aws_vpc.user05-vpc.id
tags = {
Name = "user05-IGW"
}
}

# 1 리젼용 RT 생성
resource "aws_route_table" "rt-user05-public"{
    vpc_id= aws_vpc.user05-vpc.id
        route {
            cidr_block= "0.0.0.0/0"
            gateway_id= aws_internet_gateway.user05-IGW.id
              }
    tags = {
    Name = "rt-user05-public"
        }
}
# 1 리젼용 VPC RT에 서브넷 할당
resource "aws_route_table_association" "rt-user05-public_1a"{
subnet_id= aws_subnet.user05-public_1a.id
route_table_id=aws_route_table.rt-user05-public.id
}

resource "aws_route_table_association" "rt-user05-public_1b"{
subnet_id= aws_subnet.user05-public_1b.id
route_table_id= aws_route_table.rt-user05-public.id
}
