resource "aws_route_table" "PublicRT" {
  vpc_id =  aws_vpc.custom_vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = "publicroute"
  }
}

resource "aws_route_table" "PrivateRT" {
  vpc_id =  aws_vpc.custom_vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.NATGW.id
  }
  tags = {
    Name = "privateroute"
  }
}

##########################################
####        PUBLIC Association        ####
##########################################
resource "aws_route_table_association" "PublicRTassociation1" {
  subnet_id      = "${aws_subnet.PublicSubnet1a.id}"
  route_table_id = "${aws_route_table.PublicRT.id}"
}

resource "aws_route_table_association" "PublicRTassociation2" {
  subnet_id      = "${aws_subnet.PublicSubnet1b.id}"
  route_table_id = "${aws_route_table.PublicRT.id}"
}

resource "aws_route_table_association" "PublicRTassociation3" {
  subnet_id      = "${aws_subnet.PublicSubnet1c.id}"
  route_table_id = "${aws_route_table.PublicRT.id}"
}

##########################################
####        PRIVATE Association       ####
##########################################
resource "aws_route_table_association" "PrivateRTassociation1" {
  subnet_id      = "${aws_subnet.PrivateSubnet1a.id}"
  route_table_id = "${aws_route_table.PrivateRT.id}"
}

resource "aws_route_table_association" "PrivateRTassociation2" {
  subnet_id      = "${aws_subnet.PrivateSubnet1b.id}"
  route_table_id = "${aws_route_table.PrivateRT.id}"
}

resource "aws_route_table_association" "PrivateRTassociation3" {
  subnet_id      = "${aws_subnet.PrivateSubnet1c.id}"
  route_table_id = "${aws_route_table.PrivateRT.id}"
}