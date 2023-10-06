# resource "aws_lb_listener" "hbinT_lb_alb_li" {
#   load_balancer_arn = aws_lb.hbinT_lb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.hbinT_lb_tg.arn
#   }
# }
