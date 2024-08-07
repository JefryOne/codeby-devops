data "yandex_compute_image" "my_image" {
  family = "ubuntu-2204-lts"
}

output "my_image_id" {
  value = data.yandex_compute_image.my_image.id
}
