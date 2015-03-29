Swiss Army LAMP
===============

Веб-сервер для разработки.

Если у тебя не Linux, потребуется установить и запустить [boot2docker](http://boot2docker.io). Ты попадёшь в консоль микровиртуалки, всё что она умеет - запускать Docker.

Запуск контейнера с именем `MyPreciousWebProject` по адресу http://192.168.59.103:8080, с учетом что исходники сайта лежат в `C:\Users\John\example`:

```bash
docker run -d \
    --name="MyPreciousWebProject" \
    -p 8080:80 \
    -v /c/Users/John/Example/:/app \
    devsli/phpbox
```
В дальнейшем, после перезапуска твоего ПК, этот контейнер необходимо запускать командой:

```bash
docker start MyPreciousWebProject
```
Если потребуется войти в контейнер (например, чтобы почитать логи в /var/log/):

```bash
docker exec -it MyPreciousWebProject bash
```

В контейнере функционирует phpMyAdmin, попасть можно по адресу http://192.168.59.103:8080/phpmyadmin (если не менялся порт)

Всё необходимое для сборки образа лежит в репозитории `docker-images`.

```bash
docker build -t "devsli/phpbox" .
```
