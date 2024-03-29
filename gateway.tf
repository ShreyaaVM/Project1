resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Facebook_igw"
  }

}

resource "aws_eip" "nat_eip" {
  vpc = true
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "my_nat_gateway"
  }
}

