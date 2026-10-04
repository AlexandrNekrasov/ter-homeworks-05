terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.12.0"
}

provider "yandex" {
# token                    = "do not use!!!"
# cloud_id                 = "b1gn3ndpua1j6jaabf79"
# folder_id                = "b1gfu61oc15cb99nqmfe"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("/home/alex/.ssh/authorized_key.json")
  zone                     = "ru-central1-a" #(Optional) 
}
