resource "aws_subnet" "public" {
    vpc_id = aws_vpc.vpc1.id
    count = length(var.cidr_block_public_subnet)
    cidr_block = element(var.cidr_block_public_subnet, count.index)
    # AZ for subnet 
    availability_zone = element([var.az_public_subnet_a, var.az_public_subnet_b], count.index)
    #Requared for EKS. Instance launched Public IP address will bringing
    map_public_ip_on_launch = true

    tags = {
        Name            = "${var.env}-public-subnet"
        Owner           = "Pavlo H"
        Company_Name    = "Carrectly"
        Support_EKS     = "yes"
        IPv6            = "false"
    }
    depends_on = [ aws_vpc.vpc1 ]
}


resource "aws_subnet" "private" {
    vpc_id = aws_vpc.vpc1.id
    count = length(var.cidr_block_private_subnet)
    cidr_block = element(var.cidr_block_private_subnet, count.index)
    availability_zone = element([var.az_private_subnet_a, var.az_private_subnet_b], count.index)

    tags = {
        Name            = "${var.env}-private-subnet"
        Owner           = "Pavlo H"
        Company_Name    = "Carrectly"
        Support_EKS     = "yes"
        IPv6            = "false"
    }
    depends_on = [ aws_vpc.vpc1 ]
}