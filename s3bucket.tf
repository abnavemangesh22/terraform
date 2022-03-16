

resource "aws_s3_bucket" "mys3bucket" {
  for_each = {
    dev = "my-devapp1-bucket"
    prod = "mydevprod1-bucket"
    stage = "mydevstage1-bucket" 
  }
  bucket = "${each.key}-${each.value}"
  acl = "private"

  tags = {
      bucketname = "${each.key}-${each.value}"
      env = each.key
  }
}