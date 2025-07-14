output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.app_server.public_dns
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.app_server.private_ip
}

output "vpc_id" {
  description = "VPC ID used"
  value       = data.aws_vpc.existing.id
}

output "subnet_id" {
  description = "Subnet ID used"
  value       = data.aws_subnet.existing.id
}