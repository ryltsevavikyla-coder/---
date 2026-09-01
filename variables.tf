variable "token" {
  type      = string
  sensitive = true
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vpc_name" {
  type    = string
  default = "diploma-vpc"
}

variable "subnet_cidr" {
  type    = list(string)
  default = ["10.10.0.0/24"]
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_ed25519.pub"
}

variable "vm_name" {
  type    = string
  default = "diploma-app"
}

variable "vm_cores" {
  type    = number
  default = 2
}

variable "vm_memory" {
  type    = number
  default = 2
}

variable "vm_core_fraction" {
  type    = number
  default = 20
}

variable "vm_disk_size" {
  type    = number
  default = 20
}

variable "image_family" {
  type    = string
  default = "ubuntu-2204-lts"
}

variable "mysql_name" {
  type    = string
  default = "diploma-mysql"
}

variable "mysql_version" {
  type    = string
  default = "8.0"
}

variable "mysql_preset" {
  type    = string
  default = "s2.micro"
}

variable "mysql_disk_size" {
  type    = number
  default = 10
}

variable "mysql_db_name" {
  type    = string
  default = "appdb"
}

variable "mysql_user" {
  type    = string
  default = "appuser"
}

variable "mysql_password" {
  type      = string
  sensitive = true
}

variable "registry_name" {
  type    = string
  default = "diploma-registry"
}