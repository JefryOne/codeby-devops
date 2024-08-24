variable "zone" {
  description = "Зона для ВМ"
  type        = string
}

data "yandex_vpc_network" "selected_vpc" {
  name = "VPS1"
}

data "yandex_vpc_subnet" "zone_subnet" {
  for_each = data.yandex_vpc_network.selected_vpc.subnets
  id       = each.value.id
  filter {
    name   = "zone"
    values = [var.zone]
  }
}

resource "yandex_compute_instance" "vm" {
  name        = "example-vm"
  platform_id = "standard-v1"
  zone        = var.zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8q7v1h0q6l1g9j1f5b"
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.zone_subnet.id
    nat       = true
  }
}
