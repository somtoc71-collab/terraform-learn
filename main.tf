
provider "aws" {
  region = "us-east-2"
}

variable "cidr_blocks" {
  description = "cidr blocks for vpc and subnets"
  type = list(string) 
}

variable avail_zone {}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.cidr_blocks[0]
  tags = {
     Name: "development"
  }
}

resource "aws_subnet" "dev-subnet-1" {
   vpc_id = aws_vpc.development-vpc.id
   cidr_block = var.cidr_blocks[1]
   availability_zone = var.avail_zone
   tags = {
    Name: "subnet-1-dev"
   }
}