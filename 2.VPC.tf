#VPC.tf VPC생성


resource "aws_vpc" "user05-vpc" {
    cidr_block = "5.0.0.0/16"  
    enable_dns_hostnames = true
    enable_dns_support = true
    instance_tenancy = "default"
    tags = {
        Name = "user05-vpc"
        }
}