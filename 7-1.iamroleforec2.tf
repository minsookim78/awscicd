resource "aws_iam_role" "user05_role" {
  name = "user05_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      tag-key = "tag-value"
  }
}


resource "aws_iam_instance_profile" "user05_profile" {
  name = "user05_profile"
  role = "${aws_iam_role.user05_role.name}"
}



resource "aws_iam_role_policy" "user05_policy" {
  name = "user05_policy"
  role = "${aws_iam_role.user05_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
     "Statement": [
      {
      "Effect" : "Allow",
      "Action" : [
        "autoscaling:*",
        "codedeploy:*",
        "ec2:*",
        "s3:*",
        "elasticloadbalancing:*"
        ],
      "Resource" : "*"                         #<-- 요기에 해당 S3버킷ID 등록하거나 세분화 해야 함..
    }   
        
  ]
}
EOF

}

