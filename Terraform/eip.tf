resource "aws_eip" "NATEIP" {
  depends_on = [aws_internet_gateway.IGW]
}