#можно использовать если ключ уже есть
resource "yandex_kms_symmetric_key" "paint" {
  name              = "example-symmetric-key"
  description       = "description for key"
  default_algorithm = "AES_256"
  rotation_period   = "720h" // 30 дней = 720 часов
}

resource "yandex_storage_bucket" "paint" {
  access_key    = var.bucket_access_key
  secret_key    = var.bucket_secret_key
  acl           = "public-read"
  bucket        = "paint"
  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "abjdg36t5ugdaqj8tsg0"  # существующий идентификатор ключа KMS
        sse_algorithm     = "aws:kms"
      }
    }
  }

  website {
    index_document = "index.html"
  }
}
