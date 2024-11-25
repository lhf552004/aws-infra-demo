variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "SSH key pair name for EC2 instances"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name for the RDS database"
  type        = string
  sensitive   = true
}

variable "vpc_name" {
  description = "vpc name"
  type        = string
}

variable "alb_name" {
  description = "alb name"
  type        = string
}

variable "state_key" {
  description = "Path to the Terraform state file in S3"
  type        = string
}

variable "image_id" {
  description = "Image Id for aws_launch_template"
  type        = string
}

