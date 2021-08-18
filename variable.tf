variable "AWS_KEY_NAME" { default = "eng89_aman_161803" }
variable "AWS_KEY_PATH" { default = "~/.ssh/eng89_aman_161803.pem" }
variable "REGION" { default = "eu-west-1" }
variable "SUBREGION" { default = "eu-west-1a" }
variable "AMI_WEB" { default = "ami-08d4a78f55a8a190c" } # ami-038d7b856fe7557b3 is default 16.04
variable "AMI_DB" { default = "ami-081f9f8970e3a1b49" } # ami-038d7b856fe7557b3 is default 16.04
variable "SPLICED_CIDR_BLOCK" { default = "10.207" }
variable "MY_IP" { default = "0.0.0.0" } # NOT USED, BUT POC

# Names
variable "NAME_OF_INSTANCE" { default = "eng89_aman_tf_apppppp" }
variable "NAME_OF_VPC" { default = "eng89_aman_tf_vpc" }
variable "NAME_OF_IGW" { default = "eng89_aman_tf_igw" }
variable "NAME_OF_RTB" { default = "eng89_aman_tf_rtb" }
variable "NAME_OF_SG_PUBLIC" { default = "eng89_aman_tf_sg_public" }
variable "NAME_OF_SUBNET_PUBLIC" { default = "eng89_aman_tf_net_public" }

variable "NAME_OF_INSTANCE_DB" { default = "eng89_aman_tf_dbbbbbb" }
/*
variable "NAME_OF_SG_PRIVATE" { default = "eng89_aman_tf_sg_private" }
variable "NAME_OF_SUBNET_PRIVATE" { default = "eng89_aman_tf_net_private" }
*/
