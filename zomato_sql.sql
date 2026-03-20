CREATE DATABASE zomato_analysis;
USE zomato_analysis;
-- 1)Which locations have the highest number of restaurants?
SELECT  location ,COUNT(*) AS total_no_res
FROM zomato_cleaned
GROUP BY location 
ORDER BY total_no_res DESC;
-- 2)Which cuisines are most common across restaurants?
SELECT cuisines ,COUNT(*) AS total_res
FROM zomato_cleaned
GROUP BY cuisines 
ORDER BY total_res DESC;
-- 3)Which locations have the highest average restaurant ratings?
SELECT location , AVG(rate) as r_avg 
FROM zomato_cleaned
GROUP BY location
ORDER BY r_avg DESC
LIMIT 1;
-- 4)Do restaurants that offer online ordering have better ratings?
SELECT online_order,AVG(rate) as avg_r
FROM zomato_cleaned 
GROUP BY online_order;
-- 5)Do restaurants with table booking options have higher ratings?
SELECT book_table,AVG(rate) as avg_r
FROM zomato_cleaned
GROUP BY book_table;
-- 6)How does the cost for two people relate to restaurant ratings?
SELECT `approx_cost(for two people)`,AVG(rate) as avg_r
FROM zomato_cleaned
GROUP BY `approx_cost(for two people)`;
-- higher the cost better the rating 
DESCRIBE zomato_cleaned;
-- 7)Which restaurants have received the highest number of votes?
SELECT * ,rate
FROM zomato_cleaned
ORDER BY rate DESC;
-- 8)Which types of restaurants (e.g., casual dining, cafes) are most common?
 SELECT `listed_in(type)`,COUNT(*) as max_count
 FROM zomato_cleaned
 GROUP BY `listed_in(type)`;
 -- 9)Which cuisine and location combinations have the best ratings?
SELECT cuisines ,location,AVG(rate) as avg_rate
FROM zomato_cleaned 
GROUP BY cuisines,location
ORDER  BY avg_rate DESC
LIMIT 5;
-- 10)Which locations have many restaurants but relatively low ratings (potential improvement areas)?
SELECT location ,count(*) as total_count ,AVG(rate) as avg_rate
from zomato_cleaned
GROUP BY location
having count(*)>100
ORDER BY avg_rate ASC;