resource "aws_route_table" "team4_rtb_pub" {
  vpc_id = aws_vpc.team4_vpc.id

  route {
    cidr_block = var.rocidr
    gateway_id = aws_internet_gateway.team4_ig.id
  }

  tags = {
    Name = "${var.tag}-rtb-pub"
  }
}

resource "aws_route_table" "team4_rtb_pri" {
  vpc_id = aws_vpc.team4_vpc.id

  route {
    cidr_block = var.rocidr
    gateway_id = aws_nat_gateway.team4_nat_[0].id
  }

  tags = {
    Name = "${var.tag}-rtb-pri"
  }
}

resource "aws_route_table" "team4_rtb_db" {
  vpc_id = aws_vpc.team4_vpc.id

  route {
    cidr_block = var.rocidr
    gateway_id = aws_nat_gateway.team4_nat_[1].id
  }

  tags = {
    Name = "${var.tag}-rtb-db"
  }
}
