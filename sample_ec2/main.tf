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

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  //default VPCが設定されてない場合は以下を設定する
    //subnet_id = "subnet-019f2xxxxxxxxxxxxxx"
  tags = {
    Name = var.name
  }
//  lifecycle {
//    create_before_destroy = true
//    prevent_destroy = true
//  }
}