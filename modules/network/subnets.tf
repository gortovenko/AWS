resource "aws_subnet" "subnet_vpc1" {
  count = length(var.subnet_vpc1)
  vpc_id = aws_vpc.vpc1.id
  #cidr_block = var.subnet_vpc1
 
  cidr_block = element("${var.subnet_vpc1}", count.index)
  availability_zone = element([var.az_public_subnet_a, var.az_public_subnet_b], count.index)
  map_public_ip_on_launch = true




  tags = {
    Name = "Subnet1-${random_integer.random.id}-${count.index +1}"
    #Name = "Subent1"
    env = "test"
    owner = "Pavlo H"
  }

  depends_on = [aws_vpc.vpc1]
}

resource "aws_subnet" "subnet_vpc2" {
  count = length(var.subnet_vpc2)
  vpc_id = aws_vpc.vpc2.id
  cidr_block = element("${var.subnet_vpc2}", count.index)
  availability_zone = element([var.az_private_subnet_a, var.az_private_subnet_b], count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet2-${random_integer.random.id}-${count.index +1}"
    #Name = "Subnet2-${random_integer.random.id}"
    env = "test"
    owner = "Pavlo H"
  }

  depends_on = [aws_vpc.vpc2]
}


resource "aws_subnet" "subnet_vpc3" {
  count = length(var.subnet_vpc3)
  vpc_id = aws_vpc.vpc3.id
  #cidr_block = var.cidr_block_vpc3
  cidr_block = element("${var.subnet_vpc3}", count.index)
  availability_zone = element([var.az_private_subnet_a, var.az_private_subnet_b], count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet3-${random_integer.random.id}-${count.index +1}"
    #Name = "Subnet3-${random_integer.random.id}"
    env = "test"
    env = "test"
    owner = "Pavlo H"
  }

  depends_on = [aws_vpc.vpc3]
}