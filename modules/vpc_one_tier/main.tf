resource "aws_vpc" "vpc1" {

    cidr_block = var.cidr_block_vpc1

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
        Name            = "${var.env}-vpc1"
        Owner           = "Pavlo H"
        Company_Name    = "Carrectly"
        Support_EKS     = "yes"
        IPv6            = "false"
    }
}