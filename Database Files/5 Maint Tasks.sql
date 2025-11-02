use HeartyHearthDB
go
--Note: some of these scripts are needed for specific items, when the instructions say "specific" pick one item in your data and specify it in the where clause using a unique value that identifies it, do not use the primary key.

--1) Sometimes when a staff member is fired. We need to eradicate everything from that user in our system. Write the SQL to delete a specific user and all the user's related records.

delete mcr
--select *
from Meal m
join Users u
on m.UserId = u.UserId
join MealCourse mc
on mc.MealId = m.MealId
join MealCourseRecipe mcr
on mcr.MealCourseId = mc.MealCourseId
where u.UserName = 'ccook'

delete mc
--select *
from Meal m
join Users u
on m.UserId = u.UserId
join MealCourse mc
on mc.MealId = m.MealId
where u.UserName = 'ccook'

delete m
--select *
from Meal m
join Users u
on m.UserId = u.UserId
where u.UserName = 'ccook'

delete rc
--select *
from RecipeCookBook rc
join Recipe r
on rc.RecipeId = r.RecipeId
join Users u
on r.UserId = u.UserId
where u.UserName = 'ccook'

delete c
--select *
from Cookbook c
join Users u
on c.UserId = u.UserId
where u.UserName = 'ccook'

delete ri
--select *
from Recipe r
join Users u
on r.UserId = u.UserId
join RecipeIngredient ri
on r.RecipeId = ri.RecipeId
where u.UserName = 'ccook'

delete rs
--select *
from Recipe r
join Users u
on r.UserId = u.UserId
join RecipeStep rs
on r.RecipeId = rs.RecipeId
where u.UserName = 'ccook'

delete r
--select *
from Recipe r
join Users u
on r.UserId = u.UserId
where u.UserName = 'ccook'

delete u
--select *
from Users u
where u.UserName = 'ccook'

--2) Sometimes we want to clone a recipe as a starting point and then edit it. For example we have a complex recipe (steps and ingredients) and want to make a modified version. Write the SQL that clones a specific recipe, add " - clone" to its name.

insert Recipe(UserId, CuisineId, RecipeName, Calories)
select r.UserId, r.CuisineId, concat(r.RecipeName, ' - clone'), r.Calories
from Recipe r
where r.RecipeName = 'Fried Rice'

insert RecipeIngredient(RecipeId, IngredientId, MeasurementId, Ammount)
select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice - clone'),
    ri.IngredientId, ri.MeasurementId, ri.Ammount
from RecipeIngredient ri
join Recipe r
on ri.RecipeId = r.RecipeId
where r.RecipeName = 'Fried Rice'

insert RecipeStep(RecipeId, StepSequence, Instructions)
select (select r.RecipeId from Recipe r where r.RecipeName = 'Fried Rice - clone'),
    rs.StepSequence, rs.Instructions    
from RecipeStep rs
join Recipe r
on rs.RecipeId = r.RecipeId
where r.RecipeName = 'Fried Rice'

/*
3) We offer users an option to auto-create a recipe book containing all of their recipes. 
Write a SQL script that creates the book for a specific user and fills it with their recipes.
The name of the book should be Recipes by Firstname Lastname. 
The price should be the number of recipes multiplied by $1.33
Sequence the book by recipe name.

Tip: To get a unique sequential number for each row in the result set use the ROW_NUMBER() function. See Microsoft Docs.
	 The following can be a column in your select statement: Sequence = ROW_NUMBER() over (order by colum name) , replace column name with the name of the column that the row number should be sorted
*/

insert Cookbook(UserId, BookName, Price, Active)
select u.UserId, concat('Recipes by ', u.FirstName, ' ', u.LastName), count(r.RecipeId) * 1.33, 1
from Recipe r
join Users u
on r.UserId = u.UserId
where u.UserName = 'ccook'
group by u.UserId, u.FirstName, u.LastName

insert RecipeCookBook(CookBookId, RecipeId, SequenceNum)
select (select c.CookBookId from Cookbook c where c.BookName = 'Recipes by Chef Cook'), 
    r.RecipeId, row_number() over (order by r.RecipeName)
from Recipe r
join Users u
on r.UserId = u.UserId
where u.UserName = 'ccook'

/*
4) Sometimes the calorie count of of an ingredient changes and we need to change the calorie total for all recipes that use that ingredient.
Our staff nutritionist will specify the amount to change per measurement type, and of course multiply the amount by the quantity of the ingredient.
For example, the calorie count for butter went down by 2 per ounce, and 10 per stick of butter. 
Write an update statement that changes the number of calories of a recipe for a specific ingredient. 
The statement should include at least two measurement types, like the example above. 
*/

update r
set r.Calories = r.Calories - (ri.Ammount * case m.UOM when 'Stick' then 10 when 'Oz' then 2 end)
--select r.RecipeName, i.Ingredient, ri.Ammount, m.UOM, r.Calories,
--r.Calories - (ri.Ammount * case m.UOM when 'Stick' then 10 when 'Oz' then 2 end) as NewCalories
from RecipeIngredient ri
join Ingredient i
on ri.IngredientId = i.IngredientId
join Measurement m
on ri.MeasurementId = m.MeasurementId
join Recipe r
on ri.RecipeId = r.RecipeId
where i.Ingredient = 'Butter'

/*
5) We need to send out alerts to users that have recipes sitting in draft longer the average amount of time that recipes have taken to be published.
Produce a result set that has 4 columns (Data values in brackets should be replaced with actual data)
	User First Name, 
	User Last Name, 
	email address (first initial + lastname@heartyhearth.com),
	Alert: 
		Your recipe [recipe name] is sitting in draft for [X] hours.
		That is [Z] hours more than the average [Y] hours all other recipes took to be published.
*/

;
with x as(
select avg( datediff(hour, r.DateDrafted, r.DatePublished) ) as AvgDraftHours
--select r.RecipeName, avg( datediff(hour, r.DateDrafted, r.DatePublished) ) as DraftHours
from Recipe r
where r.DatePublished is not null
--group by r.RecipeName--, r.DateDrafted, r.DatePublished
)
select --u.FirstName, u.LastName, x.AvgDraftHours, datediff(hour, r.DateDrafted, getdate()) as DraftHours,
u.FirstName, u.LastName, concat(lower(substring(u.FirstName, 1,1)), lower(u.LastName), '@heartyhearth.com') as EmailAddress,
    concat('Your recipe ', r.RecipeName, ' is sitting in draft for ', datediff(hour, r.DateDrafted, getdate()), ' hours.',
    'That is ', datediff(hour, r.DateDrafted, getdate()) - x.AvgDraftHours, ' hours more than the average ', x.AvgDraftHours, ' hours all other recipes took to be published.') as Alert
from Recipe r
join Users u
on r.UserId = u.UserId
cross join x
where r.DatePublished is null
and r.DateArchived is null
and datediff(hour, r.DateDrafted, getdate()) > x.AvgDraftHours

/*
6) We want to send out marketing emails for books. Produce a result set with one row and one column "Email Body" as specified below.
The email should have a unique guid link to follow, which should be shown in the format specified. 

Email Body:
Order cookbooks from HeartyHearth.com! We have [X] books for sale, average price is [Y]. You can order them all and receive a 25% discount, for a total of [Z].
Click <a href = "www.heartyhearth.com/order/[GUID]">here</a> to order.
*/

select
concat('Order cookbooks from HeartyHearth.com! We have ', count(c.CookBookId), ' books for sale, average price is $', cast(avg(c.Price) as decimal(5,2)),
 '. You can order them all and receive a 25% discount, for a total of $', cast(sum(c.Price) * .75 as decimal(5,2)),
 '. Click <a href = "www.heartyhearth.com/order/', newid(), '">here</a> to order.') as EmailBody
 from Cookbook c
where c.Active = 1
