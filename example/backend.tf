terraform {
  backend "s3" {
    bucket  = "ot-cloud-kit-bucket"
    key     = "ot/module/elastic-cache/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}