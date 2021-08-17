# Lets Build a script to connect to aws and download/setup all dependencies


provider "aws" { # A provider block is used to specify a provider configuration
	region = var.REGION
}

# then we will run terraform init (or in VSC click btn at bottom)


resource "aws_instance" "app_instance" {
	ami = var.AMI 
	instance_type = "t2.micro"
	associate_public_ip_address = true

    subnet_id = aws_subnet.eng89_aman_tf_net_public.id 
    vpc_security_group_ids = [aws_security_group.eng89_aman_tf_sg_public.id]
	key_name = var.AWS_KEY_NAME

	tags = {
	  "Name" = var.NAME_OF_INSTANCE
	}
}


# `terraform plan`
# `terraform apply`; type yes



# then launch aws services