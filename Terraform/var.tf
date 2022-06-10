variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "main_vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "cluster_name" {
  default = "eks_cluster_7dsfsgllx"
  type    = string
}

variable "public_subnet1" {
  type    = string
  default = "10.10.1.0/24"
}

variable "public_subnet2" {
  type    = string
  default = "10.10.2.0/24"
}

variable "public_subnet3" {
  type    = string
  default = "10.10.3.0/24"
}

variable "private_subnet1" {
  type    = string
  default = "10.10.100.0/24"
}

variable "private_subnet2" {
  type    = string
  default = "10.10.101.0/24"
}

variable "private_subnet3" {
  type    = string
  default = "10.10.102.0/24"
}

variable "az1_id" {
  type    = string
  default = "apse1-az1"
}

variable "az2_id" {
  type    = string
  default = "apse1-az2"
}