variable "aws_region" {
    default = "eu-west-1"
    type = string
}
variable "cidr_block" {
    type = string
}

variable "environment" {
    type = string
}
variable "public_subnets" {
    type = list
}
variable "private_subnets" {
    type = list
}
variable "lb_type" {
    default = "network"
    type = string
}

variable "iam_instance_profile" {
    type = string

}

variable "ami_id" {
    type = string
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "key_name" {
    type = string
}

variable "volume_size" {
    type = number
    default = 30
}

variable "volume_type" {
    type = string
    default = "gp3"
}