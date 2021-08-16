# Lets Build a script to connect to aws and download/setup all dependencies


provider "aws" { # A provider block is used to specify a provider configuration
	region = var.REGION
}

# then we will run terraform init (or in VSC click btn at bottom)


resource "aws_instance" "app_instance" {
	key_name = var.AWS_KEY_NAME
	ami = var.AMI 
	instance_type = "t2.micro"
	associate_public_ip_address = true
	tags = {
	  "Name" = var.NAME_OF_INSTANCE
	}
}


# `terraform plan`
# `terraform apply`; type yes



# then launch aws services