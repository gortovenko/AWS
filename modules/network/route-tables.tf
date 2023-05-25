# Route table to IGW
resource "aws_route_table" "public_vpc_to_igw" {
    vpc_id = aws_vpc.vpc1.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw_vpc1.id
    }
    tags = {
        Name = "${var.env}-route-public-subnets"
    }
    depends_on = [ aws_vpc.vpc1, aws_internet_gateway.igw_vpc1 ]
}

resource "aws_route_table" "route_table_private_to_nat_vpc2" {
  count = length(var.subnet_vpc2)
  vpc_id = aws_vpc.vpc2.id

  route {
    cidr_block = var.peering_vpc2
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc2.id

  }
  
  tags = {
    Name = "VPC-route-table2-${random_integer.random.id}-${count.index +1}"
  }
}


resource "aws_route_table" "route_table_private_to_nat_vpc3" {
  count = length(var.subnet_vpc3)
  vpc_id = aws_vpc.vpc3.id

  route {
    cidr_block = var.peering_vpc3
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc2_vpc3.id

  }
  
  tags = {
    Name = "VPC-route-table3-${random_integer.random.id}-${count.index +1}"
  }
}


resource "random_integer" "random" {
  min = 1
  max = 100
}