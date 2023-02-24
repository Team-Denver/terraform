terraform {
  backend "s3" {
    
    bucket = "poc-adot-remote-state"
    key = "terraform/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46.0"
    }



    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }
  }

  required_version = "~> 1.2"
}

