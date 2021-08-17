resource "aws_vpc" "eng89_aman_tf_vpc" {
    cidr_block = "${var.SPLICED_CIDR_BLOCK}.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"  
    tags = {
        "Name" = var.NAME_OF_VPC
    }
}

resource "aws_subnet" "eng89_aman_tf_net_public" {
    vpc_id = aws_vpc.eng89_aman_tf_vpc.id
    cidr_block = "${var.SPLICED_CIDR_BLOCK}.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = var.SUBREGION  
    tags = {
        "Name" = var.NAME_OF_SUBNET_PUBLIC
    }
}

/*
resource "aws_network_acl" "main" {
    vpc_id = aws_vpc.eng89_aman_tf_vpc.id
}
*/