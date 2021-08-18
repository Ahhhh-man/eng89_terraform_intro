# Lets Build a script to connect to aws and download/setup all dependencies


provider "aws" { # A provider block is used to specify a provider configuration
	region = var.REGION
}

# then we will run terraform init (or in VSC click btn at bottom)


resource "aws_instance" "app_instance" {
	ami = var.AMI_WEB 
	instance_type = "t2.micro"
	associate_public_ip_address = true

    subnet_id = aws_subnet.eng89_aman_tf_net_public.id 
    vpc_security_group_ids = [aws_security_group.eng89_aman_tf_sg_public.id]
	key_name = var.AWS_KEY_NAME

	tags = {
	  "Name" = var.NAME_OF_INSTANCE
	}

	provisioner "file" {
		source      = "sync"
		destination = "~/"
		connection {
			type        = "ssh"
			user        = "ubuntu"
			private_key = file(var.AWS_KEY_PATH)
			host        = self.public_ip
		}
  	}
	provisioner "remote-exec" {
		inline = [
			"sudo apt-get update -y",
			"sudo rm -rf /etc/nginx/sites-available/default",
			"sudo cp ~/sync/default /etc/nginx/sites-available/",
			"sudo systemctl restart nginx",
			"sudo npm uninstall -g pm2",
			"npm install -g pm2@3.2.2",
			"export DB_HOST=mongodb://${aws_instance.db_instance.public_ip}:27017/posts",
			"cd ~/app",
			"sudo npm install -y",
			"pm2 kill",
			"pm2 start app.js"
		]
		connection {
			type        = "ssh"
			user        = "ubuntu"
			private_key = file(var.AWS_KEY_PATH)
			host        = self.public_ip
		}
  	}
}

resource "aws_instance" "db_instance" {
	ami = var.AMI_DB 
	instance_type = "t2.micro"
	associate_public_ip_address = true

    subnet_id = aws_subnet.eng89_aman_tf_net_public.id 
    vpc_security_group_ids = [aws_security_group.eng89_aman_tf_sg_public.id]
	key_name = var.AWS_KEY_NAME

	tags = {
	  "Name" = var.NAME_OF_INSTANCE_DB
	}
}

# `terraform plan`
# `terraform apply`; type yes

# then launch aws services