resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id

   tags = {
        Name            = "${var.env}-igw"
        Owner           = "Pavlo H"
        Company_Name    = "Carrectly"
    }
}