output "out" {

#   value=concat(module.test-vm.fqdn , module.example-vm.fqdn)
    value = concat(module.marketing_vm.fqdn, module.analytics_vm.fqdn)

}
