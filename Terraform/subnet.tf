##########################################
####              PUBLIC              ####
##########################################
resource "aws_subnet" "PublicSubnet1a" {
  vpc_id =  aws_vpc.custom_vpc.id
  cidr_block = "${var.public_subnet1}"
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name                        = "public_subnet_1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "PublicSubnet1b" {
  vpc_id =  aws_vpc.custom_vpc.id
  cidr_block = "${var.public_subnet2}"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = true
  tags = {
    Name                        = "public_subnet_1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "PublicSubnet1c" {
  vpc_id =  aws_vpc.custom_vpc.id
  cidr_block = "${var.public_subnet3}"
  availability_zone = "ap-southeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name                        = "public_subnet_1c"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

##########################################
####              PRIVATE             ####
##########################################
resource "aws_subnet" "PrivateSubnet1a" {
  vpc_id =  aws_vpc.custom_vpc.id
  cidr_block = "${var.private_subnet1}"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name                              = "private_subnet_1a"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "PrivateSubnet1b" {
  vpc_id =  aws_vpc.custom_vpc.id
  cidr_block = "${var.private_subnet2}"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name                              = "private_subnet_1b"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "PrivateSubnet1c" {
  vpc_id =  aws_vpc.custom_vpc.id
  cidr_block = "${var.private_subnet3}"
  availability_zone = "ap-southeast-1c"

  tags = {
    Name                              = "private_subnet_1c"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}