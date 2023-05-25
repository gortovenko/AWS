#Lvl1
resource "aws_vpc" "vpc1" {
    cidr_block = var.cidr_block_vpc1

    tags = {
        Name = "vpc1-public-access-internet"
        env  = "test", 
        service = "vpc"
         type_of_vpc = "public"

    }
}

#Lvl2
resource "aws_vpc" "vpc2" {
    cidr_block = var.cidr_block_vpc2

    #Make you instances shared on the host 
    instance_tenancy = "default"
    #Requared for EKS. Enable/disable DNS support in VPC
    enable_dns_support = true 
    #Requared for EKS. Enable/disable DNS hostames in VPC
    enable_dns_hostnames = true

    #Enable/disable  ClassLinks DNS Support for the VPC
    enable_classiclink_dns_support = true
    # Enable/disable IPv6 in CIDR Block for VPC 56 /prefix
    assign_generated_ipv6_cidr_block = false 
    
    tags = {
        Name = "vpc2-private-web"
        env = "test"
        service = "vpc"
        type_of_vpc = "private for backend app"
    }
  
}

#Lvl3
resource "aws_vpc" "vpc3" {
    cidr_block = var.cidr_block_vpc3
    
      tags = {
        Name = "vpc3-private-db"
        env = "test"
        service = "vpc"
        type_of_vpc = "private for db"
    }
}