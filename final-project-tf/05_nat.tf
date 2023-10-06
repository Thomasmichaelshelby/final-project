resource "aws_eip" "team4_eip_" {
  count  = 2
  domain = "vpc"

  tags = {
    Name = "${var.tag}-eip-${count.index == 0 ? "0" : "1"}"
  }
}

resource "aws_nat_gateway" "team4_nat_" {
  count         = 2
  allocation_id = aws_eip.team4_eip_[count.index].id
  subnet_id     = aws_subnet.team4_pub_[count.index].id

  tags = {
    Name = "${var.tag}-nat-${count.index == 0 ? "0" : "1"}"
  }
}
