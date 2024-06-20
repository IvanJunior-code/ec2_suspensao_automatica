resource "aws_autoscaling_group" "autoscaling_ec2" {
  name               = "autoscaling_ec2"
  max_size           = 5
  min_size           = 2
  desired_capacity   = 3
  availability_zones = ["us-east-1a"]
  force_delete       = true

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  depends_on = [aws_launch_template.launch_template]

  tag {
    key                 = "Name"
    value               = "Auto Scaling Group"
    propagate_at_launch = true
  }

}
