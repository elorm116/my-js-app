
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "AWS key pair name"
  type        = string
  default = "DevOps"  # Replace with your actual key pair name
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "simple-js-app"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  type        = string
  default     = "vpc-093b4936460363948"
}

variable "subnet_id" {
  description = "Existing subnet ID"
  type        = string
  default     = "subnet-0a0b66fbf7c4b66c0"
}

variable "ami_id" {
    description = "AWS AMI configuration"
    type        = string
}