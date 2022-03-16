
variable "aws_region" {
  description = "Region Specific Information"
  type = string
  default = "ap-south-1"
}

variable "ec2_ami_id" {
  type = string
  default = "ami-052cef05d01020f1d"
  validation {
    condition = length(var.ec2_ami_id) > 4 && substr(var.ec2_ami_id, 0, 4) == "ami-"
    error_message = "This is invalid image id."
  }
}

variable "ec2_instance_count" {
  type = number
  default = 3
}

/*variable "ec2_instance_type" {
    type = list(string)
    default = ["t3.micro", "t3.small", "t3.large"]
}
*/

variable "ec2_instance_type" {
  type = map(string)
  default = {
    "small" = "t3.micro"
    "medium" = "t3.medium"
    "big" = "t3.large"
  }
}