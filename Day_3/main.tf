provider "aws" {
    region = "us-east-1"
}

module "ec2_creation" {
    source = "./modules/ec2_instance"
    ami_value = "ami-0b6d9d3d33ba97d99" #Ubuntu Server 26.04 LTS (HVM),EBS General Purpose (SSD) Volume Type
    instance_type_value = "t3.micro" #us-east-1a
    key_name_value = "E-com"
    VM_name = "My EC2 instance"
}