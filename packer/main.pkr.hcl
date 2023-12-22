packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.9"
      source  = "github.com/hashicorp/amazon"
    }
  }
}



source "amazon-ebs" "shopping-prod" {
  ami_name      = local.image-name
  source_ami    = var.ami_id
  instance_type = var.instance_type
  ssh_username  = "ec2-user"
  tags = {
    Name    = local.image-name
    project = var.project_name
    env     = var.project_env
  }
}

build {
  sources = ["amazon-ebs.shopping-prod"]

  provisioner "file" {
    source      = "../website"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script           = "./setup.sh"
    execute_command  = "sudo {{.Path}}"

  }
}

