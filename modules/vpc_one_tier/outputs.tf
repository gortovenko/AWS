output "vpc_id" {
    description = "ID of VPC"
    value = aws_vpc.vpc1.id

    sensitive = false
  
}


output "public_subnet1_id" {
    description = "ID of Subnet1 Public"
    value = aws_subnet.public[0].id
    sensitive = false
  
}

output "public_subnet2_id" {
    description = "ID of Subnet2 Public"
    value = aws_subnet.public[0].id
    sensitive = false
  
}

output "public_private1_id" {
    description = "ID of Subnet1 Priavte"
    value = aws_subnet.private[0].id
    sensitive = false
  
}

output "public_private2_id" {
    description = "ID of Subnet1 Private"
    value = aws_subnet.private[1].id
    sensitive = false
  
}

output "igw_id" {
    description = "ID of IGW"
    value = aws_internet_gateway.igw.id
    sensitive = false
  
}

output "eip_nat1_id" {
    description = "ID of EIP Nat1"
    value = aws_eip.nat1.id
    sensitive = false
  
}

output "eip_nat2_id" {
    description = "ID of EIP Nat2"
    value = aws_eip.nat2.id
    sensitive = false
  
}

output "nat_gateway_1" {
    description = "ID of Nat Gateway1"
    value = aws_nat_gateway.nat_gateway1.id
    sensitive = false
  
}

output "nat_gateway_2" {
    description = "ID of Nat Gateway2"
    value = aws_nat_gateway.nat_gateway2.id
    sensitive = false
  
}

output "aws_route_table_association_public1_id" {
    description = "ID of Associate Table Public Subnet1"
    value = aws_route_table_association.subnet_public[0].id
    sensitive = false
  
}

output "aws_route_table_association_public2_id" {
    description = "ID of Associate Table Public Subnet2"
    value = aws_route_table_association.subnet_public[1].id
    sensitive = false
  
}

output "aws_route_table_association_private1_id" {
    description = "ID of Associate Table Priavte Subnet1"
    value = aws_route_table_association.subnet_private1.id
    sensitive = false
  
}

output "aws_route_table_association_private2_id" {
    description = "ID of Associate Table Private Subnet2"
    value = aws_route_table_association.subnet_private2.id
    sensitive = false
  
}

output "aws_eks_cluster" {
    description = "ID of EKS"
    value = aws_eks_cluster.eks.id
    sensitive = false
  
}

output "aws_eks_node_group" {
    description = "ID of Node Group"
    value = aws_eks_node_group.node_general.id
    sensitive = false
  
}