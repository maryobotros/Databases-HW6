-- Homwork 6

-- 0 
-- Create a database called hoework 6 and use that dataase
CREATE DATABASE homework6;
USE homework6;

-- 1
-- List the names of the ingredients that cost less than $1.
SELECT Ingredients.name
FROM Ingredients
WHERE Ingredients.unit_cost < 1;


-- 2 -- 
-- List the name of the ingredients that are not used in any recipes.
SELECT name
FROM Ingredients
WHERE NOT EXISTS 
	(SELECT iname 
	FROM Recipes
	WHERE Recipes.iname = Ingredients.name);


-- 3 
-- List the name of the drinks that use at least 2 ingredients.
SELECT DISTINCT Drinks.name
FROM Drinks, Recipes
WHERE Drinks.name = Recipes.dname
AND Recipes.units  >= 2;


-- 4
-- List the name of the drinks that use either gin or whiskey as one of the ingredients.
SELECT Drinks.name
FROM Drinks, Ingredients, Recipes
WHERE Drinks.name = Recipes.dname
AND Recipes.iname = Ingredients.name
AND (Ingredients.name = 'gin' OR Ingredients.name = 'whiskey');


-- 5 
-- List the names of the drinks where the price is at least twice as high as the combined cost of the ingredients.
SELECT name
FROM
	(SELECT Drinks.name, Drinks.price, SUM(Recipes.units * Ingredients.unit_cost) AS Ingredients_cost 
	FROM Drinks, Recipes, Ingredients
	WHERE Drinks.name = Recipes.dname 
	AND Recipes.iname = Ingredients.name 
	GROUP BY Drinks.name, Drinks.price) AS temp
WHERE price >= 2 * Ingredients_cost;


-- 6
-- List the names of the drinks and the profit made on the sale of each of them. The profit is the difference between price and the cost of the ingredients.
SELECT Drinks.name, (Drinks.price - SUM(Recipes.units * Ingredients.unit_cost)) AS profit
FROM Drinks, Recipes, Ingredients
WHERE Drinks.name = Recipes.dname 
AND Recipes.iname = Ingredients.name 
GROUP BY Drinks.name, Drinks.price;


-- 7
-- For each pair of different drinks that may contain the same ingredient, list the names of the drinks and the name of the shared ingredient. Note that the same pair should not be listed twice.
-- For example, (“Cosmopolitan”, “Bloody Mary”, “Vodka”) and  (“Bloody Mary”, “Cosmopolitan”,  “Vodka”) are considered as the same pair, and should only be listed once.
-- Hint: < or > can be used for comparing strings to avoid duplicates.
SELECT I.name AS Ingredient, D1.name AS Drink1, D2.name AS Drink2
FROM Drinks AS D1, Drinks AS D2, Recipes R1, Recipes R2, Ingredients AS I 
WHERE R1.dname = D1.name 
AND R2.dname = D2.name 
AND R1.iname = I.name 
AND R2.iname = I.name 
AND R1.dname < R2.dname;












