create database wordpress;
create user odroz@'%' identified by 'root';
-- grant all privileges on *.* to odroz@'%';
grant all PRIVILEGES ON wordpress.* TO 'odroz'@'%' WITH GRANT OPTION;
flush privileges;
quit

