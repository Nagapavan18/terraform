provider "aws" {
    region = "ap-south-1"
    access_key = "AKIAVOZXLTX7NARPASOB"
    secret_key = "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"
}

resource "aws_vpc" "tf_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name : "vpc_using_tf"
        type : "vpc_type"
    }
}

resource "aws_subnet" "tf_subnet-1" {
    vpc_id = aws_vpc.tf_vpc.id
    cidr_block = "10.0.100.0/24"
    availability_zone = "ap-south-1a"
    tags = {
        Name : "subnet1_using_tf"
    }
}

data "aws_vpc" "deafult_vpc_subnet-2" {
    default = true
}

resource "aws_subnet" "default_subnet-2" {
    vpc_id = data.aws_vpc.deafult_vpc_subnet-2.id
    cidr_block = "172.31.101.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name : "subnet-2_using_default-vpc"
    }
}