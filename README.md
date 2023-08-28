# CourseRegistry
A web project to register and visualize higher education courses in the field of digital humanities

The Code is based upon [CakePHP](https://github.com/cakephp/cakephp) and makes use of the [Google API](https://code.google.com/apis/console/?pli=1).


## SetUp
This application runs under very common webserver settings. It makes use of PHP and MySql.
For local adjustments (e.g. database access and Google API access) please change details in app/Config/core.php and app/Config/database.php
## Requirements
* 400 MB storage space (extensible if database grows)
* a common Unix OS
* MySql (any version)
* PHP, version 5 of higher
* check if CURL extension is installed in PHP
* SSL certificate

Steps:

* `docker-compose up -d`
* `docker cp app/Config.template/Schema/DHPR-dump.sql courseregistry-single-1:/tmp/dump.sql`
* `chown -R 33:33 app/tmp`
* `/etc/init.d/mysql start`
* `/etc/init.d/apache2 start`
* `docker-compose exec mysql bash`
    * `mysql -u root`
        * `create database cake;`
        * `create user 'cake'@'localhost' identified by 'hackme';`
        * `grant all on cake.* to 'cake'@'localhost';`
    * `mysql -u root cake < /tmp/dump.sql`
