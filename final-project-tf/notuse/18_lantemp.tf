# resource "aws_launch_template" "hbinT_lantemp" {
#   name = "${var.tag}-lantemp"
#   block_device_mappings {
#     device_name = "/dev/sdf"
#     ebs {
#       volume_size = 10
#       volume_type = "gp2"
#     }
#   }
#   image_id               = aws_ami_from_instance.hbinT_ami.id
#   instance_type          = "t2.micro"
#   key_name               = "chs-key1"
#   vpc_security_group_ids = [aws_security_group.hbinT_sg.id]
#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name = "${var.tag}-temp"
#     }
#   }
#     user_data = filebase64("install.sh")
# }
