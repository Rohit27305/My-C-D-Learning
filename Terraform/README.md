# Terraform
Terraform is a popular infrastructure-as-code tool that allows you to automate the provisioning and management of infrastructure resources. It uses configuration files written in the HashiCorp Configuration Language (HCL).

After writing HCl 
1. ```terraform init``` to initialize the condiguration
2. ```terraform plan``` to show the chnages like to verify the changes
3. ```terraform apply``` to apply the changes

## Terraform Variable
## 1. Input Variable
Input variables, created as variable blocks, can be used to parameterize Terraform configurations. Example -

```
variable "instance_type" {
  description = "This is EC2 instance type"
  type    	= string
  default 	= "t2.micro"
}
```
## 2. Output Variable
We use Output variables to export values from a Terraform configuration file. Example - 
```
output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value   	= aws_instance.example.public_ip
}
```

## Variable Types
### 1. Primitive
- string
- number
- bool
### 2. Complex
- list
- map
- object
- set
- touple

To use variable ```var.variable_name``` 

## Conditional Operator
``` condition ? true_val : false_val```

## Modules
The advantage of using Terraform modules in your infrastructure as code (IaC) projects lies in improved organization, reusability, and maintainability.

## Terraform State File

Terraform is an Infrastructure as Code (IaC) tool used to define and provision infrastructure resources. The Terraform state file is a crucial component of Terraform that helps it keep track of the resources it manages and their current state. 

