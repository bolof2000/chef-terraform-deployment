variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-5f847422"
}
variable "subnet-id-01" {
  default = "subnet-ddf88c90"
}
variable "subnet-id-02" {
  default = "subnet-2f4eef70"
}
variable "instance-type" {
  default = "t2.medium"
}
variable "key-name" {
  default = "vprofilekey2"  #not real
}

variable "max_size" {
  default = 3
}
variable "min_size" {
  default = 3
}
variable "desired" {
  default = 3
}

variable "ami" {
  default = "ami-0e472ba40eb589f49"
}