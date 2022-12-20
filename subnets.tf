resource "aws_subnet" "public-subnets" {
  count             = 3
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-publicsubnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count             = 3
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-privatesubnet-${count.index + 1}"
  }
}