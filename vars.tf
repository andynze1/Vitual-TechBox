variable "region" {
  description = "The AWS region to deploy resources."
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet."
  default     = "10.1.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet."
  default     = "10.1.2.0/24"
}

variable "availability_zone_1" {
  description = "The availability zone for the public subnet."
  default     = "us-east-2a"
}

variable "availability_zone_2" {
  description = "The availability zone for the private subnet."
  default     = "us-east-2b"
}

variable "ami_id_ubuntu" {
  description = "AMI ID for Ubuntu instances."
  default     = "ami-09040d770ffe2224f"
}

variable "instance_type" {
  description = "The instance type for EC2 instances."
  default     = "t2.large"
}

variable "key_name" {
  description = "The key name for EC2 instances."
  default     = "aws-us-east-2-key"
}

variable "jenkins_userdata" {
  description = "Path to the Jenkins user data script."
  default     = "user-data/jenkins_userdata.sh"
}

variable "U_USER" {
  default = "ubuntu"
}