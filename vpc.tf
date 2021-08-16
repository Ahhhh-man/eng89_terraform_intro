resource "aws_vpc" "eng89_aman_tf_vpc" {
    cidr_block = "10.207.0.0/16"
    enable_dns_support = true # gives you an internal domain name
    enable_dns_hostnames = true #gives you an internal host name
    enable_classiclink = true
    instance_tenancy = "default"  
    tags = {
        "Name" = var.NAME_OF_VPC
    }
}

resource "aws_subnet" "eng89_aman_tf_net_public" {
    vpc_id = "${aws_vpc.eng89_aman_tf_vpc.id}"
    cidr_block = "10.207.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = var.REGION  
    tags = {
        "Name" = "eng89_aman_tf_net_public"
    }
}