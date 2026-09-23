provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "example" {
    ami = "ami-0b6d9d3d33ba97d99" #Ubuntu Server 26.04 LTS (HVM),EBS General Purpose (SSD) Volume Type
    instance_type = "t3.micro"
    subnet_id = "subnet-070d4820ded4c7543" #us-east-1a
    key_name = "E-com"
}