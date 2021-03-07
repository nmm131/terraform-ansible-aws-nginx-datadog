variable "profile" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "shared_credentials_file" {
  type = string
}
variable "ami" {
  type      = string
  sensitive = true
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "aws_security_groups" {
  type = list(string)
}
variable "connection_type" {
  type = string
}
variable "connection_user" {
  type = string
}
variable "connection_port" {
  type = number
}
variable "connection_private_key" {
  type = string
}
variable "connection_agent" {
  type = bool
}
variable "aws_security_group_name" {
  type = string
}
variable "cidr_blocks" {
  type = list(string)
}
variable "ingress_1" {
  type = string
}
variable "ingress_2" {
  type = string
}
variable "ingress_protocol" {
  type = string
}
