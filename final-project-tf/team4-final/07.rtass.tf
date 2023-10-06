resource "aws_route_table_association" "team4_rtass_pub" {
  count          = 2
  subnet_id      = aws_subnet.team4_pub_[count.index].id
  route_table_id = aws_route_table.team4_rtb_pub.id
}

resource "aws_route_table_association" "team4_rtass_web" {
  count          = 2
  subnet_id      = aws_subnet.team4_web_[count.index].id
  route_table_id = aws_route_table.team4_rtb_pri.id
}

resource "aws_route_table_association" "team4_rtass_was" {
  count          = 2
  subnet_id      = aws_subnet.team4_was_[count.index].id
  route_table_id = aws_route_table.team4_rtb_pri.id
}


resource "aws_route_table_association" "team4_rtass_db" {
  count          = 2
  subnet_id      = aws_subnet.team4_db_[count.index].id
  route_table_id = aws_route_table.team4_rtb_db.id
}
