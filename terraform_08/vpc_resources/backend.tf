terraform {
  backend "s3" {
    bucket         = "ezeabasili-01-terraform"
    key            = "statefile-path"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "Terraform-lock-key"
  }
}
