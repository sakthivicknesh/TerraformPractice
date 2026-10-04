provider "aws" {
  region = "us-east-1"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr

  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "terraform-igw"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-route-table"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "webSg" {
  name        = "web"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-0b6d9d3d33ba97d99" # Ubuntu Server 26.04 LTS (HVM), EBS General Purpose (SSD) Volume Type
  instance_type          = "t3.micro"

  # Use the existing key pair registered in my AWS
  key_name = "E-com"

  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id              = aws_subnet.sub1.id

  tags = {
    Name = "Terraform-Web-Server"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Users/sakthi/Downloads/E-com.pem")
    host        = self.public_ip
    timeout     = "5m"
  }

  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y python3-pip python3-venv",
      "python3 -m venv /home/ubuntu/venv",
      "/home/ubuntu/venv/bin/pip install flask",
      "sudo nohup /home/ubuntu/venv/bin/python /home/ubuntu/app.py > /home/ubuntu/app.log 2>&1 &"
    ]
  }
}

