resource "yandex_vpc_network" "my_network" {
  name = "my-network"
}

resource "yandex_vpc_subnet" "public_subnet" {
  name           = "public-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.my_network.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_subnet" "private_subnet" {
  name           = "private-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.my_network.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

resource "yandex_vpc_security_group" "public_sg" {
  name = "public-sg"
  description = "Security group for public access"
  network_id = yandex_vpc_network.my_network.id


  ingress {
    description = "Allow HTTP"
    protocol    = "TCP"
    port        = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    protocol    = "TCP"
    port        = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    protocol    = "TCP"
    port        = 0
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "yandex_vpc_security_group" "private_sg" {
  name = "private-sg"
  network_id = yandex_vpc_network.my_network.id


  ingress {
    description = "Allow SSH"
    protocol    = "TCP"
    port        = 22
    v4_cidr_blocks = ["10.0.0.0/24"]
  }

  egress {
    description = "Allow all outbound traffic"
    protocol    = "TCP"
    port        = 0
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_compute_instance" "public_instance" {
  name        = "public-instance"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd84kp940dsrccckilj6"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnet.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.public_sg.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("C:\\Users\\faster\\.ssh\\pulsar.pub")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:\\Users\\faster\\.ssh\\pulsar")
      host        = self.network_interface.0.nat_ip_address
    }
  }
}

resource "yandex_compute_instance" "private_instance" {
  name        = "private-instance"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd84kp940dsrccckilj6" 
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet.id
    security_group_ids = [yandex_vpc_security_group.private_sg.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("C:\\Users\\faster\\.ssh\\pulsar.pub")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:\\Users\\faster\\.ssh\\pulsar")
      host        = self.network_interface.0.ip_address
    }
  }
}
