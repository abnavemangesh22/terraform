
# 0.12 we dont have a terraform block.
# 0.13 they introducted terraform block

terraform {
 required_version = "= 1.1.2"
 required_providers {
   aws = {
       source = "hashicorp/aws"
       version = "= 3.74.3"
   }
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
    oci = {
      source = "hashicorp/oci"
      version = "4.67.0"
    }
 }
}

