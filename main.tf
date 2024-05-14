# provider "aws" {
#   region     = "ap-southeast-2"
# }


data "aws_ami" "app_ami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]  #fetch the most recent ubuntu ami
  }
}

resource "aws_instance" "web" {
  # ami           = data.aws_ami.app_ami.id
  ami           = "ami-0ec0514235185af79"
  instance_type = "t2.micro"
#   count = 2

  tags = {
    Name = "Docker-test"
  }
}

# # resource "aws_instance" "web2" {
# #   ami           = data.aws_ami.app_ami.id
# #   instance_type = "t2.micro"

# #   tags = {
# #     Name = aws_instance.web.id
# #   }
# # }