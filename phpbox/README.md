Swiss Army LAMP
===============

All-in-one PHP development box.

What's included:
* PHP 5.5.9
* MySQL 5.5.41 (local root without password)
* phpMyAdmin
* composer (`composer install` executes on each container start)
* Apache

Run `MyPreciousWebProject` container bound to http://192.168.59.103:8080 (it is assumed that sources placed in `C:\Users\John\example`):

```bash
docker run -d \
    --name="MyPreciousWebProject" \
    -p 8080:80 \
    -v /c/Users/John/Example/:/app \
    devsli/phpbox
```

Start docker container (e.g. after reboot):

```bash
docker start MyPreciousWebProject
```

Interactive shell:

```bash
docker exec -it MyPreciousWebProject bash
```

phpMyAdmin is available at http://192.168.59.103:8080/phpmyadmin

Environment variables `ENVIRONMENT` and `PHINX_ENVIRONMENT` ([see phinx](https://phinx.org/)) are set to `development`.
Here's how you can use it:
```php
<?php
error_reporting(0);

if (getopt('ENVIRONMENT') == 'development') {
    error_reporting(E_ALL);
}
?>
```
