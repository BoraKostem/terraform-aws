resource "aws_instance" "aws-terraform" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "****"
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo su
              echo Hello from aws-terraform! > /var/www/html/index.html
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
  tags = {
    Name = "aws-terraform-hands-on"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.aws-terraform.public_dns} > ip_address.txt"
  }
  vpc_security_group_ids = [aws_security_group.aws-terraform-bodyguard-1.id, aws_security_group.aws-terraform-bodyguard-2.id]
}

resource "aws_security_group" "aws-terraform-bodyguard-1" {
    name = "ec2-aws-terraform-sg-ssh"
    description = "Allow SSH inbound traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #added outbound rule to allow all traffic (otherwise, the instance cannot connect to the internet :// )
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "aws-terraform-bodyguard-2" {
    name = "ec2-aws-terraform-sg-http-https"
    description = "Allow HTTP and HTTPS inbound traffic"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}