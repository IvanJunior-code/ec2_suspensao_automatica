data "aws_autoscaling_group" "autoscaling_ec2" {
  name = aws_autoscaling_group.autoscaling_ec2.name
}

data "aws_instances" "ec2" {
  filter {
    name   = "tag:Name"
    values = ["Auto Scaling Group"]
  }

  instance_state_names = ["running"]
}
