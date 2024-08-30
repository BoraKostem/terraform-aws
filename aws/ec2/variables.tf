variable "aws_region" {
  description = "The AWS region to launch the EC2 instance in"
  type = string
  default = "eu-central-1"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type = string
}