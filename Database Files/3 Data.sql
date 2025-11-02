use HeartyHearthDB
go
delete RecipeCookBook
delete CookBook
delete MealCourseRecipe
delete MealCourse
delete Course
delete Meal
delete RecipeStep
delete RecipeIngredient
delete Measurement
delete Ingredient
delete Recipe
delete Users
delete Cuisine
go


insert Cuisine(Cuisine)
select 'American'
union select 'French'
union select 'English'
union select 'Italian'
union select 'Chinese'


insert Users(FirstName, LastName, UserName)
select 'Izabell', 'Baker', 'ibaker'
union select 'Chef', 'Cook', 'ccook'
union select 'David', 'Boan', 'dboan'


insert Recipe(UserId, CuisineId, RecipeName, Calories, DateDrafted, DatePublished, DateArchived)
--AS You don't need to specify the datetime, you can just specify the date.
select (select u.UserId from Users u where u.UserName = 'dboan'), c.CuisineId, 'Chocolate Chip Cookies', 180, '1/15/2016', '1/15/2016', null from Cuisine c where c.Cuisine = 'American'
union select (select u.UserId from Users u where u.UserName = 'dboan'), c.CuisineId, 'Apple Yogurt Smoothie', 160, '4/8/2016', '9/17/2016', null from Cuisine c where c.Cuisine = 'French'
union select (select u.UserId from Users u where u.UserName = 'dboan'), c.CuisineId, 'Cheese Bread', 340, '3/16/2017', '3/17/2017', null from Cuisine c where c.Cuisine = 'English'
union select (select u.UserId from Users u where u.UserName = 'dboan'), c.CuisineId, 'Butter Muffins', 120, '2/13/2016', '3/1/2016', null from Cuisine c where c.Cuisine = 'American'
union select (select u.UserId from Users u where u.UserName = 'ccook'), c.CuisineId, 'Breaded Chicken', 489, '5/18/2019', '5/27/2019', null from Cuisine c where c.Cuisine = 'Italian'
union select (select u.UserId from Users u where u.UserName = 'ccook'), c.CuisineId, 'Fried Rice', 865, '11/11/2021', '11/17/2021', null from Cuisine c where c.Cuisine = 'Chinese'
union select (select u.UserId from Users u where u.UserName = 'ccook'), c.CuisineId, 'Sweet and Sour Sauce', 460, '5/5/2022', '6/2/2022', null from Cuisine c where c.Cuisine = 'Chinese'
union select (select u.UserId from Users u where u.UserName = 'ccook'), c.CuisineId, 'Pasta Salad', 285, '8/23/2020', '9/20/2020', null from Cuisine c where c.Cuisine = 'Italian'
union select (select u.UserId from Users u where u.UserName = 'dboan'), c.CuisineId, 'Jack and Coke', 60, '4/8/2020', null, '4/10/2020' from Cuisine c where c.Cuisine = 'American'
union select (select u.UserId from Users u where u.UserName = 'dboan'), c.CuisineId, 'Cheese Curds', 60, '4/10/2016', null, null from Cuisine c where c.Cuisine = 'American'


insert Ingredient(Ingredient)
select 'Garlic'
union select 'Sugar'
union select 'White Sugar'
union select 'Oil'
union select 'Eggs'
union select 'Flour'
union select 'Vanilla Sugar'
union select 'Baking Powder'
union select 'Baking Soda'
union select 'Chocolate Chips'
union select 'Granny Smith Apples'
union select 'Vanilla Yogurt'
union select 'Orange Juice'
union select 'Honey'
union select 'Ice'
union select 'Club Bread'
union select 'Butter'
union select 'Shredded Cheese'
union select 'Crushed Garlic'
union select 'Black Pepper'
union select 'Salt'
union select 'Vanilla Pudding'
union select 'Whipped Cream Cheese'
union select 'Sour Cream Cheese'
union select 'Breadcrumbs'
union select 'Minced Parsley'
union select 'Italian Seasoning'
union select 'Chicken Breast'
union select 'Olive Oil'
union select 'Scallions'
union select 'Vegetable Oil'
union select 'Frozen Peas and Carrots'
union select 'Cooked Rice'
union select 'Soy Sauce'
union select 'White Pepper'
union select 'Pineapple Juice'
union select 'Vinegar'
union select 'Brown Sugar'
union select 'Ketchup'
union select 'Cornstarch'
union select 'Water'
union select 'Cooked Pasta'
union select 'Cherry Tomatoes'
union select 'Cucumbers'
union select 'Feta Cheese'
union select 'Torn Basil Leaves'
union select 'Mint Leaves'
union select 'Lemon Juice'
union select 'Dijon Mustard'
union select 'Red Pepper Flakes'
union select 'CocaCola'
union select 'Jack Daniels'


insert Measurement(UOM)
select 'Stick'
union select 'Cups'
union select 'Tbsp'
union select 'Oz'
union select 'Tsp'
union select 'Cloves'
union select 'Pinch'
union select 'Cup'
union select 'Lbs'
union select 'Can'
union select 'Cubes'


insert RecipeIngredient(RecipeId, IngredientId, MeasurementId, Ammount, IngredientSequence)
select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Sugar'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Oil'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 0.5, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Eggs'),
    null, 3, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Flour'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cups'), 3, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Vanilla Sugar'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 1, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Baking Powder'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 2, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Baking Soda'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 0.5, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Chocolate Chips'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 1, 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Granny Smith Apples'),
    null, 3, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Vanilla Yogurt'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cups'), 2, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Sugar'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 2, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Orange Juice'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), .5, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Honey'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 2, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Ice'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cubes'), 6, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Club Bread'),
    null, 1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Butter'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Oz'), 4, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Shredded Cheese'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Oz'), 8, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Crushed Garlic'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cloves'), 2, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Black Pepper'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), .25, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Salt'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Pinch'), 1, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Butter'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Stick'), 1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Sugar'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cups'), 3, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Vanilla Pudding'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 2, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Eggs'),
    null, 4, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Whipped Cream Cheese'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Oz'), 8, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Sour Cream Cheese'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Oz'), 8, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Flour'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 1, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Baking Powder'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 2, 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Breadcrumbs'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cups'), 3, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Crushed Garlic'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cloves'), 3, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Minced Parsley'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 2, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Shredded Cheese'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 1.25, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Salt'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Pinch'), 1, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Black Pepper'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Pinch'), 2, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Eggs'),
    null, 3, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Flour'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 1, 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Chicken Breast'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Lbs'), 2, 9
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Olive Oil'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cups'), 6, 10
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Garlic'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cloves'), 3, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Scallions'),
    null, 2, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Vegetable Oil'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 2, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Olive Oil'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 1, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Frozen peas and carrots'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 1, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Cooked Rice'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cups'), 4, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Soy Sauce'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 1, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Salt'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 1.5, 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'White Pepper'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 0.75, 9
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Eggs'),
    null, 2, 10
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Pineapple Juice'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Brown Sugar'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 0.75, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Vinegar'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 0.33, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Ketchup'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 3, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Soy Sauce'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 2, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Cornstarch'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 1.5, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Water'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 2, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Cooked Pasta'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cups'), 3, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Cherry Tomatoes'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cups'), 2, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Cucumbers'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cups'), 1, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Feta Cheese'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 1, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Torn Basil Leaves'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 1, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Minced Parsley'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 0.5, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Mint Leaves'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 0.5, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Olive Oil'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cup'), 0.25, 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Lemon Juice'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tbsp'), 3, 9
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Dijon Mustard'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 1, 10
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Crushed Garlic'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cloves'), 3, 11
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Italian Seasoning'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 1, 12
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Red Pepper Flakes'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 0.25, 13
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Salt'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Tsp'), 0.25, 14
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Jack and Coke'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'CocaCola'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Can'), 1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Jack and Coke'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Jack Daniels'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Oz'), 3, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Jack and Coke'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Ice'),
    (select m.MeasurementId from Measurement m where m.UOM = 'Cubes'), 4, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Jack and Coke'),
    (select i.IngredientId from Ingredient i where i.Ingredient = 'Mint Leaves'),
    null, 2, 4


insert RecipeStep(RecipeId, StepSequence, Instructions)
select r.RecipeId, 1, 'First combine sugar, oil and eggs in a bowl' from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'
union select r.RecipeId, 2, 'mix well' from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'
union select r.RecipeId, 3, 'add flour, vanilla sugar, baking powder and baking soda' from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'
union select r.RecipeId, 4, 'beat for 5 minutes' from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'
union select r.RecipeId, 5, 'add chocolate chips' from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'
union select r.RecipeId, 6, 'freeze for 1-2 hours' from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'
union select r.RecipeId, 7, 'roll into balls and place spread out on a cookie sheet' from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'
union select r.RecipeId, 8, 'bake on 350 for 10 min' from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'
union select r.RecipeId, 1, 'Peel the apples and dice' from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'
union select r.RecipeId, 2, 'Combine all ingredients in bowl except for apples and ice cubes' from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'
union select r.RecipeId, 3, 'mix until smooth' from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'
union select r.RecipeId, 4, 'add apples and ice cubes' from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'
union select r.RecipeId, 5, 'pour into glasses' from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'
union select r.RecipeId, 1, 'Slit bread every 3/4 inch' from Recipe r where r.RecipeName = 'Cheese Bread'
union select r.RecipeId, 2, 'Combine all ingredients in bowl' from Recipe r where r.RecipeName = 'Cheese Bread'
union select r.RecipeId, 3, 'fill slits with cheese mixture' from Recipe r where r.RecipeName = 'Cheese Bread'
union select r.RecipeId, 4, 'wrap bread into a foil and bake for 30 minutes' from Recipe r where r.RecipeName = 'Cheese Bread'
union select r.RecipeId, 1, 'Cream butter with sugars' from Recipe r where r.RecipeName = 'Butter Muffins'
union select r.RecipeId, 2, 'Add eggs and mix well' from Recipe r where r.RecipeName = 'Butter Muffins'
union select r.RecipeId, 3, 'Slowly add rest of ingredients and mix well' from Recipe r where r.RecipeName = 'Butter Muffins'
union select r.RecipeId, 4, 'fill muffin pans 3/4 full and bake for 30 minutes' from Recipe r where r.RecipeName = 'Butter Muffins'
union select r.RecipeId, 1, 'Add the breadcrumbs, garlic, parsley, Italian seasoning, and ¾ cup cheese to a medium bowl. Season with salt and pepper, then mix together.' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 2, 'In another medium bowl, whisk together eggs with ½ cup cheese, a pinch of salt and pepper and 1 tablespoon water until combined.' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 3, 'Pour the flour into another bowl or plate, season with salt and pepper and mix to combine.' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 4, 'Take one piece of chicken and place it on a cutting board. Cover with plastic wrap over top, then use a meat mallet to pound it out to be about ½ inch thick. Repeat with the remaining chicken.' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 5, 'Season each piece of chicken on both sides with salt and pepper.' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 6, 'Take a piece of chicken and dip it into the flour to coat on all sides, then tap off the excess' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 7, 'Next, dip it in the egg mixture and let the excess drip off.' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 8, 'Transfer the chicken into the breadcrumbs. Be sure to press it down and move it around so that it''s fully coated. Place the chicken on a plate, and repeat with the remaining pieces.' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 9, 'Heat a generous amount of olive oil in a large saute pan over medium-high heat. Place 1-3 chicken breasts in at a time, depending on how many your pan can hold. Don''t overcrowd the pan.' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 10, 'Cook until golden brown on each side, then remove to a rack or paper towels to drain.' from Recipe r where r.RecipeName = 'Breaded Chicken'
union select r.RecipeId, 1, 'Mince garlic cloves. Thinly slice scallions, keeping the white parts separate from the light and dark green parts' from Recipe r where r.RecipeName = 'Fried Rice'
union select r.RecipeId, 2, 'Heat 2 tbsp of the vegetable oil in a large wok or nonstick frying pan over medium-high heat. Add the garlic, scallion whites, and frozen peas and carrots' from Recipe r where r.RecipeName = 'Fried Rice'
union select r.RecipeId, 3, 'Stir-fry until the carrots and peas are thawed, about 2 minutes' from Recipe r where r.RecipeName = 'Fried Rice'
union select r.RecipeId, 4, 'Add 4 cups cold cooked rice, breaking up any clumps of rice as you add it in. Toss to combine with the peas and carrots. Add soy sauce, salt, and ground white pepper. Stir to combine' from Recipe r where r.RecipeName = 'Fried Rice'
union select r.RecipeId, 5, 'Push the fried rice to one side of the pan. Add the remaining 1 tsp vegetable oil to the now-empty side of the pan, then crack 2 large eggs into the oil. Scramble into fluffy curds until almost set' from Recipe r where r.RecipeName = 'Fried Rice'
union select r.RecipeId, 6, 'Turn off the heat and stir the eggs into the fried rice, breaking up any large pieces of egg. Drizzle with 3/4 tsp toasted sesame oil and toss to combine' from Recipe r where r.RecipeName = 'Fried Rice'
union select r.RecipeId, 7, 'Taste and season with more salt and pepper as needed. Garnish with the reserved scallion greens' from Recipe r where r.RecipeName = 'Fried Rice'
union select r.RecipeId, 1, 'Dissolve cornstarch in 1 1/2 tbsp of water to create a slurry' from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'
union select r.RecipeId, 2, 'Place all of the ingredients, except for the cornstarch slurry, in a small saucepan and bring to a boil' from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'
union select r.RecipeId, 3, 'Stir in the cornstarch slurry and simmer for another minute until thickened, stirring constantly' from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'
union select r.RecipeId, 1, 'Bring a large pot of salted water to a boil. Prepare the pasta according to the package directions' from Recipe r where r.RecipeName = 'Pasta Salad'
union select r.RecipeId, 2, 'In a small bowl, whisk together the olive oil, lemon juice, mustard, garlic, italian seasoning, red pepper flakes, and salt' from Recipe r where r.RecipeName = 'Pasta Salad'
union select r.RecipeId, 3, 'Drain the pasta, toss it with a little olive oil (so that it doesn''t stick together) and let it cool to room temp' from Recipe r where r.RecipeName = 'Pasta Salad'
union select r.RecipeId, 4, 'Transfer to a large bowl with the tomatoes, cucumbers, feta cheese, basil, parsley, and mint' from Recipe r where r.RecipeName = 'Pasta Salad'
union select r.RecipeId, 5, 'Pour the dressing and toss to coat. Season to taste with more lemon, salt, pepper, and/or a drizzle of olive oil, if desired, and serve' from Recipe r where r.RecipeName = 'Pasta Salad'
union select r.RecipeId, 1, 'Pour the Jack Daniels over the ice in a tall glass' from Recipe r where r.RecipeName = 'Jack and Coke'
union select r.RecipeId, 2, 'Add CocaCola and stir for 15 seconds' from Recipe r where r.RecipeName = 'Jack and Coke'
union select r.RecipeId, 3, 'Garnish with mint leaves if desired and serve right away' from Recipe r where r.RecipeName = 'Jack and Coke'


insert Meal(UserId, MealName, MealStatus, CreateDate)
select u.UserId, 'Breakfast Bash', 1, '4/17/2017' from Users u where u.UserName = 'dboan'
union select u.UserId, 'Summer Lunch', 1, '4/17/2017' from Users u where u.UserName = 'ccook'
union select u.UserId, 'Date Night Special', 1, '4/17/2017' from Users u where u.UserName = 'ccook'
union select u.UserId, 'Sunday Snack', 1, '4/17/2017' from Users u where u.UserName = 'dboan'


insert Course(CourseType, CourseSequence)
select 'Appetizer', 1
union select 'Main', 2
union select 'Dessert', 3


insert MealCourse(MealId, CourseId)
select (select m.MealId from Meal m where m.MealName = 'Breakfast Bash'), c.CourseId from Course c where c.CourseType = 'Appetizer'
union select (select m.MealId from Meal m where m.MealName = 'Breakfast Bash'), c.CourseId from Course c where c.CourseType = 'Main'
union select (select m.MealId from Meal m where m.MealName = 'Summer Lunch'), c.CourseId from Course c where c.CourseType = 'Main'
union select (select m.MealId from Meal m where m.MealName = 'Date Night Special'), c.CourseId from Course c where c.CourseType = 'Appetizer'
union select (select m.MealId from Meal m where m.MealName = 'Date Night Special'), c.CourseId from Course c where c.CourseType = 'Main'
union select (select m.MealId from Meal m where m.MealName = 'Date Night Special'), c.CourseId from Course c where c.CourseType = 'Dessert'
union select (select m.MealId from Meal m where m.MealName = 'Sunday Snack'), c.CourseId from Course c where c.CourseType = 'Main'


;
with x as(
select MealCourseId, c.CourseId, CourseType, MealName
from MealCourse mc
join Meal m
on mc.MealId = m.MealId
join Course c
on mc.CourseId = c.CourseId
)
insert MealCourseRecipe(MealCourseId, RecipeId, DishType)
select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
    0 from x where x.MealName = 'Breakfast Bash' and x.CourseType = 'Appetizer'
union select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 
    1 from x where x.MealName = 'Breakfast Bash' and x.CourseType = 'Main'
union select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 
    0 from x where x.MealName = 'Breakfast Bash' and x.CourseType = 'Main'
union select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'), 
    1 from x where x.MealName = 'Summer Lunch' and x.CourseType = 'Main'
union select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 
    0 from x where x.MealName = 'Date Night Special' and x.CourseType = 'Appetizer'
union select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'), 
    1 from x where x.MealName = 'Date Night Special' and x.CourseType = 'Main'
union select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'), 
    0 from x where x.MealName = 'Date Night Special' and x.CourseType = 'Main'
union select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'), 
    0 from x where x.MealName = 'Date Night Special' and x.CourseType = 'Main'
union select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 
    0 from x where x.MealName = 'Date Night Special' and x.CourseType = 'Dessert'
union select x.MealCourseId , (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 
    1 from x where x.MealName = 'Sunday Snack' and x.CourseType = 'Main'


insert Cookbook(UserId, BookName, Price, Active, CreateDate)
select u.UserId, 'Treats for Two', 30, 1, '5/1/2020' from Users u where u.UserName = 'ibaker'
union select u.UserId, 'Mixing Your Own', 25, 0, '3/1/2020' from Users u where u.UserName = 'ibaker'
union select u.UserId, 'Gourmet Cooking', 40, 1, '7/31/2023' from Users u where u.UserName = 'ibaker'
union select u.UserId, 'The Ultimate Book of Sauce', 30, 1, '4/22/2023' from Users u where u.UserName = 'ibaker'


insert RecipeCookBook(CookBookID, RecipeId, SequenceNum)
select (select c.CookbookId from Cookbook c where c.BookName = 'Treats for Two'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 1
union select (select c.CookbookId from Cookbook c where c.BookName = 'Treats for Two'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 2
union select (select c.CookbookId from Cookbook c where c.BookName = 'Treats for Two'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 3
union select (select c.CookbookId from Cookbook c where c.BookName = 'Treats for Two'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 4
union select (select c.CookbookId from Cookbook c where c.BookName = 'Mixing Your Own'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Jack and Coke'), 1
union select (select c.CookbookId from Cookbook c where c.BookName = 'Gourmet Cooking'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Breaded Chicken'), 1
union select (select c.CookbookId from Cookbook c where c.BookName = 'Gourmet Cooking'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice'), 2
union select (select c.CookbookId from Cookbook c where c.BookName = 'Gourmet Cooking'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Pasta Salad'), 3
union select (select c.CookbookId from Cookbook c where c.BookName = 'The Ultimate Book of Sauce'), 
    (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet and Sour Sauce'), 1

