provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server102" {
  ami = "ami-0f9c44e98edf38a2b"
  instance_type = "t2.micro"
  tags = {
    Name = "server102"
  }
}
