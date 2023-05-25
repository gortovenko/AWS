resource "aws_route_table_association" "aws_route_table_association_public" {
    count = length(aws_subnet.subnet_vpc1[*].id)

    route_table_id = aws_route_table.public_vpc_to_igw.id
    subnet_id = aws_subnet.subnet_vpc1[count.index].id 
}

resource "aws_route_table_association" "private_vpc2_associate" {
  count = length(var.subnet_vpc2)
  subnet_id      = element(aws_subnet.subnet_vpc2[*].id, count.index)
  route_table_id = element(aws_route_table.route_table_private_to_nat_vpc2[*].id, count.index)
}



resource "aws_route_table_association" "private_vpc3_associate" {
  count = length(var.subnet_vpc3)
  subnet_id      = element(aws_subnet.subnet_vpc3[*].id, count.index)
  route_table_id = element(aws_route_table.route_table_private_to_nat_vpc3[*].id, count.index)
}
