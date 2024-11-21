# Initializing the remote backend S3 for storing the terraform state file

terraform {
  backend "s3" {
    bucket = "abrar-test-bucket"
    key    = "abrar/terraform.tf"
    region = "ap-south-1"
  }
}