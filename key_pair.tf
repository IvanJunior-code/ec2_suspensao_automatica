resource "aws_key_pair" "key_pair" {
  key_name   = "aws_us-east-1_home"
  public_key = var.key_name
}