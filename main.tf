# Lets Build a script to connect to aws and download/setup all dependencies


provider "aws" { # A provider block is used to specify a provider configuration
	region = "eu-west-1"
}

# then we will run terraform init (or in VSC click btn at bottom)

resource "aws_instance" "app_instance" {
	key_name = "eng89_aman_161803"
	ami = "ami-038d7b856fe7557b3" 
	instance_type = "t2.micro"
	associate_public_ip_address = true
	tags = {
	  "Name" = "eng89_aman_terraform"
	}
}

# `terraform plan`
# `terraform apply`; type yes



# then launch aws services