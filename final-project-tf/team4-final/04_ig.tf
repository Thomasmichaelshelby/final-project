resource "aws_internet_gateway" "team4_ig" {
  vpc_id = aws_vpc.team4_vpc.id

  tags = {
    Name = "${var.tag}-ig"
  }
}
