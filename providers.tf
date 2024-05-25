terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.69"
    }
  }
  required_version = ">=0.13"
#  backend "local" {
#    path = "terraform.tfstate"
#  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

