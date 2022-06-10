resource "aws_nat_gateway" "NATGW" {
  # The Allocation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.NATEIP.id

  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.PublicSubnet1a.id

  # A map of tags to assign to the resource.
  tags = {
    Name = "NAT"
  }
}