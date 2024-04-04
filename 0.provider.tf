terraform {
  required_version = "<= 1.7.5"
  required_providers {
    aws = {
      version = "<= 5.5.0"
      source  = "hashicorp/aws"
    }
    azurerm = {
      version = "<= 4.0.0"
      source  = "hashicorp/azurerm"
    }
  }
  backend "s3" {
    bucket = "raghuinfra"
    key    = "raghuinfradev.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  features {}
}
