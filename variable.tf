variable "AWS_KEY_NAME" { default = "eng89_aman_161803" }
variable "REGION" { default = "eu-west-1" }
variable "SUBREGION" { default = "eu-west-1a" }
variable "AMI" { default = "ami-038d7b856fe7557b3" }
variable "SPLICED_CIDR_BLOCK" { default = "10.207" }
variable "MY_IP" { default = "0.0.0.0" } # NOT USED, BUT POC

# Names
variable "NAME_OF_INSTANCE" { default = "eng89_aman_tf" }
variable "NAME_OF_VPC" { default = "eng89_aman_tf_vpc" }
variable "NAME_OF_IGW" { default = "eng89_aman_tf_igw" }
variable "NAME_OF_RTB" { default = "eng89_aman_tf_rtb" }
variable "NAME_OF_SG_PUBLIC" { default = "eng89_aman_tf_sg_public" }
variable "NAME_OF_SUBNET_PUBLIC" { default = "eng89_aman_tf_net_public" }