terraform {
  required_providers {
    aws = {
        source = "hashicorp"
        versversion = "4.49.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tags-test" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
}

resource "aws_ebs_volume" "example" {
    availability_zone = "us-east-1b"
    size = 40
}

resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.example.id
    instance_id = aws_instance.tags-test.id
}