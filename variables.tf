variable "aws_region"{
    type = string
    description = ""
    default = "us-east-1"
}

variable "instance_ami"{
    type = string
    description = ""
    default = "ami-08c40ec9ead489470"
}

variable "instance_type" {
    type = string
    description = ""
    default = "t2.micro"
}

variable "instance_zabbix_master" {
    type = map(string)
    description = ""
    default = {
        Name = "Zabbix Master"
        Project = "Curso AWS com Terraform"
    }
}

variable "instance_zabbix_proxy1" {
    type = map(string)
    description = ""
    default = {
        Name = "zabbix-proxy1"
        Project = "Curso AWS com Terraform"
    }
}

variable "instance_zabbix_proxy2" {
    type = map(string)
    description = ""
    default = {
        Name = "zabbix-proxy2"
        Project = "Curso AWS com Terraform"
    }
}

variable "instance_zabbix_proxy3" {
    type = map(string)
    description = ""
    default = {
        Name = "zabbix-proxy3"
        Project = "Curso AWS com Terraform"
    }
}

variable "aws_key_name" {
    type = string
    description = "name of keypair"
    default = "deploy-terraform-ec2"
}

variable "ssh_key_pair" {   
   type = string
   description = "key-pair of ec2"
   default = ""
}

