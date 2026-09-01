resource "yandex_lockbox_secret" "mysql" {
  name        = "diploma-mysql-password"
  description = "Password for Managed MySQL user"
}

resource "yandex_lockbox_secret_version" "mysql" {
  secret_id = yandex_lockbox_secret.mysql.id

  entries {
    key        = "password"
    text_value = var.mysql_password
  }
}

data "yandex_lockbox_secret_version" "mysql" {
  secret_id  = yandex_lockbox_secret.mysql.id
  version_id = yandex_lockbox_secret_version.mysql.id
}

locals {
  mysql_password_from_lockbox = one([
    for e in data.yandex_lockbox_secret_version.mysql.entries : e.text_value
    if e.key == "password"
  ])
}