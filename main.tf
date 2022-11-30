provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web-zabbix-master" {
    ami = var.instance_ami
    instance_type =  var.instance_type
    key_name = aws_key_pair.kp.key_name
    vpc_security_group_ids = [aws_security_group.sg-ssh.id]

    tags = var.instance_zabbix_master
 
   provisioner "local-exec" {
      command = "echo ${self.public_ip} >> private_ips_master.txt"  
  }
}

resource "aws_instance" "web-zabbix-proxy1" {
    ami = var.instance_ami
    instance_type = var.instance_type
    key_name = aws_key_pair.kp.key_name
    vpc_security_group_ids = [aws_security_group.sg-ssh.id]
    tags = var.instance_zabbix_proxy1
    
    provisioner "local-exec" {
      command = "echo ${self.public_ip} >> private_ips_zabbix_proxy1.txt"  
  } 
}

resource "aws_instance" "web-zabbix-proxy2" {
    ami = var.instance_ami
    instance_type = var.instance_type
    key_name = aws_key_pair.kp.key_name
    vpc_security_group_ids = [aws_security_group.sg-ssh.id]
    tags = var.instance_zabbix_proxy2

    provisioner "local-exec" {
      command = "echo ${self.public_ip} >> private_ips_zabbix_proxy2.txt"  
  } 
}

resource "aws_instance" "web-zabbix-proxy3" {
    ami = var.instance_ami
    instance_type = var.instance_type
    key_name = aws_key_pair.kp.key_name
    vpc_security_group_ids = [aws_security_group.sg-ssh.id]
    tags = var.instance_zabbix_proxy3
    
    provisioner "local-exec" {
      command = "echo ${self.public_ip} >> private_ips_zabbix_proxy3.txt"  
  }
}

# resource "aws_key_pair" "deploy-ec2-terraform" {
#     key_name = var.aws_key_name
#     public_key = var.ssh_key_pair
# }

resource "aws_security_group" "sg-ssh" {
  name = "sec-grp"
  description = "SSH traffic via Terraform"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "devops-key"       
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./devops-key1.pem"
  }
}