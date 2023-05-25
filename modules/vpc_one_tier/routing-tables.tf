resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-public-routing-table"
    Owner           = "Pavlo H"
    Company_Name    = "Carrectly"
  }
}



resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway1.id
  }

  tags = {
    Name = "${var.env}-private-routing-table1"
    Owner           = "Pavlo H"
    Company_Name    = "Carrectly"
  }
}


resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway2.id
  }

  tags = {
    Name = "${var.env}-private-routing-table2"
    Owner           = "Pavlo H"
    Company_Name    = "Carrectly"
  }
}