resource "yandex_mdb_mysql_cluster" "app" {
  name               = var.mysql_name
  environment        = "PRESTABLE"
  network_id         = yandex_vpc_network.main.id
  version            = var.mysql_version
  security_group_ids = [yandex_vpc_security_group.mysql.id]

  resources {
    resource_preset_id = var.mysql_preset
    disk_type_id       = "network-hdd"
    disk_size          = var.mysql_disk_size
  }

  host {
    zone             = var.default_zone
    subnet_id        = yandex_vpc_subnet.main.id
    assign_public_ip = false
  }

  deletion_protection = false
}

resource "yandex_mdb_mysql_database" "app" {
  cluster_id = yandex_mdb_mysql_cluster.app.id
  name       = var.mysql_db_name
}

resource "yandex_mdb_mysql_user" "app" {
  cluster_id = yandex_mdb_mysql_cluster.app.id
  name       = var.mysql_user
  password   = local.mysql_password_from_lockbox

  permission {
    database_name = yandex_mdb_mysql_database.app.name
    roles         = ["ALL"]
  }
}