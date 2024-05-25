###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
###ssh vars
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRcB9AMJl5PcxHHhiFjm0ebdXysuPw4k2rBKMaZvIw9 vagrant"
  description = "ssh-keygen -t ed25519"
}
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}
###yandex_compute_image vars
variable "public_image" {
  type        = string
  default     = "fd8pqclrbi85ektgehlf"
  description = "Yandex.Compute image ID"
}
###key
variable "bucket_access_key" {
  description = "Access key for the bucket"
  type        = string
}

variable "bucket_secret_key" {
  description = "Secret key for the bucket"
  type        = string
}
