# resource "aws_ami_from_instance" "hbinT_ami" {
#   name               = "${var.tag}-ami"
#   source_instance_id = aws_instance.hbinT_ec2.id

#   depends_on = [
#     aws_instance.hbinT_ec2
#   ]
# }
