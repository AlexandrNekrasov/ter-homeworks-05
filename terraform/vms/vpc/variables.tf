variable "env_name" {
  type        = string
  description = "Environment name (used as network and subnet name prefix)"
}

variable "zone" {
  type        = string
  description = "Yandex Cloud availability zone for the subnet"
}

variable "cidr" {
  type        = string
  description = "CIDR block for the subnet"
}
