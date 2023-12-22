variable "project_name" {
  type        = string
  description = "name of the project"
}

variable "project_env" {
  type        = string
  description = "product environment"
}


variable "instance_type" {
  type        = string
  description = "instance type"
}

variable "ami_id" {
  type        = string
  description = "id of ami"
}


locals {
  image-timestamp = "${formatdate("DD-MM-YY-hh-mm", timestamp())}"
  image-name      = "${var.project_name}-${var.project_env}-${local.image-timestamp}"
}

