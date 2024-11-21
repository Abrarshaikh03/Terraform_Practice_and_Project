terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.1"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
	ami = "ami-04dd23e62ed049936"
	instance_type = "t2.micro"

	tags = {
		Name = "Terraform Demo"
	}
}
