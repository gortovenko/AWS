# SG vpc1 - web access 
resource "aws_security_group" "vpc1-web" {
    name = "WebSG"
    #count = length(aws_subnet.subnet_vpc1.cidr_block)
    vpc_id = aws_vpc.vpc1.id

   dynamic  "ingress" {
        for_each = ["443", "80", "3000", "1337", "8080"]
    content {
      description      = "TLS from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
   }

    egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "Web_SG"
    Owner = "Pavlo H"
    TypeOfProject = "Front-End"
  }
  depends_on = [ aws_vpc.vpc1, aws_subnet.subnet_vpc1 ]
  }

# VPC 2 
resource "aws_security_group" "vpc2-backend" {
    name = "Backend-SG"
    vpc_id = aws_vpc.vpc2.id

    dynamic  "ingress" {
        for_each = ["443", "80", "3000", "1337", "8080"]
    content {
      description      = "TLS from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Backend_SG"
    Owner = "Pavlo H"
    TypeOfProject = "Back-End"
  }

  depends_on = [ aws_vpc.vpc2, aws_vpc.vpc1, aws_subnet.subnet_vpc1, aws_subnet.subnet_vpc2]
  }

# DB - vpc3 
resource "aws_security_group" "vpc3-db" {
    name = "Batabase-SG"
    vpc_id = aws_vpc.vpc3.id

    ingress {
      description      = "Database access to Database"
      from_port        = 5432
      to_port          = 5432
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database_SG"
    Owner = "Pavlo H"
    TypeOfProject = "Database-type"
  }
  depends_on = [ aws_vpc.vpc1, aws_vpc.vpc2, aws_vpc.vpc3, aws_subnet.subnet_vpc1, aws_subnet.subnet_vpc2, aws_subnet.subnet_vpc3 ]
}

#SG LoadBalancer 

resource "aws_security_group" "tree_tire_lb_sg" {
  name = "three_tier_lb_sg"
  description = "Allow HTTP and HTTPS Traffic"
  vpc_id = aws_vpc.vpc1.id

  dynamic "ingress" {
      for_each = ["3000", "1337", "8080"]
    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}