DROP TABLE IF EXISTS product_dim;
CREATE TABLE product_dim (
	cat_id INT,
	category VARCHAR(60),
	cat_desc VARCHAR(150),
	PRIMARY KEY (cat_id)
);


DROP TABLE IF EXISTS product_sub_dim;
CREATE TABLE product_sub_dim (
	sub_cat_id INT,
	sub_category VARCHAR(60),
	cat_id INT,
	sub_cat_desc VARCHAR(150),
	PRIMARY KEY (sub_cat_id)
);

ALTER TABLE product_sub_dim
ADD FOREIGN KEY fk_category(cat_id)
REFERENCES product_dim(cat_id)
ON UPDATE CASCADE ON DELETE RESTRICT;

DROP TABLE IF EXISTS product_tbl;
CREATE TABLE product_tbl (
	product_id INTEGER,
	item_name VARCHAR(60),
	item_desc VARCHAR(60),
	image_url VARCHAR(150),
	icon_url VARCHAR(150),
	sub_cat_id INT,
	cat_id INT,
	price VARCHAR(60),
	delivery_date VARCHAR(60),
	PRIMARY KEY (product_id)
);

ALTER TABLE product_tbl
ADD FOREIGN KEY fk_category(cat_id)
REFERENCES product_dim(cat_id)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE product_tbl
ADD FOREIGN KEY fk_sub_category(sub_cat_id)
REFERENCES product_sub_dim(sub_cat_id)
ON UPDATE CASCADE ON DELETE RESTRICT;


DROP TABLE IF EXISTS buyer_auth;
CREATE TABLE buyer_auth (
	buyer_id INT,
	username VARCHAR(60),
	password VARCHAR(60),
	mailid VARCHAR(120),
	PRIMARY KEY (buyer_id)
);

DROP TABLE IF EXISTS seller_auth;
CREATE TABLE seller_auth (
	seller_id INT,
	username VARCHAR(60),
	password VARCHAR(60),
	mailid VARCHAR(120),
	PRIMARY KEY (seller_id)
);