
module "website_s3_bucket" {
  
  source = "./mymodule"
  bucket_name = "my-mangesh4558-world"
  tags = {
      mys3 = "test"
  }
}