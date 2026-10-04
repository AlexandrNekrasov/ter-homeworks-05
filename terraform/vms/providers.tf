terraform {
  required_version = ">=1.12.0"

  backend "s3" {
    bucket = "alex-terraform-state-2026"
    key    = "terraform.tfstate"
    region = "ru-central1"

    # Встроенный механизм блокировок (Terraform >= 1.6)
    use_lockfile = true

    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("/home/alex/.ssh/authorized_key.json")
  zone                     = "ru-central1-a"
}
