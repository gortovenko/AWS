resource "aws_route_table_association" "subnet_public" {
  count = length(aws_subnet.public[*].id)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "subnet_private1" {
  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.private1.id
}


resource "aws_route_table_association" "subnet_private2" {
  subnet_id      = aws_subnet.private[1].id
  route_table_id = aws_route_table.private2.id
}
