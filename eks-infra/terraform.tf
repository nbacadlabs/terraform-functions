terraform {
  backend "s3" {
    bucket         = "nbmy-terraform-state-bucket-12345"
    key            = "../bootstrap/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}