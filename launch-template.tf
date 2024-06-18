resource "aws_launch_template" "launch_template" {
  name_prefix   = "launch_template"
  image_id      = "ami-0f9b57fe51681be3f"
  instance_type = "t3.small"
}