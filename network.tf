
resource "aws_igw" "eng89_aman_tf_igw" {
    vpc_id = "${aws_vpc.eng89_aman_tf_vpc.id}"
    tags = {
        "Name" = "eng89_aman_tf_igw"
    }
}

resource "aws_rtb" "eng89_aman_tf_rtb" {
    vpc_id = aws_vpc.eng89_aman_tf_vpc.id
    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_igw.eng89_aman_tf_igw.id
    }
    tags = {
        "Name" = "eng89_aman_tf_rtb"
    }
}

resource "aws_rtb_assoc_public" "eng89_aman_tf_rtb_assoc_public" {
    subnet_id = aws_subnet.eng89_aman_tf_net_public.vpc_id
    route_table_id = aws_rtb.eng89_aman_tf_rtb.id
}

resource "aws_sg" "eng89_aman_tf_sg_public" {
    vpc_id = aws_vpc.eng89_aman_tf_vpc.id

    egress { # All traffic
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}

