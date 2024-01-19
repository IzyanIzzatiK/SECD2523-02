REM   Script: DB SQL Script - Kupi Cham
REM   SQL Script for DB Food Recipe Finder Project by Kupi Cham.

CREATE TABLE Measurement ( 
    measurementID NUMBER PRIMARY KEY,  
    measurements VARCHAR(255),  
    abbreviation VARCHAR(50) 
);

CREATE TABLE Menus ( 
    menuID NUMBER PRIMARY KEY, 
    menu VARCHAR(255) 
);

CREATE TABLE Levels ( 
    levelID NUMBER PRIMARY KEY,  
    levelType VARCHAR(255) 
);

CREATE TABLE Ingredients ( 
    ingredientID NUMBER PRIMARY KEY,  
    ingredient VARCHAR(255) 
);

CREATE TABLE FoodCategories (  
    foodCategoryID NUMBER PRIMARY KEY,  
    foodCategory VARCHAR(255) 
);

CREATE TABLE Cuisines ( 
    cuisineID NUMBER PRIMARY KEY,  
    cuisine VARCHAR(255) 
);

CREATE TABLE Course ( 
    courseID NUMBER PRIMARY KEY,  
    course VARCHAR(255) 
);

CREATE TABLE Recipe ( 
    recipeID NUMBER PRIMARY KEY, 
    name VARCHAR(255), 
    prep_time NUMBER, 
    cook_time NUMBER, 
    ready_in NUMBER, 
    calories_per_servings NUMBER, 
    levelID NUMBER, 
    rating DECIMAL, 
    cuisineID NUMBER, 
    FOREIGN KEY (levelID) REFERENCES Levels (levelID), 
    FOREIGN KEY (cuisineID) REFERENCES Cuisines (cuisineID) 
);

CREATE TABLE NutritionalInformation (  
    nutritionalInformationID NUMBER PRIMARY KEY, 
    nutrition VARCHAR(255), 
    measurementID NUMBER, 
    FOREIGN KEY (measurementID) REFERENCES Measurement (measurementID) 
);

CREATE TABLE users( 
    userID VARCHAR(50) PRIMARY KEY, 
    fullName VARCHAR(255), 
    firstName VARCHAR(255), 
    lastName VARCHAR(255), 
    password VARCHAR(255), 
    phoneNumber VARCHAR(255), 
    email VARCHAR(255), 
    recipeID NUMBER, 
    FOREIGN KEY (recipeID) REFERENCES Recipe (recipeID) 
);

CREATE TABLE recipeIngredients ( 
    recipeIngredientID NUMBER PRIMARY KEY,  
    recipeID NUMBER,  
    measurementID NUMBER, 
    ingredientID NUMBER, 
    FOREIGN KEY (recipeID) REFERENCES Recipe (recipeID), 
    FOREIGN KEY (measurementID) REFERENCES Measurement (measurementID), 
    FOREIGN KEY (ingredientID) REFERENCES Ingredients (ingredientID) 
);

CREATE TABLE MenuRecipes ( 
    menuRecipes NUMBER PRIMARY KEY, 
    menuID NUMBER, 
    recipeID NUMBER, 
    FOREIGN KEY (menuID) REFERENCES Menus (menuID), 
    FOREIGN KEY (recipeID) REFERENCES Recipe (recipeID) 
);

CREATE TABLE RecipeFoodCategories (  
    rfcID INT PRIMARY KEY,  
    recipeID INT,  
    foodCategoryID INT, 
    FOREIGN KEY (recipeID) REFERENCES Recipe (recipeID), 
    FOREIGN KEY (foodCategoryID) REFERENCES FoodCategories (foodCategoryID) 
);

CREATE TABLE RecipeCourse ( 
    recipeCourseID INT PRIMARY KEY,  
    recipeID INT, 
    courseID INT, 
    FOREIGN KEY (recipeID) REFERENCES Recipe (recipeID), 
    FOREIGN KEY (courseID) REFERENCES Course (courseID) 
);

CREATE TABLE RecipeNutritionalInformation ( 
    rID INT PRIMARY KEY, 
    recipeID INT, 
    nutritionalInformationID INT, 
    FOREIGN KEY (recipeID) REFERENCES Recipe (recipeID), 
    FOREIGN KEY (nutritionalInformationID) REFERENCES NutritionalInformation (nutritionalInformationID) 
);

RECIPE COURSE TABLE 


 INSERT INTO Course (courseID, course) VALUES (1, 'Appetizer');

 INSERT INTO Course (courseID, course) VALUES(2, 'Main Course');

 INSERT INTO Course (courseID, course) VALUES(3, 'Dessert');

 INSERT INTO Course (courseID, course) VALUES(4, 'Side Dish');

 INSERT INTO Course (courseID, course) VALUES(5, 'Beverage');

INSERT INTO Cuisines (cuisineID, cuisine) VALUES (1, 'Italian');

INSERT INTO Cuisines (cuisineID, cuisine) VALUES (2, 'Mexican');

INSERT INTO Cuisines (cuisineID, cuisine) VALUES (3, 'Chinese');

INSERT INTO Cuisines (cuisineID, cuisine) VALUES (4, 'Indian');

INSERT INTO Cuisines (cuisineID, cuisine) VALUES (5, 'Japanese');

INSERT INTO FoodCategories (foodCategoryID, foodCategory) VALUES (1, 'Appetizers');

INSERT INTO FoodCategories (foodCategoryID, foodCategory) VALUES (2, 'Main Dishes');

INSERT INTO FoodCategories (foodCategoryID, foodCategory) VALUES (3,'Desserts');

INSERT INTO Ingredients (ingredientID, ingredient) VALUES (1, 'Salt');

INSERT INTO Ingredients (ingredientID, ingredient) VALUES (2, 'Pepper');

INSERT INTO Ingredients (ingredientID, ingredient) VALUES (3, 'Sugar');

INSERT INTO Ingredients (ingredientID, ingredient) VALUES (4, 'Flour');

INSERT INTO Ingredients (ingredientID, ingredient) VALUES (5, 'Butter');

INSERT INTO  Levels (levelID, levelType) VALUES (1, 'Beginner');

INSERT INTO Levels (levelID, levelType) VALUES (2, 'Intermediate');

INSERT INTO Levels (levelID, levelType) VALUES (3, 'Advanced');

INSERT INTO  Levels (levelID, levelType) VALUES  (4, 'Expert');

INSERT INTO  Levels (levelID, levelType) VALUES  (5, 'Master');

INSERT INTO Menus (menuID, menu) VALUES  (1, 'Breakfast');

INSERT INTO  Menus (menuID, menu) VALUES  (2, 'Lunch');

INSERT INTO  Menus (menuID, menu) VALUES  (3, 'Dinner');

INSERT INTO Menus (menuID, menu) VALUES  (4, 'Snacks');

INSERT INTO  Menus (menuID, menu) VALUES  (5, 'Dessert');

INSERT INTO Measurement (measurementID, measurements, abbreviation) VALUES (1, 'Cup', 'C');

INSERT INTO Measurement (measurementID, measurements, abbreviation) VALUES   (2, 'Teaspoon', 'tsp');

INSERT INTO Measurement (measurementID, measurements, abbreviation) VALUES (3, 'Tablespoon', 'tbsp');

INSERT INTO Measurement (measurementID, measurements, abbreviation) VALUES   (4, 'Ounce', 'oz');

INSERT INTO Measurement (measurementID, measurements, abbreviation) VALUES   (5, 'Gram', 'g');

INSERT INTO Recipe (recipeID, name, prep_time, cook_time, ready_in, calories_per_servings,levelID,rating,cuisineID) 
VALUES(1,'Spaghetti Bolognese',20,30,50,500,2,4.5,1);

INSERT INTO Recipe (recipeID, name, prep_time, cook_time, ready_in, calories_per_servings,levelID,rating,cuisineID) 
VALUES 
  (2, 'Chicken Parmesan', 15, 45, 60, 600, 3, 4.2, 2);

INSERT INTO Recipe (recipeID, name, prep_time, cook_time, ready_in, calories_per_servings,levelID,rating,cuisineID) 
VALUES 
  (3, 'Beef Stir Fry', 10, 20, 30, 400, 1, 4.8, 3);

INSERT INTO Recipe (recipeID, name, prep_time, cook_time, ready_in, calories_per_servings,levelID,rating,cuisineID) 
VALUES 
  (4, 'Vegetable Curry', 25, 40, 65, 300, 2, 4.0, 4);

INSERT INTO Recipe (recipeID, name, prep_time, cook_time, ready_in, calories_per_servings,levelID,rating,cuisineID) 
VALUES 
  (5,'Salmon with Lemon Butter Sauce',12,25,37,450,3,4.6,5);

INSERT INTO MenuRecipes (menuRecipes, menuID, recipeID) VALUES (1, 1, 1);

INSERT INTO MenuRecipes (menuRecipes, menuID, recipeID) VALUES (2, 1, 2);

INSERT INTO MenuRecipes (menuRecipes, menuID, recipeID) VALUES (3, 2, 3);

INSERT INTO MenuRecipes (menuRecipes, menuID, recipeID) VALUES (4, 2, 4);

INSERT INTO MenuRecipes (menuRecipes, menuID, recipeID) VALUES (5, 3, 5);

INSERT INTO NutritionalInformation (nutritionalInformationID,nutrition,measurementID) 
VALUES (1, 'Protein', 1);

INSERT INTO NutritionalInformation (nutritionalInformationID,nutrition,measurementID) 
VALUES 
  (2, 'Carbohydrates', 1);

INSERT INTO NutritionalInformation (nutritionalInformationID,nutrition,measurementID) 
VALUES 
  (3, 'Fat', 1);

INSERT INTO NutritionalInformation (nutritionalInformationID,nutrition,measurementID) 
VALUES 
  (4, 'Fiber', 1);

INSERT INTO NutritionalInformation (nutritionalInformationID,nutrition,measurementID) 
VALUES 
  (5, 'Sugar', 1);

INSERT INTO RecipeCourse (recipeCourseID, recipeID, courseID) VALUES(1, 1, 1);

INSERT INTO RecipeCourse (recipeCourseID, recipeID, courseID) VALUES (2, 2, 3);

INSERT INTO RecipeCourse (recipeCourseID, recipeID, courseID) VALUES (3, 3, 2);

INSERT INTO RecipeCourse (recipeCourseID, recipeID, courseID) VALUES (4, 4, 1);

INSERT INTO RecipeCourse (recipeCourseID, recipeID, courseID) VALUES (5, 5, 3);

ALTER TABLE RECIPE 
ADD Description VARCHAR(255);

SELECT * FROM RECIPE;

ALTER TABLE RECIPE 
MODIFY DESCRIPTION VARCHAR(1000);

SELECT * FROM RECIPE;

UPDATE RECIPE 
SET DESCRIPTION = 'combine ground beef, onion, garlic, carrot, and celery with olive oil, crushed tomatoes, tomato paste, red wine (optional), oregano, and basil, seasoning it to taste. Serve the flavorful sauce over cooked spaghetti, garnish with grated Parmesan, and optionally add fresh basil.' 
WHERE RECIPEID = 1;

SELECT * FROM RECIPE;

UPDATE RECIPE 
SET DESCRIPTION = 'First, dipping chicken cutlets in beaten eggs and coating them with seasoned breadcrumbs. Fry the cutlets until golden brown on both sides. Transfer the fried cutlets to a baking dish, top them with marinara sauce and mozzarella cheese, and bake until the cheese is melted and bubbly. Meanwhile, cook spaghetti according to your taste. Serve the chicken over spaghetti and garnish with fresh basil.' 
WHERE RECIPEID = 2;

UPDATE RECIPE 
SET DESCRIPTION = 'Start by marinating thinly sliced beef in soy sauce and sesame oil. Stir-fry the marinated beef in a wok until browned, then set it aside. In the same wok, stir-fry garlic, ginger, and assorted vegetables until crisp-tender. Add the cooked beef back to the wok, toss everything together.' 
WHERE RECIPEID = 3;

UPDATE RECIPE 
SET DESCRIPTION = 'Create Vegetable Curry by sautéing chopped onion and garlic until softened. Add a blend of curry spices and stir to release their flavors. Introduce chopped vegetables, tomatoes, and coconut milk to the pot, simmering until the vegetables are tender and the flavors meld together beautifully.' 
WHERE RECIPEID = 4;

SELECT * FROM RECIPE;

UPDATE RECIPE 
SET DESCRIPTION = 'Season the salmon fillets with salt and pepper. Sear the salmon until golden on both sides. In the same pan, melt butter, sauté minced garlic, and squeeze fresh lemon juice into the mix. Optionally, add white wine for extra depth. Drizzle this luscious lemon-infused butter sauce over the salmon fillets and garnish with chopped fresh parsley before serving.' 
WHERE RECIPEID = 5;

SELECT * FROM RECIPE;

SELECT * FROM measurement;

insert into measurement 
values (6,'Milligram','mg');

select * from measurement;

select * from cuisines;

insert into cuisines 
values(6,'Thai');

insert into cuisines 
values(7,'Malay');

insert into cuisines 
values(8,'Western');

select * from ingredients;

select * from cuisines;

select * from ingredients;

insert into ingredients 
values(6,'Parsley');

insert into ingredients 
values(7,'Garlic');

insert into ingredients 
values(8,'Lemon');

insert into ingredients 
values(9,'Olive oil');

insert into ingredients 
values(10,'Coconut milk');

insert into ingredients 
values(11,'Soy sauce');

insert into ingredients 
values(12,'Sesame oil');

insert into ingredients 
values(13,'Tomato');

insert into ingredients 
values(14,'Ginger');

insert into ingredients 
values(15,'Basil');

insert into ingredients 
values(16,'Chicken');

insert into ingredients 
values(17,'Beef');

insert into ingredients 
values(18,'Eggs');

insert into ingredients 
values(19,'Breadcrumbs');

insert into ingredients 
values(20,'Spaghetti');

select * from ingredients;

select * from recipe;

RECIPE COURSE TABLE 


SELECT * FROM RECIPE;

UPDATE RECIPE 
SET DESCRIPTION = 'combine ground beef, onion, garlic, carrot, and celery with olive oil, crushed tomatoes, tomato paste, red wine (optional), oregano, and basil, seasoning it to taste. Serve the flavorful sauce over cooked spaghetti, garnish with grated Parmesan, and optionally add fresh basil.' 
WHERE RECIPEID = 1;

ALTER TABLE RECIPE 
MODIFY DESCRIPTION VARCHAR(1000);

UPDATE RECIPE 
SET DESCRIPTION = 'combine ground beef, onion, garlic, carrot, and celery with olive oil, crushed tomatoes, tomato paste, red wine (optional), oregano, and basil, seasoning it to taste. Serve the flavorful sauce over cooked spaghetti, garnish with grated Parmesan, and optionally add fresh basil.' 
WHERE RECIPEID = 1;

SELECT * FROM RECIPE;

SELECT * FROM RECIPE;

UPDATE RECIPE 
SET DESCRIPTION = 'First, dipping chicken cutlets in beaten eggs and coating them with seasoned breadcrumbs. Fry the cutlets until golden brown on both sides. Transfer the fried cutlets to a baking dish, top them with marinara sauce and mozzarella cheese, and bake until the cheese is melted and bubbly. Meanwhile, cook spaghetti according to your taste. Serve the chicken over spaghetti and garnish with fresh basil.' 
WHERE RECIPEID = 2;

UPDATE RECIPE 
SET DESCRIPTION = 'Start by marinating thinly sliced beef in soy sauce and sesame oil. Stir-fry the marinated beef in a wok until browned, then set it aside. In the same wok, stir-fry garlic, ginger, and assorted vegetables until crisp-tender. Add the cooked beef back to the wok, toss everything together.' 
WHERE RECIPEID = 3;

UPDATE RECIPE 
SET DESCRIPTION = 'Create Vegetable Curry by sautéing chopped onion and garlic until softened. Add a blend of curry spices and stir to release their flavors. Introduce chopped vegetables, tomatoes, and coconut milk to the pot, simmering until the vegetables are tender and the flavors meld together beautifully.' 
WHERE RECIPEID = 4;

UPDATE RECIPE 
SET DESCRIPTION = 'Season the salmon fillets with salt and pepper. Sear the salmon until golden on both sides. In the same pan, melt butter, sauté minced garlic, and squeeze fresh lemon juice into the mix. Optionally, add white wine for extra depth. Drizzle this luscious lemon-infused butter sauce over the salmon fillets and garnish with chopped fresh parsley before serving.' 
WHERE RECIPEID = 5;

SELECT * FROM RECIPE;

SELECT * FROM RECIPE;

SELECT * FROM measurement;

select * from measurement;

select * from cuisines;

select * from cuisines;

select * from ingredients;

select * from ingredients;

select * from ingredients;

select * from recipe;

select * from foodcategories;

select * from course;

select * from nutritionalinformation;

select * from foodcategories;

update foodcategories 
set foodcategory = 'Pasta' 
where foodcategoryid = 1;

update foodcategories 
set foodcategory = 'Chicken' 
where foodcategoryid = 2;

update foodcategories 
set foodcategory = 'Meat' 
where foodcategoryid = 2;

select * from foodcategories;

update foodcategories 
set foodcategory = 'Chicken' 
where foodcategoryid = 3;

insert into foodcategories 
values(4,'Fish');

insert into foodcategories 
values(5,'Vegetables');

select * from foodcategories;

select * from foodcategories;

update recipefoodcategories 
set foodcategoryid =5 
where recipeid = 4;

select* from recipefoodcategories;

insert into recipefoodcategories 
values (1,1,1);

insert into recipefoodcategories 
values (2,2,3);

insert into recipefoodcategories 
values (3,3,2);

insert into recipefoodcategories 
values (4,4,5);

insert into recipefoodcategories 
values (5,5,4);

select * from recipefoodcategories;

select * from course;

select * from recipeingredients;

INSERT INTO recipeIngredients (recipeIngredientID,recipeID,measurementID,ingredientID) 
VALUES 
  (1, 1, 1, 1);

INSERT INTO recipeIngredients (recipeIngredientID,recipeID,measurementID,ingredientID) 
VALUES 
  (2, 1, 2, 2);

INSERT INTO recipeIngredients (recipeIngredientID,recipeID,measurementID,ingredientID) 
VALUES 
  (3, 2, 3, 3);

INSERT INTO recipeIngredients (recipeIngredientID,recipeID,measurementID,ingredientID) 
VALUES 
  (4, 2, 4, 4);

INSERT INTO recipeIngredients (recipeIngredientID,recipeID,measurementID,ingredientID) 
VALUES 
  (5, 3, 5, 5);

INSERT INTO RecipeNutritionalInformation (rID, recipeID, nutritionalInformationID) 
VALUES 
  (1, 1, 1);

INSERT INTO RecipeNutritionalInformation (rID, recipeID, nutritionalInformationID) 
VALUES 
  (2, 2, 2);

INSERT INTO RecipeNutritionalInformation (rID, recipeID, nutritionalInformationID) 
VALUES 
  (3, 3, 3);

INSERT INTO RecipeNutritionalInformation (rID, recipeID, nutritionalInformationID) 
VALUES 
  (4, 4, 4);

INSERT INTO RecipeNutritionalInformation (rID, recipeID, nutritionalInformationID) 
VALUES 
  (5, 5, 5);

INSERT INTO users (userID, fullName,firstName,lastName,password,phoneNumber,email,recipeID) 
VALUES 
  ('1','John Doe','John','Doe','password123','1234567890','johndoe@example.com',1);

INSERT INTO users (userID, fullName,firstName,lastName,password,phoneNumber,email,recipeID) 
VALUES 
  ( '2','Jane Smith','Jane','Smith','password456','0987654321','janesmith@example.com',2);

INSERT INTO users (userID, fullName,firstName,lastName,password,phoneNumber,email,recipeID) 
VALUES 
  ('3','Mike Johnson','Mike','Johnson','password789','9876543210','mikejohnson@example.com',3);

INSERT INTO users (userID, fullName,firstName,lastName,password,phoneNumber,email,recipeID) 
VALUES 
  ('4','Sarah Williams','Sarah','Williams','passwordabc','0123456789','sarahwilliams@example.com',4);

INSERT INTO users (userID, fullName,firstName,lastName,password,phoneNumber,email,recipeID) 
VALUES 
  ('5','David Brown','David','Brown','passwordxyz','6789012345','davidbrown@example.com',5);

SELECT 
  u.userID, 
  u.fullName, 
  u.firstName, 
  u.lastName, 
  u.password, 
  u.phoneNumber, 
  u.email, 
  r.recipeID 
FROM 
  users u 
  LEFT JOIN Recipe r ON u.recipeID = r.recipeID;

select * from cuisines;

insert into cuisines 
values(9,'French');

insert into cuisines 
values(10,'Greek');

insert into cuisines 
values(11,'Spanish');

insert into cuisines 
values(12,'Brazillian');

insert into cuisines 
values(13,'Lebanese');

insert into cuisines 
values(14,'Vietnamese');

insert into cuisines 
values(15,'Korean');

insert into cuisines 
values(16,'Turkish');

insert into cuisines 
values(17,'Carribean');

insert into cuisines 
values(18,'Peruvian');

insert into cuisines 
values(19,'Ethiopian');

insert into cuisines 
values(20,'Indonesian');

select * from cuisines;

select * from recipe;

select * from ingredients;

select * from cuisines;

insert into recipe 
values(6,'French Toast',10,10,20,500,1,4.5,9,'Whisk two eggs, 1/2 cup milk, and a pinch of cinnamon in a bowl, dip bread slices in the mixture, cook on a buttered skillet until golden brown (2-3 mins each side), transfer to a plate, and serve warm with maple syrup, powdered sugar, or fresh berries if desired.');

insert into recipe 
values(7,'Mushroom Soup',15,20,35,300,2,4.9,8,'Sauté finely chopped onions and garlic in butter until softened, add sliced mushrooms and cook until tender, pour in vegetable or chicken broth, season with salt, pepper, and thyme, simmer for 15-20 minutes, blend until smooth, stir in cream, heat through, and garnish with fresh herbs before serving.');

insert into recipe 
values(8,'Risotto',20,50,70,400,4,5,1,'Sauté finely chopped onions in olive oil until translucent, add Arborio rice and cook until lightly toasted, pour in a ladle of warm chicken or vegetable broth, stirring until absorbed, repeat until rice is creamy and al dente, stir in Parmesan cheese, salt, and pepper, garnish with fresh herbs, and serve the flavorful risotto warm.');

insert into recipe 
values(9,'Korean Beef Stew',30,50,80,500,5,5,15,'Marinate thinly sliced beef in a mixture of soy sauce, sugar, sesame oil, and garlic, sauté chopped onions and carrots until softened, add marinated beef and brown, pour in beef broth, soy sauce, and a touch of sugar, simmer until beef is tender, stir in sliced mushrooms and tofu, garnish with green onions, and serve the Korean beef stew over rice.');

insert into recipe 
values(10,'French Fries',10,10,20,400,1,4.3,9,'Cut potatoes into uniform sticks, soak in cold water to remove excess starch, pat dry, heat oil to 350°F, fry potatoes until golden brown, drain on paper towels, sprinkle with salt, toss to coat, and serve the crispy French fries hot with your favorite dipping sauce.');

select * from recipe;

select * from users;

SELECT 
  u.userID, 
  u.fullName, 
  u.firstName, 
  u.lastName, 
  u.password, 
  u.phoneNumber, 
  u.email, 
  r.recipeID, 
    r.name 
FROM 
  users u 
  LEFT JOIN Recipe r ON u.recipeID = r.recipeID;

SELECT 
  * 
FROM 
  Recipe 
  JOIN users ON Recipe.recipeID = users.recipeID;

SELECT  
  u.*,  
  r.recipeID,  
  r.name  
FROM  
  users u  
  LEFT JOIN Recipe r ON u.recipeID = r.recipeID;

SELECT  
  u.*,  
  r.name  
FROM  
  users u  
  LEFT JOIN Recipe r ON u.recipeID = r.recipeID;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  r.levelID, 
  r.rating, 
  r.cuisineID 
FROM 
  Recipe r 
  JOIN RecipeNutritionalInformation rni ON r.recipeID = rni.recipeID 
  JOIN recipeIngredients ri ON r.recipeID = ri.recipeID 
  JOIN RecipeFoodCategories rfc ON r.recipeID = rfc.recipeID 
  JOIN RecipeCourse rc ON r.recipeID = rc.recipeID 
  JOIN NutritionalInformation ni ON rni.nutritionalInformationID = ni.nutritionalInformationID 
  JOIN Measurement m ON ri.measurementID = m.measurementID 
  JOIN Ingredients i ON ri.ingredientID = i.ingredientID 
  JOIN FoodCategories fc ON rfc.foodCategoryID = fc.foodCategoryID 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Course co ON rc.courseID = co.courseID 
  JOIN Levels l ON r.levelID = l.levelID;

SELECT 
  r.* 
FROM 
  Recipe r 
  JOIN RecipeNutritionalInformation rni ON r.recipeID = rni.recipeID 
  JOIN recipeIngredients ri ON r.recipeID = ri.recipeID 
  JOIN RecipeFoodCategories rfc ON r.recipeID = rfc.recipeID 
  JOIN RecipeCourse rc ON r.recipeID = rc.recipeID 
  JOIN NutritionalInformation ni ON rni.nutritionalInformationID = ni.nutritionalInformationID 
  JOIN Measurement m ON ri.measurementID = m.measurementID 
  JOIN Ingredients i ON ri.ingredientID = i.ingredientID 
  JOIN FoodCategories fc ON rfc.foodCategoryID = fc.foodCategoryID 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Course co ON rc.courseID = co.courseID 
  JOIN Levels l ON r.levelID = l.levelID;

select * from recipeingredients;

select * from ingredients;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  r.levelID, 
  r.rating, 
  r.cuisineID 
FROM 
  Recipe r 
  JOIN RecipeNutritionalInformation rni ON r.recipeID = rni.recipeID 
  JOIN recipeIngredients ri ON r.recipeID = ri.recipeID 
  JOIN RecipeFoodCategories rfc ON r.recipeID = rfc.recipeID 
  JOIN RecipeCourse rc ON r.recipeID = rc.recipeID 
  JOIN NutritionalInformation ni ON rni.nutritionalInformationID = ni.nutritionalInformationID 
  JOIN Measurement m ON ri.measurementID = m.measurementID 
  JOIN Ingredients i ON ri.ingredientID = i.ingredientID 
  JOIN FoodCategories fc ON rfc.foodCategoryID = fc.foodCategoryID 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Course co ON rc.courseID = co.courseID 
  JOIN Levels l ON r.levelID = l.levelID;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine, 
  r.description 
FROM 
  Recipe r 
  JOIN RecipeNutritionalInformation rni ON r.recipeID = rni.recipeID 
  JOIN recipeIngredients ri ON r.recipeID = ri.recipeID 
  JOIN RecipeFoodCategories rfc ON r.recipeID = rfc.recipeID 
  JOIN RecipeCourse rc ON r.recipeID = rc.recipeID 
  JOIN NutritionalInformation ni ON rni.nutritionalInformationID = ni.nutritionalInformationID 
  JOIN Measurement m ON ri.measurementID = m.measurementID 
  JOIN Ingredients i ON ri.ingredientID = i.ingredientID 
  JOIN FoodCategories fc ON rfc.foodCategoryID = fc.foodCategoryID 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Course co ON rc.courseID = co.courseID 
  JOIN Levels l ON r.levelID = l.levelID;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine, 
  r.description 
FROM 
  Recipe r 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Levels l ON r.levelID = l.levelID;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine, 
  r.description 
FROM 
  Recipe r 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Levels l ON r.levelID = l.levelID 
ORDER BY r.recipeID ASC;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine, 
    co.course, 
  r.description 
FROM 
  Recipe r 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Levels l ON r.levelID = l.levelID 
    JOIN RecipeCourse rc ON rc.recipeID = r.recipeID 
    JOIN Course co ON co.courseID = rc.courseID 
ORDER BY r.recipeID ASC;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine, 
    co.course, 
    fc.foodcategory, 
  r.description 
FROM 
  Recipe r 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Levels l ON r.levelID = l.levelID 
    JOIN RecipeCourse rc ON rc.recipeID = r.recipeID 
    JOIN Course co ON co.courseID = rc.courseID 
    JOIN RecipeFoodCategories rfc ON rfc.recipeID = r.recipeID 
    JOIN FoodCategories fc ON fc.foodCategoryID = rfc.foodCategoryID 
ORDER BY r.recipeID ASC;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine, 
    co.course, 
    fc.foodcategory, 
    i.ingredient, 
  r.description 
FROM 
  Recipe r 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Levels l ON r.levelID = l.levelID 
    JOIN RecipeCourse rc ON rc.recipeID = r.recipeID 
    JOIN Course co ON co.courseID = rc.courseID 
    JOIN RecipeFoodCategories rfc ON rfc.recipeID = r.recipeID 
    JOIN FoodCategories fc ON fc.foodCategoryID = rfc.foodCategoryID 
    JOIN RecipeIngredients ri ON ri.recipeID = r.recipeID 
    JOIN Ingredients i ON i.ingredientID = ri.ingredientID 
ORDER BY r.recipeID ASC;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine 
FROM 
  Recipe r 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Levels l ON r.levelID = l.levelID 
ORDER BY r.recipeID ASC;

SELECT firstName, lastName, phoneNumber, email 
FROM Users;

SELECT firstName, lastName, phoneNumber, email 
FROM Users 
WHERE userID = 1;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine, 
  co.course, 
  fc.foodcategory, 
  i.ingredient, 
  r.description 
FROM 
  Recipe r 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Levels l ON r.levelID = l.levelID 
  JOIN RecipeCourse rc ON rc.recipeID = r.recipeID 
  JOIN Course co ON co.courseID = rc.courseID 
  JOIN RecipeFoodCategories rfc ON rfc.recipeID = r.recipeID 
  JOIN FoodCategories fc ON fc.foodCategoryID = 
       rfc.foodCategoryID 
  JOIN RecipeIngredients ri ON ri.recipeID = r.recipeID 
  JOIN Ingredients i ON i.ingredientID = ri.ingredientID 
WHERE r.recipeID = 1 
ORDER BY r.recipeID ASC;

SELECT userID, firstName, lastName, phoneNumber, email 
FROM Users  
WHERE userID = 1;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine 
FROM 
  Recipe r 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Levels l ON r.levelID = l.levelID 
ORDER BY r.recipeID ASC;

DELETE FROM Recipe 
WHERE recipeID = 8;

SELECT 
  r.recipeID, 
  r.name, 
  r.prep_time, 
  r.cook_time, 
  r.ready_in, 
  r.calories_per_servings, 
  l.leveltype, 
  r.rating, 
  c.cuisine 
FROM 
  Recipe r 
  JOIN Cuisines c ON r.cuisineID = c.cuisineID 
  JOIN Levels l ON r.levelID = l.levelID 
ORDER BY r.recipeID ASC;

