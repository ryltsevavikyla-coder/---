resource "yandex_container_registry" "app" {
  name = var.registry_name
}

resource "yandex_container_repository" "app" {
  name = "${yandex_container_registry.app.id}/webapp"
}