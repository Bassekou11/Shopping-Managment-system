DROP DATABASE IF EXISTS `store_managment`;
CREATE DATABASE `store_managment`;
USE`store_managment`;
SET NAMES utf8;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `products` VALUES (1,'Foam Dinner Plate',70,1.21);
INSERT INTO `products` VALUES (2,'Goat meat',49,4.65);
INSERT INTO `products` VALUES (3,'Lettuce - Romaine, Heart',38,3.35);
INSERT INTO `products` VALUES (4,'Brocolinni - Gaylan, Chinese',90,4.53);
INSERT INTO `products` VALUES (5,'Sauce - Ranch Dressing',94,1.63);
INSERT INTO `products` VALUES (6,'Petit Baguette',14,2.39);
INSERT INTO `products` VALUES (7,'Spaghetti',98,3.29);
INSERT INTO `products` VALUES (8,'Island Oasis - Raspberry',26,0.74);
INSERT INTO `products` VALUES (9,'Nescafe',67,2.26);
INSERT INTO `products` VALUES (10,'Broom - Push',6,1.09);

CREATE TABLE `payment_methods` (
  `payment_method_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `payment_methods` VALUES (1,'Credit Card');
INSERT INTO `payment_methods` VALUES (2,'Cash');
INSERT INTO `payment_methods` VALUES (3,'Transfer');
INSERT INTO `payment_methods` VALUES (4,'Loan');


CREATE TABLE `shippers` (
  `shipper_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`shipper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `shippers` VALUES (1,'Amadou Aly');
INSERT INTO `shippers` VALUES (2,'Piter saw');
INSERT INTO `shippers` VALUES (3,'Bamoussa cisse');
INSERT INTO `shippers` VALUES (4,'Mahrez, Piter and Mohmaed');
INSERT INTO `shippers` VALUES (5,'Malamine');
INSERT INTO `shippers` VALUES (11,'Cheick, Boua and Balamini');
INSERT INTO `shippers` VALUES (22,'BAmussa, BABA and ISou');


CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `customers` VALUES (100,'ALY','AHMED','Male','1986-03-28','781-932-9754','0 Sage Terrace','BAMAKO',6000);
INSERT INTO `customers` VALUES (101,'ISSA','SYLA','Male','1986-04-13','804-427-9456','14187 Commercial Trail','KAYE',1047);
INSERT INTO `customers` VALUES (102,'Cristiana','Sema','Female','1985-02-07','719-724-7869','251 Springs Junction','SIKASOU',5507);
INSERT INTO `customers` VALUES (103,'Mama','Mira','Male','1974-04-14','407-231-8017','30 Arapahoe Terrace','ISTANBUL',4520);
INSERT INTO `customers` VALUES (104,'MUSSA','KEITA','Male','1973-11-07',NULL,'5 Spohn Circle','BAMAKO',4675);
INSERT INTO `customers` VALUES (105,'FATOUMATA','MOHAMED','Female','1991-09-04','312-480-8498','7 Manley Drive','ISTANBUL',5803);
INSERT INTO `customers` VALUES (106,'MARY','COULIBALY','Female','1964-08-30','615-641-4759','50 Lillian Crossing','BAMAKO',5672);
INSERT INTO `customers` VALUES (107,'PITER','Naseby','Male','1993-07-17','941-527-3977','538 Mosinee Center','BURSA',1820);
INSERT INTO `customers` VALUES (108,'HALIMA','ISSA','Female','1992-05-23','559-181-3744','3520 Ohio Trail','SEGOU',1986);
INSERT INTO `customers` VALUES (109,'LEWIS','MOASE','Male','1969-10-13','404-246-3370','avcilar d12','Istanbul',2000);
INSERT INTO `customers` VALUES (200,'Djeneba','MOHAMED','Female','1991-09-04','312-480-8498','7 Manley Drive','ISTANBUL',6000);
INSERT INTO `customers` VALUES (201,'Gaoussou','COULIBALY','Female','1964-08-30','615-641-4759','50 Lillian Crossing','BAMAKO',2342);
INSERT INTO `customers` VALUES (202,'Motaz','Issa','Male','1993-07-17','941-527-3977','538 Mosinee Center','BURSA',3000);
INSERT INTO `customers` VALUES (203,'ABoubaccar','ISSA','Male','1992-05-23','559-181-3744','3520 Ohio Trail','SEGOU',5586);
INSERT INTO `customers` VALUES (204,'Ibrahim','MOASE','Male','1969-10-13','404-246-3370','68 Lawn Avenue','KIDAL',5560);
INSERT INTO `customers` VALUES (205,'Abdoulah','Rahim','Male','1969-10-13','404-246-3370','68 muan Avenue','Moroco',5560);



CREATE TABLE `order_statuses` (
  `order_status_id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `order_statuses` VALUES (1,'Processed');
INSERT INTO `order_statuses` VALUES (2,'Shipped');
INSERT INTO `order_statuses` VALUES (3,'Delivered'); 


CREATE TABLE `orders` (
  `order_id` int(25) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `shipped_date` date  not NULL,
  `shipper_id` smallint(6) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customers_idx` (`customer_id`),
  KEY `fk_orders_shippers_idx` (`shipper_id`),
  KEY `fk_orders_order_statuses_idx` (`status`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_order_statuses` FOREIGN KEY (`status`) REFERENCES `order_statuses` (`order_status_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_shippers` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`shipper_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `orders` VALUES (1,100,'2021-01-30',1,'2021-02-05',2,1);
INSERT INTO `orders` VALUES (2,105,'2020-08-02',2,'2020-08-03',4,2);
INSERT INTO `orders` VALUES (3,200,'2022-12-01',1,'2022-12-18',11,8);
INSERT INTO `orders` VALUES (4,105,'2022-01-22',1,'2022-03-18',5,3);
INSERT INTO `orders` VALUES (5,104,'2021-08-25',2,'2021-08-26',3,2);
INSERT INTO `orders` VALUES (6,105,'2021-11-18',1,'2021-11-27',3,5);
INSERT INTO `orders` VALUES (7,103,'2021-09-22',3,'2021-09-27',4,4);
INSERT INTO `orders` VALUES (8,205,'2021-06-08',3,'2021-06-20',4,8);
INSERT INTO `orders` VALUES (10,100,'2020-12-31',2,'2021-01-03',2,10);


CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(15) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  PRIMARY KEY (`payment_id`),
 `invoice_id` int(25) NOT NULL,
  KEY `fk_client_id_idx` (`customer_id`),
  KEY `fk_payment_payment_method_idx` (`payment_method`),
  CONSTRAINT `fk_payment_client` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `payments` VALUES (01,100,'2022-02-12',8.18,1,111);
INSERT INTO `payments` VALUES (02,105,'2022-07-03',74.55,1,112);
INSERT INTO `payments` VALUES (03,103,'2021-05-11',0.03,4,113);
INSERT INTO `payments` VALUES (04,105,'2022-03-26',87.44,4,1119);
INSERT INTO `payments` VALUES (05,200,'2021-07-15',80.31,3,1118);
INSERT INTO `payments` VALUES (06,109,'2022-06-12',68.10,1,1115);
INSERT INTO `payments` VALUES (07,205,'2021-01-08',32.77,3,1117);
INSERT INTO `payments` VALUES (08,104,'2022-02-02',10.00,2,1110);
INSERT INTO `payments` VALUES (09,107,'2020-06-15',68.10,1,111);
INSERT INTO `payments` VALUES (010,102,'2022-01-08',32.77,1,1116);
INSERT INTO `payments` VALUES (011,101,'2022-01-09',10.00,1,113);


CREATE TABLE `invoices` (
  `invoice_id` int(25) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `invoice_total` decimal(9,2) NOT NULL,
  `payment_total` decimal(9,2) NOT NULL DEFAULT '0.00',
  `invoice_date` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `FK_customer_id` (`customer_id`),
  CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `invoices` VALUES (111,100,101.79,0.00,'2021-03-09','2021-03-29');
INSERT INTO `invoices` VALUES (112,101,175.32,8.18,'2021-06-11','2021-07-01');
INSERT INTO `invoices` VALUES (113,204,147.99,0.00,'2021-07-31','2021-08-20');
INSERT INTO `invoices` VALUES (115,104,169.36,0.00,'2021-07-18','2021-08-07');
INSERT INTO `invoices` VALUES (116,105,157.78,74.55,'2022-01-29','2022-02-18');
INSERT INTO `invoices` VALUES (117,108,133.87,0.00,'2021-09-04','2021-09-24');
INSERT INTO `invoices` VALUES (118,106,189.12,0.00,'2021-05-20','2021-06-09');
INSERT INTO `invoices` VALUES (119,203,172.17,0.00,'2020-07-09','2020-07-29');
INSERT INTO `invoices` VALUES (1110,202,159.50,0.00,'2020-06-30','2020-07-20');
INSERT INTO `invoices` VALUES (1111,200,126.15,0.03,'2021-01-07','2021-01-27');
INSERT INTO `invoices` VALUES (1113,201,135.01,87.44,'2022-06-25','2022-07-15');
INSERT INTO `invoices` VALUES (1115,102,167.29,80.31,'2020-11-25','2020-12-15');
INSERT INTO `invoices` VALUES (1116,205,162.02,0.00,'2020-03-30','2020-04-19');
INSERT INTO `invoices` VALUES (1117,109,126.38,68.10,'2021-07-30','2021-08-19');
INSERT INTO `invoices` VALUES (1118,204,180.17,42.77,'2021-05-23','2021-06-12');
INSERT INTO `invoices` VALUES (11120,100,134.47,0.00,'2022-11-23','2022-12-13');

/*set thoery*/

select o.customer_id,o.order_date, o.status, oc.name, p.product_name
from orders o
join order_statuses oc
join products p
where oc.name like 'shipped' /*to chack status of our products*/
order by order_date desc;

select o.order_id,
	   o.order_date,
       c.First_name,
       c.Last_name,
       os.name as 'current Status'
from orders o
join customers c on o.customer_id = c.customer_id
join order_statuses os on o.status = os.order_status_id;

select *
from payments p
join products pr
order by date desc;

/*TRIGGER*/
delimiter //
create trigger payments_after_insert
	after  insert on payments
    for each row
begin 
	update invoices
    set payment_total = payment_total + new.amount
    where invoice_id = new.invoice_id
end ;
delimiter ;

delimiter //
CREATE TRIGGER payment_date_trigger
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
UPDATE orders
SET payment_date = NEW.payment_date
WHERE order_id = NEW.order_id;
END;
delimiter ;


/* some DATA ANALYSE */
-- checck how many Male or Female we have got

SELECT gender, COUNT(*) as 'TOTAL OF GENDER'
FROM customers
GROUP BY gender;
/*Number of shippers in the store*/

SELECT COUNT(*) as 'TOTAL OF SHIPPERS'
FROM shippers;

/* Check who is the best client from the Boutique according to their Points the more you buy the more you get points*/
SELECT  first_name, gender,points  as 'BEST CLEINT'
FROM customers
GROUP BY customer_id
ORDER BY points DESC
LIMIT 5; /*I only need TOP 5*/

SELECT avg(points)
FROM customers
order BY gender;