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