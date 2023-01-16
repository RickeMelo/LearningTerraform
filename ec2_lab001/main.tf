#The terraform {} block contains Terraform settings, including the required providers Terraform will use to provision the infra. For each provider, the source attribute defines an optional hostname, a namespace and the provider type. Terraform installs providers from the Terraform Registry, by default.
  
#ex.: "aws" is the provider, hashicorp/aws is the provider's source, which shorthands "registry.terraform.io/hashicorp/aws.

#the version attribute is optional, but recommended.

terraform {
  required_providers {
    aws = {
        source = "hashicorp"
        version = "4.49.0"
    }
  }
}

#The provider block configured the specific provider, in this case AWS. This is a plugin that Terraform uses to create and manage the resources.

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tags-test" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
}

#resource blocks to define components of the infrastructure. A resource might be a physical or virtual compenent such as an EC2, or it can be a logical resource such as a Heroku app.

resource "aws_ebs_volume" "example" {
    availability_zone = "us-east-1b"
    size = 40
}

resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.example.id
    instance_id = aws_instance.tags-test.id
}