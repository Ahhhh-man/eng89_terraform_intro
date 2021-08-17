
resource "aws_internet_gateway" "eng89_aman_tf_igw" {
    vpc_id = "${aws_vpc.eng89_aman_tf_vpc.id}"
    tags = {
        "Name" = var.NAME_OF_IGW
    }
}

resource "aws_route_table" "eng89_aman_tf_rtb" {
    vpc_id = aws_vpc.eng89_aman_tf_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eng89_aman_tf_igw.id
    }
    tags = {
        "Name" = var.NAME_OF_RTB
    }
}

resource "aws_route_table_association" "eng89_aman_tf_rtb_assoc_public" {
    subnet_id = aws_subnet.eng89_aman_tf_net_public.id
    route_table_id = aws_route_table.eng89_aman_tf_rtb.id
}

resource "aws_security_group" "eng89_aman_tf_sg_public" {
    name = var.NAME_OF_SG_PUBLIC
    description = "A useful description."
    vpc_id = aws_vpc.eng89_aman_tf_vpc.id

    egress { # All traffic
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress { 
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress { # for nginx
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        "Name" = var.NAME_OF_SG_PUBLIC
    }
}

