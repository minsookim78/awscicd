#variable.tf :변수생성

variable "amazon_linux_ca" {
# Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type  리젼에서 호출할 기본AMI 정보 입력
     default = "ami-0269a0d783544d806" 
    # 리눅스2
     # default ="ami-013d1df4bcea6ba95"
     # 파일에있는것
     #default = "ami-fd55ec99"
}


variable "dev_keyname" {
# EC2 접속시 필요한 키 이름 설정
    default = "user05-key"
}

# ALB 설정시 필요한 account id 설정
variable "alb_account_id_ca" {
    default = "985666609251"
}
