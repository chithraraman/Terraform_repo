provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_eip" "public_ip" {

  vpc = true

  instance = aws_instance.web_server.id

}

resource "aws_instance" "web_server" {

  ami = "ami-0fa4dfd1533851540"

  instance_type = "t2.micro"

  # depends_on = [aws_s3_bucket.company_data]

}