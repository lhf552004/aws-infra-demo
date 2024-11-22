terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-demo2024"
    key            = "devops-demo/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
