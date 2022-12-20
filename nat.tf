resource "aws_eip" "nat-epi" {
  tags = {
    Name = "EIP-NAT"
  }
}

resource "aws_nat_gateway" "devops3" {
  allocation_id = aws_eip.nat-epi.id
  subnet_id     = aws_subnet.public-subnets.0.id

  tags = {
    Name = "devops3"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.default]
}