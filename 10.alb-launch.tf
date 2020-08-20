#alb-launch.tf

resource "aws_launch_configuration" "user05-web80" {
  name_prefix = "user05-autoscaling-web80"
 
  image_id = var.amazon_linux_ca
  instance_type = "t2.small"
  
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
  
  key_name = "user05-key"
  security_groups = [
    "${aws_security_group.user05-alb-SG.id}",
    "${aws_default_security_group.user05-vpc-dft-sg.id}",
  ]
  associate_public_ip_address = true
  

  user_data = <<USER_DATA
#!/bin/bash

sudo yum -y update
sudo yum install -y aws-cli
#sudo yum -y install wget
cd /home/ec2-user
yum -y install https://aws-codedeploy-ca-central-1.s3.amazonaws.com/latest/codedeploy-agent.noarch.rpm


sudo service codedeploy-agent start
  USER_DATA

  lifecycle {
    create_before_destroy = true
  }
}