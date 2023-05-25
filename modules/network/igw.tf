resource "aws_internet_gateway" "igw_vpc1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "IGW_VPC1"
  }
  lifecycle {
    create_before_destroy = true
  }
}