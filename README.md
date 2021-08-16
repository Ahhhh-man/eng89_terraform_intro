# Terraform Setup
## Install terraform via [chocolatey](https://chocolatey.org/)
- Install chocolatey;  in powershell:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```  
- `choco install terraform` in terminal

---

##  Create aws env variables
Edit system environment variables > Environment Variables > New.

Add the following: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` with their respective values.

> Alternatively, [this](https://docs.aws.amazon.com/sdk-for-php/v3/developer-guide/guide_credentials_environment.html); *i.e.,* `SET  AWS_ACCESS_KEY_ID=**********`

---

## Create [main.tf](main.tf)
```js
provider "aws" { # A provider block is used to specify a provider configuration
	region = "eu-west-1"
}
```

Then we will run `terraform init` (or in VSCode click btn at bottom in status bar).

```js
resource "aws_instance" "app_instance" {
	ami = "ami-038d7b856fe7557b3" 
	instance_type = "t2.micro"
	associate_public_ip_address = true
	tags = {
	  "Name" = "eng89_aman_terraform"
	}
}
```
Run `terraform plan`. Then `terraform apply`; type yes.

> Remark: To delete the instance, run `terraform destroy`.

---

## Add ssh keypair to main.tf
You can either include an existing keypair by
```js
key_name = "eng89_aman_qwerty"
```

or making a new one, just use aws to create a new keypair.