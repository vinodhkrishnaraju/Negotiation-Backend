CREATE USER 'negotiate'@'localhost'
  IDENTIFIED BY 'negotiate123';

GRANT ALL PRIVILEGES ON *.* TO 'negotiate'@'localhost';
FLUSH PRIVILEGES;

mysql -u negotiate -pnegotiate123;
  /* drop table if exists entries;
create table entries (
  id INT auto_increment,
  title CHAR(30) not null,
  text CHAR(30) not null,
  PRIMARY KEY (id)
);

INSERT INTO entries(title, text)  values("Agatha Christie2","Fiction2"); */

CREATE DATABASE negotiate_db;