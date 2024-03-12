resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_vpc
  tags = {
    Name = "my_vpc"
  }

}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_public_subnet
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }

}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_private_subnet
  tags = {
    Name = "private_subnet"
  }
}

resource "aws_security_group" "sec_group" {
  vpc_id = aws_vpc.my_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sec_gp"
  }
}

resource "aws_route_table" "public" {
  vpc_id     = aws_vpc.my_vpc.id
  depends_on = [aws_internet_gateway.gw]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table" "private" {
  vpc_id     = aws_vpc.my_vpc.id
  depends_on = [aws_internet_gateway.gw]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_eip" "nat-eip" {
  vpc = true
}


resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public_subnet.id

  depends_on = [aws_internet_gateway.gw]
}


resource "aws_route_table_association" "eip" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}




