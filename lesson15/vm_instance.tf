variable "zone" {
  description = "Зона для ВМ"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID для ВМ"
  type        = string
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
