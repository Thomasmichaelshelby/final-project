# resource "aws_autoscaling_attachment" "hbinT_autosgatt" {
#   autoscaling_group_name = aws_autoscaling_group.hbinT_autosg.id
#   lb_target_group_arn = aws_lb_target_group.hbinT_lb_tg.arn
# }

# resource "aws_lb_target_group_attachment" "hbinT_lb_tgatt" {
#   target_group_arn = aws_lb_target_group.hbinT_lb_tg.arn
#   target_id = aws_instance.hbinT_ec2.id
# }