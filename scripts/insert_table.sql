--INSERT INTO entries(title, text)  values("Agatha Christie2","Fiction2");


--product_dim
INSERT INTO product_dim(cat_id, category, cat_desc) values (1000,"Electronics","Electronics");
INSERT INTO product_dim(cat_id, category, cat_desc) values (2000,"Home","Home");
INSERT INTO product_dim(cat_id, category, cat_desc) values (3000,"Books and Media","Books and Media");
INSERT INTO product_dim(cat_id, category, cat_desc) values (4000,"Automotive","Automotive");
INSERT INTO product_dim(cat_id, category, cat_desc) values (5000,"Sports","Sports");



--product_sub_dim
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (100010,"Mobiles",1000,"Mobiles");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (100020,"Laptops",1000,"Laptops");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (100030,"Mobiles Accessories",1000,"Mobiles Accessories");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (100040,"Computer Accessories",1000,"Computer Accessories");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (100050,"Television",1000,"Television");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (100060,"Cameras",1000,"Cameras");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (200010,"Storage",2000,"Storage");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (200020,"Dining and Serving",2000,"Dining and Serving");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (200030,"Bed and Living",2000,"Bed and Living");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (200040,"Home Decor",2000,"Home Decor");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (200050,"Furnishing",2000,"Furnishing");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (300010,"Books",3000,"Books");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (300020,"Movies",3000,"Movies");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (300030,"Music",3000,"Music");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (300040,"Gaming",3000,"Gaming");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (300050,"Stationery",3000,"Stationery");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (400010,"Automobiles",4000,"Automobiles");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (400020,"Autocare",4000,"Autocare");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (400030,"Tyre",4000,"Tyre");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (400040,"Auto Electronics",4000,"Auto Electronics");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (400050,"Auto Interiors",4000,"Auto Interiors");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (500010,"Cycles",5000,"Cycles");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (500020,"Fitness Equipments",5000,"Fitness Equipments");
INSERT INTO product_sub_dim(sub_cat_id,sub_category,cat_id,sub_cat_desc) values (500030,"Fitness Accessories",5000,"Fitness Accessories");
INSERT INTO product_sub_dim(sub_cat_id, sub_category, cat_id,sub_cat_desc) values (500040,"Outdoor Sports",5000,"Outdoor Sports");
INSERT INTO product_sub_dim(sub_cat_id, sub_category, cat_id,sub_cat_desc) values (500050,"Indoor Sports",5000,"Indoor Sports");

--product_tbl
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/product_tbl.csv'
INTO TABLE product_tbl
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n' IGNORE 1 LINES
(product_id,item_name,item_desc,image_url,icon_url,sub_cat_id,cat_id,price,delivery_date);
