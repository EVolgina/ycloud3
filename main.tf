# Создание сети
resource "yandex_vpc_network" "netology-net" {
  name = "netology-net"
}

# Создание подсети
resource "yandex_vpc_subnet" "public" {
  name           = "public"
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = var.zone
  network_id     = yandex_vpc_network.netology-net.id
}

# Использование существующего сервисного аккаунта
locals {
  service_account_id = "ajetnpf6s7pt87g5bdvt"
}

# Создание группы виртуальных машин
resource "yandex_compute_instance_group" "lamp-group" {
  name               = "lamp-group"
  service_account_id = local.service_account_id

  deploy_policy {
    max_unavailable = 2
    max_expansion   = 1
  }

  health_check {
    interval            = 2
    timeout             = 1
    healthy_threshold   = 5
    unhealthy_threshold = 2
    http_options {
      path = "/"
      port = 80
    }
  }

  load_balancer {
    target_group_name        = "vp-target-nlb-group"
    target_group_description = "Target group for network balancer"
  }
 instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"  # LAMP image
      }
    }

    network_interface {
      network_id  = yandex_vpc_network.netology-net.id
      subnet_ids  = [yandex_vpc_subnet.public.id]
    }
   metadata = {
     ssh-keys  = "ubuntu:${file("/home/vagrant/.ssh/id_ed25519.pub")}"
     user-data = <<-EOF
       #!/bin/bash
       echo "<html><body><h1>Welcome to my website!</h1><p>Here is the image from the bucket:</p><img src='https://storage.yandexcloud.net/paint/goa.jpg'>"
       systemctl restart apache2
     EOF
   }

}

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [var.zone]
  }
}

# Создание сетевого балансировщика
resource "yandex_lb_network_load_balancer" "vp-nlb-1" {
resource "yandex_lb_network_load_balancer" "vp-nlb-1" {
  name = "network-load-balancer-1"

  listener {
    name = "network-load-balancer-1-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.lamp-group.load_balancer.0.target_group_id

    healthcheck {
      name = "http"
      interval = 2
      timeout = 1
      unhealthy_threshold = 2
      healthy_threshold = 5
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

# Вывод адреса изображения
output "pic-url" {
  value = "https://storage.yandexcloud.net/paint/goa.jpg"
}

output "lamp-group-address" {
  value = yandex_compute_instance_group.lamp-group.load_balancer.0.target_group_name
}
