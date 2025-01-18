provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "Bucket-Terra" {
  bucket = "ezeabasili-01-terraform"

  tags = {
    Name        = "Statefile bucket"
  }
}

resource "aws_dynamodb_table" "DynamoDB-Terra" {
  name           = "Terraform-lock-key"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}