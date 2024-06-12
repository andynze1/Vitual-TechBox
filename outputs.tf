output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.andynze_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = aws_subnet.andynze_public_subnet_01.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet."
  value       = aws_subnet.andynze_private_subnet_02.id
}

output "jenkins_instance_id" {
  description = "The ID of the Jenkins instance."
  value       = aws_instance.jenkins_master.id
}
