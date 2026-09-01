output "vm_external_ip" {
  value = yandex_compute_instance.app.network_interface[0].nat_ip_address
}

output "vm_fqdn" {
  value = yandex_compute_instance.app.fqdn
}

output "mysql_host" {
  value = yandex_mdb_mysql_cluster.app.host[0].fqdn
}

output "mysql_db" {
  value = yandex_mdb_mysql_database.app.name
}

output "registry_id" {
  value = yandex_container_registry.app.id
}

output "repository_name" {
  value = yandex_container_repository.app.name
}