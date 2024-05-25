# Используя конфигурации, выполненные в рамках предыдущих домашних заданий, нужно добавить возможность шифрования бакета.
## Задание 1. Yandex Cloud
- С помощью ключа в KMS необходимо зашифровать содержимое бакета:
- создать ключ в KMS;
- с помощью ключа зашифровать содержимое бакета, созданного ранее.
- (Выполняется не в Terraform)* Создать статический сайт в Object Storage c собственным публичным адресом и сделать доступным по HTTPS:
- создать сертификат;
- создать статическую страницу в Object Storage и применить сертификат HTTPS;
- в качестве результата предоставить скриншот на страницу с сертификатом в заголовке (замочек).
```
Apply complete! Resources: 0 added, 1 changed, 1 destroyed.
Outputs:
lamp-group-address = "vp-target-nlb-group"
pic-url = "https://storage.yandexcloud.net/paint/goa.jpg"
```
![sert](https://github.com/EVolgina/ycloud3/blob/main/cert.png)
![setting key](https://github.com/EVolgina/ycloud3/blob/main/setting%20key.png)
![key](https://github.com/EVolgina/ycloud3/blob/main/key.png)
![zone](https://github.com/EVolgina/ycloud3/blob/main/zone2.png)
![resorse](https://github.com/EVolgina/ycloud3/blob/main/ресурсы.png)
![goa](https://github.com/EVolgina/ycloud3/blob/main/goa.png)
