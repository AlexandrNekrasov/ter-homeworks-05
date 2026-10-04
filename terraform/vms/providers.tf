terraform {
  required_version = ">=1.12.0"

  backend "s3" {
    bucket = "alex-terraform-state-2026"
    key    = "terraform.tfstate"
    region = "ru-central1"

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
      source  = "yandex-cloud/yandex"
      version = ">= 0.100.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.0.0"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.0.0"
    }
  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("/home/alex/.ssh/authorized_key.json")
  zone                     = "ru-central1-a"
}
