-- Comments in SQL Start with dash-dash --
-- 0
SELECT population FROM world
  WHERE name = 'Germany'


-- 1
SELECT name FROM world
  WHERE name LIKE 'Y%'

-- 2
SELECT name, continent, population FROM world

-- 3
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 4 simple where and order by
SELECT * FROM people WHERE age > 50 ORDER BY age DESC;

-- 5 simple sum
SELECT SUM(page_count) FROM books;

-- 6 simple MIN and MAX
SELECT MIN(age) , MAX(age) FROM people;



-- 7 find all active students
SELECT * FROM students WHERE IsActive;


-- 8 simple GROUP BY
SELECT count(*),age FROM people GROUP BY age;

-- 9 simple HAVING
SELECT count(*),age FROM people GROUP BY age HAVING count(*) >=10;

-- 10
SELECT SUM(population)
FROM world


-- prducts exercise --

-- inserting chair into products
INSERT INTO products (name,price,can_be_returned) VALUES ('chair','44.00','true');

-- inserting stool into products
INSERT INTO products (name,price,can_be_returned) VALUES ('stool' , 25.99 , 'True');

-- inserting stool into products
INSERT INTO products (name,price,can_be_returned) VALUES ('table' , 124.00 , 'false');

-- display all of the rows and collums in products
SELECT * FROM products;

-- display all of the names inside of the products
SELECT name FROM products;

-- display all of the names and prices of the product
SELECT name,price FROM products;

-- add a new product ,makeup whatever youd like
INSERT INTO products (name,price,can_be_returned) VALUES ('froggy-toy' , '3.99' , 'True');

-- display only the products that can be returned 
SELECT name ,can_be_returned FROM products;


-- display products where the price is less than 44.00
SELECT name,price FROM products WHERE price < 44.00;

-- display products that have a price only between 22.50 and 99.00
SELECT name,price FROM products WHERE price BETWEEN 22.50 AND 99.00;

-- there is a sale going on , where everything is $20 off , update the database that it corresponds
UPDATE products SET price = price - 20 where price > 20;

-- delete from the products all prices that are less than 25
DELETE FROM products WHERE price < 25;

-- now that the sale is over , increase the remaining items by 20 dollars
UPDATE products SET price = price + 20;

-- update everything in the database to be returnable 
UPDATE products SET can_be_returned = 'True';

-- Find the app with an ID of 1880.
playstore=# SELECT app_name FROM analytics WHERE id = 1880;

-- Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id,app_name FROM analytics WHERE last_updated = '2018-08-01';

-- Count the number of apps in each category, e.g. “Family | 1972”.
SELECT catagory,count(*) FROM analytics GROUP BY catagory;

-- Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT * FROM analytics ORDER BY reviews DESC LIMIT 5;

--  Find the full record of the app that has the most reviews with a rating greater than equal to 4.8.
SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;


-- Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category , avg(rating) FROM analytics GROUP BY category ORDER BY avg DESC;


-- 7. Find the name, price, and rating of the most expensive app with a rating that's less than 3
SELECT app_name,price,rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- 8. Find all records with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
SELECT * FROM analytics WHERE min_installs <= 50 and rating IS NOT NULL  ORDER BY rating DESC;

-- 9 Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT * FROM analytics WHERE rating < 3 and reviews >= 10000;

-- 10 Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT * FROM analytics WHERE price BETWEEN .1 AND 1 ORDER BY reviews DESC lIMIT 10;

-- 11 Find the most out of date app.
SELECT * FROM analytics WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

-- 12 Find the most expensive app (the query is very similar to #11).
SELECT * FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

-- 13 Count all the reviews in the Google Play Store
SELECT SUM(reviews) AS "ALL REVIEWS" FROM analytics;

-- 14 Find all the categories that have more than 300 apps in them.
SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 400;

-- 15 Find the app that has the highest proportion of reviews to min_installs,
-- among apps that have been installed at least 100,000 times. Display the name of the app
-- along with the number of reviews, the min_installs, and the proportion.
SELECT app_name,reviews,min_installs,reviews AS proportion FROM analytics WHERE min_installs > 100000
ORDER BY proportion DESC LIMIT 1;



-- further study --

-- 1 Find the name and rating of the top rated apps in each category, among apps that have been installed at least 50,000 times.
SELECT app_name,rating,category FROM analytics WHERE (rating , category ) IN (SELECT MAX(rating), category FROM analytics WHERE min_installs > 50000
GROUP BY category)
ORDER BY category;

-- 2 Find all the apps that have a name similar to "facebook".
SELECT * FROM analytics WHERE app_name ILIKE '%facebook%';

-- 3 Find all the apps that have more than 1 genre.
SELECT * FROM analytics WHERE array_length(genres, 1) = 2;

-- 4 Find all the apps that have education as one of their genres.
SELECT * FROM analytics 
  WHERE genres @> '{"Education"}';


