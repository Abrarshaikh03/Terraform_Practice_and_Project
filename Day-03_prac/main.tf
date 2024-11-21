terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias = "east"
}

provider "aws" {
  region = "us-west-1"
  alias = "west"
}

resource "aws_instance" "Demo1" {
  ami = var.ami
  instance_type = var.instance_type
  provider = "aws.east"

  tags = {
    Name = "Terraform Demo East"
  }
}

resource "aws_instance" "Demo2" {
  ami = var.ami
  instance_type = var.instance_type
  provider = "aws.west"

  tags = {
    Name = "Terraform Demo West"
  }
}