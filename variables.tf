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
