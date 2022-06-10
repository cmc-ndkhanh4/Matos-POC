resource "aws_internet_gateway" "IGW" {
  vpc_id =  aws_vpc.custom_vpc.id
  tags = {
    Name = "igw"
  }
}

# resource "aws_route" "route-igw" {
#   route_table_id = "${aws_vpc.custom_vpc.main_route_table_id}"
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id = "${aws_internet_gateway.IGW.id}"
# }