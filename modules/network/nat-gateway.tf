resource "aws_nat_gateway" "nat_gateway1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.subnet_vpc1[0].id

  tags = {
    Name = "${var.env}-nat1"
    Owner           = "Pavlo H"
    Company_Name    = "Carrectly"
  }
  depends_on = [aws_internet_gateway.igw_vpc1]
}


resource "aws_nat_gateway" "nat_gateway2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.subnet_vpc1[1].id

  tags = {
    Name = "${var.env}-nat2"
    Owner           = "Pavlo H"
    Company_Name    = "Carrectly"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw_vpc1]
}


