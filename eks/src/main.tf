terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">3.27"
    }
  }

  required_version = ">=0.14.9"

}

provider "aws" {
  version = ">3.0"
  region  = var.general_config.region
}