#VPC 
output "vpc1_id" {
  description = "The ID of the VPC1"
  value       = try(aws_vpc.vpc1[*].id, null)
}


output "vpc2_id" {
  description = "The ID of the VPC2"
  value       = try(aws_vpc.vpc2[*].id, null)
}


output "vpc3_id" {
  description = "The ID of the VPC3"
  value       = try(aws_vpc.vpc3[*].id, null)
}


#cidr_block of VPC's
output "vpc1_cidr_block" {
  description = "The Cidr_Block of the VPC1"
  value       = try(aws_vpc.vpc1[*].cidr_block, null)
}

output "vpc2_cidr_block" {
  description = "The Cidr_Block of the VPC2"
  value       = try(aws_vpc.vpc2[*].cidr_block, null)
}

output "vpc3_cidr_block" {
  description = "The Cidr_Block of the VPC1"
  value       = try(aws_vpc.vpc3[*].cidr_block, null)
}

#Subnets
#ID 
output "subnets_vpc1_id" {
  description = "ID of subnets in VPC1"
  value = try(aws_subnet.subnet_vpc1[*].id, null)
}

output "subnets_vpc2_id" {
  description = "ID of subnets in VPC2"
  value = aws_subnet.subnet_vpc2[*].id
}

output "subnets_vpc2_id_1" {
  description = "ID of subnets in VPC2"
  value = aws_subnet.subnet_vpc2[0].id
}

output "subnets_vpc2_id_2" {
  description = "ID of subnets in VPC2"
  value = aws_subnet.subnet_vpc2[1].id
}

output "subnets_vpc3_id" {
  description = "ID of subnets in VPC3"
  value = try(aws_subnet.subnet_vpc3[*].id, null)
}
#Cidr_Block

output "subnets_vpc1_cidr_block" {
  description = "Cidr_Block of subnets in VPC1"
  value = try(aws_subnet.subnet_vpc1[*].cidr_block, null)
}

output "subnets_vpc2_cidr_block" {
  description = "Cidr_Block of subnets in VPC1"
  value = try(aws_subnet.subnet_vpc2[*].cidr_block, null)
}

output "subnets_vpc3_cidr_block" {
  description = "Cidr_Block of subnets in VPC1"
  value = try(aws_subnet.subnet_vpc1[*].cidr_block, null)
}

#Security_Groups_ID

output "vpc1_security_group_id" {
  description = "The ID of the security group created by default on VPC1"
  value       = try(aws_security_group.vpc1-web[*].id, null)
}

output "vpc2_security_group_id" {
  description = "The ID of the security group created by default on VPC2"
  value       = try(aws_security_group.vpc2-backend[*].id, null)
}

output "vpc3_security_group_id" {
  description = "The ID of the security group created by default on VPC3"
  value       = try(aws_security_group.vpc3-db[*].id, null)
}


#Route table

output "vpc1_route_table_id" {
  description = "The ID of the default route table VPC1"
  value       = try(aws_vpc.vpc1[*].default_route_table_id, null)
}

output "vpc2_route_table_id" {
  description = "The ID of the default route table VPC2"
  value       = try(aws_vpc.vpc2[*].default_route_table_id, null)
}

output "vpc3_route_table_id" {
  description = "The ID of the default route table VPC3"
  value       = try(aws_vpc.vpc3[*].default_route_table_id, null)
}


#DNS Hostnames
output "vpc1_enable_dns_hostnames" {
  description = "Whether or not the VPC1 has DNS hostname support"
  value       = try(aws_vpc.vpc1[*].enable_dns_hostnames, null)
}


output "vpc2_enable_dns_hostnames" {
  description = "Whether or not the VPC2 has DNS hostname support"
  value       = try(aws_vpc.vpc2[*].enable_dns_hostnames, null)
}

output "vpc3_enable_dns_hostnames" {
  description = "Whether or not the VPC3 has DNS hostname support"
  value       = try(aws_vpc.vpc3[*].enable_dns_hostnames, null)
}

#Internet Gateway

#ID of Internet Gateway 
output "igw_id" {
  description = "ID of Internet Gateway"
  value = try(aws_internet_gateway.igw_vpc1[*].id, null)
}

#ARN
output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = try(aws_internet_gateway.igw_vpc1[*].arn, null)
}

# LoabBalancer SG

output "tree_tier_lb_sg" {
  description = "SG of LoadBalancer"
  value = aws_security_group.tree_tire_lb_sg.id
}

#LoadBalancer id + target_group + listener
output "loadbalancer_id" {
    description = "ID of LoadBalancer"
    value = try(aws_lb.three_tier_lb[*].id, null)
}

output "loadbalancer_target_group_id" {
    description = "ID of Target Group"
    value = try(aws_lb_target_group.three_tier_tg[*].id, null)
}

output "loadbalancer_lb_listener_id" {
    description = "ID of LoadBalancer Listener"
    value = try(aws_lb_listener.three_tier_lb_listener[*].id, null)
}

#AZS zones 
output "availability_zone_public1" {
  description = "Availablility Zones of Public Subnet 1"
  value = aws_subnet.subnet_vpc1[0].availability_zone
}

output "availability_zone_public2" {
  description = "Availablility Zones of Public Subnet 2"
  value = aws_subnet.subnet_vpc1[1].availability_zone
}

output "availability_zone_private1" {
  description = "Availablility Zones of Private Subnet 1"
  value = aws_subnet.subnet_vpc2[0].availability_zone
}

output "availability_zone_private2" {
  description = "Availablility Zones of Private Subnet 2"
  value = aws_subnet.subnet_vpc2[1].availability_zone
}

#AZS id 

output "availability_zone_id_public1" {
  description = "ID of Availablility Zones of Public Subnet 1"
  value = aws_subnet.subnet_vpc1[0].id
}

output "availability_zone_id_public2" {
  description = "ID of Availablility Zones of Public Subnet 2"
  value = aws_subnet.subnet_vpc1[1].id
}
output "availability_zone_id_private1" {
  description = "ID of Availablility Zones Private Subnet 1"
  value = aws_subnet.subnet_vpc2[0].id
}

output "availability_zone_id_private2" {
  description = "ID of Availablility Zones of Private Subnet 2"
  value = aws_subnet.subnet_vpc2[1].id
}