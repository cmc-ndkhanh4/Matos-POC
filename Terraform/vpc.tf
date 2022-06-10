resource "aws_vpc" "custom_vpc" {
  cidr_block       = var.main_vpc_cidr

  instance_tenancy = "default"
  
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "custom_vpc"
  }
}