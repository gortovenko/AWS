resource "aws_vpc_peering_connection" "vpc1_vpc2" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.vpc1.id
  vpc_id        = aws_vpc.vpc2.id
  peer_region = var.zone 
}



resource "aws_vpc_peering_connection" "vpc2_vpc3" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.vpc2.id
  vpc_id        = aws_vpc.vpc3.id
  peer_region = var.zone
}