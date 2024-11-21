terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.1"
    }
  }
}

# Create a AWS EC2 Instance

resource "aws_instance" "Prac" {
  ami = var.ami
  instance_type = var.instance_type # getting values from varibles

  tags = {
    Name = "Backend Demo" # Instance name
  }
}

# Create S3 bucket as backend for storing terraform state files

resource "aws_s3_bucket" "Backend" {
  bucket = "abrar-test-bucket" # S3 bucket name

  tags = {
    Name        = "My bucket"
    Environment = "Demo"
  }
}

# Create Dynamo DB for locking the state  

resource "aws_dynamodb_table" "example" {
  name             = "Backend"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}