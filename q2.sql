-- Homwork 6

-- 1
SELECT Ingredients.name
FROM Ingredients
WHERE Ingredients.unit_cost < 1;


-- 2 -- 
SELECT name
FROM Ingredients
WHERE NOT EXISTS 
	(SELECT iname 
	FROM Recipes
	WHERE Recipes.iname = Ingredients.name);


-- 3  -- 
SELECT DISTINCT Drinks.name
FROM Drinks, Recipes
WHERE Drinks.name = Recipes.dname
AND Recipes.units  >= 2;


-- 4
SELECT Drinks.name
FROM Drinks, Ingredients, Recipes
WHERE Drinks.name = Recipes.dname
AND Recipes.iname = Ingredients.name
AND (Ingredients.name = 'gin' OR Ingredients.name = 'whiskey');


-- 5 
SELECT name
FROM
	(SELECT Drinks.name, Drinks.price, SUM(Recipes.units * Ingredients.unit_cost) AS Ingredients_cost 
	FROM Drinks, Recipes, Ingredients
	WHERE Drinks.name = Recipes.dname 
	AND Recipes.iname = Ingredients.name 
	GROUP BY Drinks.name, Drinks.price) AS temp
WHERE price >= 2 * Ingredients_cost;


-- 6
SELECT Drinks.name, (Drinks.price - SUM(Recipes.units * Ingredients.unit_cost)) AS profit
FROM Drinks, Recipes, Ingredients
WHERE Drinks.name = Recipes.dname 
AND Recipes.iname = Ingredients.name 
GROUP BY Drinks.name, Drinks.price;


-- 7
SELECT I.name AS Ingredient, D1.name AS Drink1, D2.name AS Drink2
FROM Drinks AS D1, Drinks AS D2, Recipes R1, Recipes R2, Ingredients AS I 
WHERE R1.dname = D1.name 
AND R2.dname = D2.name 
AND R1.iname = I.name 
AND R2.iname = I.name 
AND R1.dname < R2.dname;












