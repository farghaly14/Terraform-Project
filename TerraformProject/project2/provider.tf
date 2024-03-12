terraform {
  backend "s3" {
    bucket = "amterra"
    key    = "state"
    region = "us-west-2"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}
