# Comments blocks use hashes #

provider "aws" {
  region     = "us-east-2"
}
resource "aws_instance" "example" {
  ami           = "ami-40142d25"
  instance_type = "t2.nano"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
