/*
resource "aws_s3_bucket" "mybucket" {
  
bucket = "${var.app_name}-${var.environment_name}-bucket"
acl = "private"
tags = {
    Name = "${var.app_name}-${var.environment_name}-bucket"
    environment = "var.environment_name"
}

}
*/

locals {
  
  bucket-name = "${var.app_name}-${var.environment_name}-bucket"

}


resource "aws_s3_bucket" "mybucket" {
  
  bucket = local.bucket-name
  acl = "private"
  tags = {
      Name = local.bucket-name
  }

}


