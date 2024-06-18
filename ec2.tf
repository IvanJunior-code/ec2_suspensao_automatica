resource "aws_instance" "web" {
  ami           = "ami-0f9b57fe51681be3f"
  instance_type = "t3.small"

  tags = {
    Name = "HelloWorld"
  }
}