#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region  = var.region
  profile = var.profile

}

terraform {
  required_version = "<= 1.4.14" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
}
