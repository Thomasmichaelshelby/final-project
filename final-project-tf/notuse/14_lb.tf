# resource "aws_lb" "hbinT_lb" {
#   name               = "${var.tag}-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.hbinT_sg.id]
#   subnets            = concat(aws_subnet.hbinT_pub_[*].id)

#   tags = {
#     Name = "${var.tag}-lb-alb"
#   }
# }

# output "alb_dns_name" {
#   value = aws_lb.hbinT_lb.dns_name
# }
