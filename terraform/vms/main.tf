
module "vpc_dev_a" {
  source   = "./vpc"
  env_name = "develop-a"
  zone     = "ru-central1-a"
  cidr     = "10.0.1.0/24"
}

module "vpc_dev_b" {
  source   = "./vpc"
  env_name = "develop-b"
  zone     = "ru-central1-b"
  cidr     = "10.0.2.0/24"
}

module "marketing_vm" {
#  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=346ace379fe15e25638b0ea515fdfb094be9d58f"
  env_name       = "marketing"
  network_id     = module.vpc_dev_a.network_id
  subnet_zones   = [module.vpc_dev_a.subnet.zone]
  subnet_ids     = [module.vpc_dev_a.subnet_id]
  instance_name  = "marketing-vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = {
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "analytics_vm" {
#  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=346ace379fe15e25638b0ea515fdfb094be9d58f"
  env_name       = "analytics"
  network_id     = module.vpc_dev_b.network_id
  subnet_zones   = [module.vpc_dev_b.subnet.zone]
  subnet_ids     = [module.vpc_dev_b.subnet_id]
  instance_name  = "analytics-vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = {
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}


#Пример передачи cloud-config в ВМ для демонстрации.
data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    ssh_public_key = var.public_key
  }
}
