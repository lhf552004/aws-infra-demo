terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-demo2024"
    key            = var.state_key
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
