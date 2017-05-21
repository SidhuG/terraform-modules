variable "vpc_tag" {
  description = "Tag to be assigned to the VPC"
  default = "env_dev"
}

variable "access_key" { 
  description = "AWS access key"
}

variable "secret_key" { 
  description = "AWS secret access key"
}

variable "region"     { 
  description = "AWS region to host your network"
  default     = "eu-west-1" 
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.128.0.0/24"
}

variable "private_subnet1_cidr" {
  description = "CIDR for private subnet1"
  default     = "10.128.16.0/20"
}

variable "private_subnet2_cidr" {
  description = "CIDR for private subnet2"
  default = "10.128.32.0/20"
}

/* Ubuntu 16.04 amis by region */
/* use https://cloud-images.ubuntu.com/locator/ec2/ */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    eu-west-1 = "ami-6c101b0a" 
    eu-west-2 = "ami-056d7a61"
  }
}

/* Setup our aws provider */
provider "aws" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  region      = "${var.region}"
}

/* Define our vpc */
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags { 
    Name = "${var.vpc_tag}" 
  }
}