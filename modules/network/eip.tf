resource "aws_eip" "nat1" {

    depends_on = [ aws_internet_gateway.igw_vpc1 ]
}

resource "aws_eip" "nat2" {

    depends_on = [ aws_internet_gateway.igw_vpc1 ]
}
/*
resource "aws_eip" "nat3" {

    depends_on = [ aws_internet_gateway.igw_vpc1 ]
}
resource "aws_eip" "nat4" {

    depends_on = [ aws_internet_gateway.igw_vpc1 ]
}*/