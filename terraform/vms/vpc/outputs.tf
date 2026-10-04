output "network_id" {
  description = "ID of the created VPC network"
  value       = yandex_vpc_network.this.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = yandex_vpc_subnet.this.id
}

output "subnet" {
  description = "Full information about the created subnet"
  value       = yandex_vpc_subnet.this
}
