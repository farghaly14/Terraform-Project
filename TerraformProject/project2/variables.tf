
variable "ami" {
  description = "to define the ami of ec2 instance"
  type        = string
}

variable "instance_type" {
  description = "to define the instance_type of ec2 instance"
  type        = string
}

variable "cidr_vpc" {
  type = string
}

variable "cidr_public_subnet" {
  type = string
}

variable "cidr_private_subnet" {
  type = string
}


variable "dyn_db" {
  type        = string
  description = "The name of the DynamoDB table"
}


variable "bucket_s3" {
  type = string
}