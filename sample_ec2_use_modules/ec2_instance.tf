provider "aws" {
  //バージョンを固定
  version = "2.23.0"
  region  = "ap-northeast-1"
}

terraform {
  //バージョンを固定
  required_version = "0.12.6"
  backend "s3" {
    // 保存するbucketとObject keyを
    bucket = "nari-sample-terraform-backend"
    key    = "sample_ec2/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

module "samole_ec2" {
  source = "../modules/ec2"
  name = "HelloWorld2"
}