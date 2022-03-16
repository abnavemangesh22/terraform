# provider is heart of Terraform
# init phase is important because provider binaries would be
# downloaded at init phase.

provider "aws" {
 
  region = "ap-south-1"
  profile = "default"
}

/*provider "oci" {
  tenancy_ocid = "<tenancy-ocid>"
  user_ocid = "<user-ocid>" 
  private_key_path = "<rsa-private-key-path>"
  fingerprint = "<fingerprint>"
  region = "<region-identifier>"
}
*/

provider "aws" {
    region = "ap-southeast-1"
    profile = "default"
    alias = "southeast"
}




