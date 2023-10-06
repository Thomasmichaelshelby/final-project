# resource "aws_autoscaling_group" "hbinT_autosg" {
#   name                      = "${var.tag}-autosg"
#   max_size                  = 6
#   min_size                  = 1
#   health_check_grace_period = 60
#   health_check_type         = "EC2"
#   desired_capacity          = 1
#   force_delete              = false
#   vpc_zone_identifier       = concat(aws_subnet.hbinT_pub_[*].id)

#   launch_template {
#     id      = aws_launch_template.hbinT_lantemp.id
#     version = "$Latest"
#   }
# }
