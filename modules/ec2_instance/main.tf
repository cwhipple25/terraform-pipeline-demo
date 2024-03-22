resource "aws_iam_instance_profile" "instance_profile" {
  count = var.instance_name == null ? 0 : 1 
  name = "${var.instance_name}-instance-profile"
  role = var.role_name
}

resource "aws_instance" "ec2" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.root_volume_size
    delete_on_termination = var.delete_on_termination
  }
  vpc_security_group_ids  = var.security_group_ids
  key_name                = var.key_name
  iam_instance_profile    = var.instance_profile_name == null ? aws_iam_instance_profile.instance_profile[0].name : var.instance_profile_name
  user_data = var.user_data
  tags = {
    Name = var.instance_name
  }

  lifecycle {
    ignore_changes = [user_data]
  }
}
