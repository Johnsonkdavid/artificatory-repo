
provider "aws" {
  region     = "eu-central-1"
}

terraform {
  required_providers {
    mycloud = {
      source  = "hashicorp/aws"
      version = ">= 1.0"
    }
  }
}

