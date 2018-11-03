SELECT customer_id, customer_country FROM `customer` WHERE customer_name = "Leandra Frank";

INSERT INTO rental_location
VALUES
(092, 'San Juan Ave. Fresh Meadows 741', 909888455, 'madrid@carrent.com'),
(083, 'Primrose Drive 8123', 909888000, 'vienna@carrent.com'),
(014, 'Villa Park 784', 909888333, 'paris@carrent.com');

INSERT INTO cars 
VALUES 
(444, 200, 090),
(555, 350, 010),
(666, 20, 080);

INSERT INTO `car_info` 
(`car_info_id`, `color`, `model`, `d_purchase`, `horsepower`, `description`, `fk_car_id`) 
VALUES 
('9990', 'green', 'Honda Clarity', '2017-06-14', '200', '', '444');

INSERT INTO `additional` 
(`additional_id`, `type`, `price`, `fk_car_id`) 
VALUES 
('100', 'GPS', '5', '444'), ('101', 'insurance', '18', '555');

ALTER TABLE `invoice` CHANGE `card_num` `card_num` INT(55) NOT NULL;

ALTER TABLE `invoice` CHANGE `card_num` `card_num` BIGINT NOT NULL;

ALTER TABLE `reservation` CHANGE `discount` `discount(%)` INT(11) NOT NULL;

ALTER TABLE `reservation` CHANGE `price` `price(€)` INT(11) NOT NULL;

DELETE FROM `rental_location` WHERE `rental_location`.`location_id` = 83

SELECT price, type, fk_car_id
FROM `additional`
LEFT JOIN `cars` on car_id = fk_car_id;

SELECT m_name, manufacturer_id, fk_employee_id
FROM `car_manufacturer` 
RIGHT JOIN `employee` on employee_id = fk_employee_id;

SELECT price, type, fk_car_id
FROM `additional`
LEFT JOIN `cars` on car_id = fk_car_id
UNION
SELECT price, type, fk_car_id
FROM `additional`
RIGHT JOIN `cars` on car_id = fk_car_id;

SELECT price, type, fk_car_id
FROM `additional`
LEFT JOIN `cars` on car_id = fk_car_id
UNION
SELECT color, description, model
FROM `car_info`
RIGHT JOIN `cars` on car_id = fk_car_id;

SELECT rental_location.location_id, rental_location.loc_address, reservation.reservation_id, reservation.price_€, reservation_info.d_pickup, reservation_info.d_return
FROM ((rental_location
INNER JOIN reservation ON rental_location.location_id = reservation.fk_location_id)
INNER JOIN reservation_info ON reservation.reservation_id = reservation_info.fk_reservation_id);

ALTER TABLE `invoice` ADD `fk_reservation_id` INT(11) NOT NULL AFTER `invoice_date`;