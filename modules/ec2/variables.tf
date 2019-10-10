//required
variable "name" {
  description = "sample_ec2のインスタンスの名前です。"
  type = string
}

//optional
variable "instance_type" {
  description = "sample_ec2のinstance_typeです"
  type = string
  default = "t2.micro"
}