terraform {
  backend "s3" {
    bucket = "virtual-techboxs3"
    key    = "terraform/terraform-state-file"
    region = "us-east-2"
  }
}