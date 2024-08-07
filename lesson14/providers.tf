terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

locals {
    folder_id = "b1gc2fqrg67l7dhb91t9"
    cloud_id = "b1g0jcusid8dnom2e4l4"
}

provider "yandex" {
  cloud_id  = local.cloud_id
  folder_id = local.folder_id
  service_account_key_file = "E:\\authorized_key.json"
  zone      = "ru-central1-a"
}
