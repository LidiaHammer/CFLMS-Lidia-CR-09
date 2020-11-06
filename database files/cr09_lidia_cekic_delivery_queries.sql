-- 1. how many packages were dropped off at the delivery service company?
SELECT COUNT(pick_or_drop)
FROM drop_pick
WHERE pick_or_drop = 'drop off';

-- 2. how many packages are from Graz?
SELECT COUNT(drop_pick_id), (city) 
FROM `drop_pick` 
INNER JOIN `address` on fk_address_id = address_id 
WHERE city='Graz';

-- 3. show full name of customers who dropped off a package
SELECT COUNT(pick_or_drop), (customer_id), (firstname), (lastname) 
FROM `customer` 
INNER JOIN `name` on fk_name_id = name_id 
INNER JOIN `drop_pick` on fk_drop_pick_id = drop_pick_id 
WHERE pick_or_drop='drop off';

-- 4. who send a package after the 01.10.2020?
SELECT DISTINCT customer_id, firstname, lastname, date_of_deposit
FROM `package` 
INNER JOIN `customer` on fk_customer_id = customer_id 
INNER JOIN `name` on fk_name_id = name_id
WHERE date_of_deposit > '2020-10-01';

-- 5. who send a package after the 01.10.2020 and it was delivered?
SELECT DISTINCT customer_id, firstname, lastname, date_of_deposit, date_of_delivery
FROM `recipient`
INNER JOIN `package` on fk_package_id = package_id 
INNER JOIN `customer` on package.fk_customer_id = customer_id 
INNER JOIN `name` on customer.fk_name_id = name_id
WHERE date_of_deposit > '2020-10-01' AND date_of_delivery > CURRENT_DATE();

--6- Show time of deposit and delivery
SELECT DISTINCT  time_of_delivery, time_of_deposit
FROM `recipient` 
INNER JOIN `package` on fk_package_id= package_id;

--7 How many days does it take for the packages to arrive?
SELECT DATEDIFF (date_of_delivery,date_of_deposit)
FROM `recipient` 
INNER JOIN `package` on fk_package_id= package_id;


