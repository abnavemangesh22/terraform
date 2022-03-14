# provider is heart of Terraform
# init phase is important because provider binaries would be
# downloaded at init phase.

provider "aws" {
  #access_key = "AKIAVHSB4WCPK2AZFCEB"
  #secret_key = "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"
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




