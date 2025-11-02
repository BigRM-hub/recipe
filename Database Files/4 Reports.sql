use HeartyHearthDB
go
/*
Our website development is underway! 
Below is the layout of the pages on our website, please provide the SQL to produce the necessary result sets.

Note: 
a) When the word 'specific' is used, pick one record (of the appropriate type, recipe, meal, etc.) for the query. 
    The way the website works is that a list of items are displayed and then the user picks one and navigates to the "details" page.
b) Whenever you have a record for a specific item include the name of the picture for that item. That is because the website will always show a picture of the item.
*/

/*
Home Page
    One result set with the number of recipes, meals, and cookbooks. Each row should have a column with the item name (Ex: Recipes) and a column with the count.
*/

select 'Recipes' as ItemName, count(r.RecipeId) as Count from Recipe r
union select 'Meals', count(m.MealId) from Meal m
union select 'CookBooks', count(c.CookBookId) from Cookbook c

/*
Recipe list page:
    List of all Recipes that are either published or archived, published recipes should appear at the top. Archived recipes should appear gray on the website.
	In order for the recipe name to be gray on the website, surround the archived recipe names with: <span style="color:gray">recipe name</span>
    In the resultset show the Recipe with its status, dates it was published and archived in mm/dd/yyyy format (blank if not archived), user, number of calories and number of ingredients.
    Tip: You'll need to use the convert function for the dates
*/

select
    case r.RecipeStatus when  'Archive' then concat('<span style="color:gray">', r.RecipeName, '</span>')
    else r.RecipeName end as RecipeName,
    --r.RecipeName,
    r.RecipeStatus, isnull(convert(varchar,r.DatePublished, 101), '') as DatePublished, 
    isnull(convert(varchar, r.DateArchived, 101), '') as DateArchived, u.UserName, r.Calories, r.Picture, count(ri.IngredientId) as NumIngredients
from Recipe r
join RecipeIngredient ri
on r.RecipeId = ri.RecipeId
join Users u
on r.UserId = u.UserId
where r.RecipeStatus in ('Published', 'Archive')
group by r.RecipeName, r.RecipeStatus, DatePublished, DateArchived, u.UserName, r.Calories, r.Picture
order by r.RecipeStatus desc

/*
Recipe details page:
    Show for a specific recipe (three result sets):
        a) Recipe header: recipe name, number of calories, number of ingredients and number of steps.
        b) List of ingredients: show the measurement quantity, measurement type and ingredient in one column, sorted by sequence. Ex. 1 Teaspoon Salt  
        c) List of prep steps sorted by sequence.
*/

select r.RecipeName, r.Calories, count(distinct ri.IngredientId) as NumIngredients, count(distinct rs.RecipeStepId) as NumSteps, r.Picture
from Recipe r
join RecipeIngredient ri
on r.RecipeId = ri.RecipeId
join RecipeStep rs
on r.RecipeId = rs.RecipeId
where r.RecipeName = 'Sweet and Sour Sauce'
group by r.RecipeName, r.Calories, r.Picture

select concat(ri.Ammount, ' ', m.UOM, ' ', i.Ingredient) as IngredientList, i.Picture
from RecipeIngredient ri
join Recipe r
on ri.RecipeId = r.RecipeId
join Ingredient i
on ri.IngredientId = i.IngredientId
join Measurement m
on ri.MeasurementId = m.MeasurementId
where r.RecipeName = 'Sweet and Sour Sauce'
order by ri.IngredientSequence

select rs.StepSequence, rs.Instructions
from RecipeStep rs
join Recipe r
on rs.RecipeId = r.RecipeId
where r.RecipeName = 'Sweet and Sour Sauce'
order by rs.StepSequence

/*
Meal list page:
    For all active meals, show the meal name, user that created the meal, number of calories for the meal, number of courses, and number of recipes per each meal, sorted by name of meal
*/

select m.MealName, u.UserName, sum(r.Calories) as TotalCalories, count(distinct mc.CourseId) as NumCourses, count(r.RecipeId) as NumRecipes, m.Picture
from Meal m
join Users u
on m.UserId = u.UserId
join MealCourse mc
on m.MealId = mc.MealId
join MealCourseRecipe mcr
on mc.MealCourseId = mcr.MealCourseId
join Recipe r
on mcr.RecipeId = r.RecipeId
where m.MealStatus = 1
group by m.MealName, u.UserName, m.Picture
order by m.MealName

/*
Meal details page:
    Show for a specific meal:
        a) Meal header: meal name, user, date created.
        b) List of all recipes: Result set should have one column, including the course type, whether the dish is serverd as main/side (if it's the main course), and recipe name. 
			Format for main course: CourseType: Main/Side dish - Recipe Name. 
            Format for non-main course: CourseType: Recipe Name
            Main dishes of the main course should be bold, using the bold tags as shown below
                ex: 
                    Appetizer: Mixed Greens
                    <b>Main: Main dish - Onion Pastrami Chicken</b>
					Main: Side dish - Roasted cucumbers with mustard
*/

select m.MealName, u.UserName, m.CreateDate, m.Picture
from Meal m
join Users u
on m.UserId = u.UserId
where m.MealName = 'Breakfast Bash'

select
    case
        when c.CourseType = 'Main' then 
           case when mcr.DishType = 1 then concat('<b>', c.CourseType, ': Main dish - ', r.RecipeName, '</b>') 
            else concat(c.CourseType, ': Side dish - ', r.RecipeName) 
            end 
    else concat(c.CourseType, ': ', r.RecipeName)
    end as Recipes, r.Picture
--concat(c.CourseType, ': ', mcr.DishType, ' Dish - ', r.RecipeName)
from Meal m
join MealCourse mc
on m.MealId = mc.MealId
join MealCourseRecipe mcr
on mc.MealCourseId = mcr.MealCourseId
join Recipe r
on mcr.RecipeId = r.RecipeId
join Course c
on mc.CourseId = c.CourseId
where m.MealName = 'Breakfast Bash'

/*
Cookbook list page:
    Show all active cookbooks with author and number of recipes per book. Sorted by book name.
*/

select c.BookName, concat(u.FirstName, ' ', u.LastName) as Author, count(rc.RecipeId) as NumRecipes, c.Picture
from Cookbook c
join RecipeCookBook rc
on c.CookBookId = rc.CookBookId
join Users u
on c.UserId = u.UserId
where c.Active = 1
group by c.BookName, u.FirstName, u.LastName, c.Picture

/*
Cookbook details page:
    Show for specific cookbook:
    a) Cookbook header: cookbook name, user, date created, price, number of recipes.
    b) List of all recipes in the correct order. Include recipe name, cuisine and number of ingredients and steps.  
        Note: User will click on recipe to see all ingredients and steps.
*/

select c.BookName, u.UserName, c.CreateDate, c.Price, count(rc.RecipeId) as NumRecipes, c.Picture
from Cookbook c
join RecipeCookBook rc
on c.CookBookId = rc.CookBookId
join Users u
on c.UserId = u.UserId
where c.Active = 1
and c.BookName = 'Gourmet Cooking'
group by c.BookName, u.UserName, c.CreateDate, c.Price, c.Picture

select rc.SequenceNum, r.RecipeName, cu.Cuisine, count(distinct ri.IngredientId) as NumIngredients, max(rs.StepSequence) as NumSteps, r.Picture
from Cookbook co
join RecipeCookBook rc
on co.CookBookId = rc.CookBookId
join Recipe r
on rc.RecipeId = r.RecipeId
join Cuisine cu
on r.CuisineId = cu.CuisineId
join RecipeIngredient ri
on r.RecipeId = ri.RecipeId
join RecipeStep rs
on r.RecipeId = rs.RecipeId
where co.BookName = 'Gourmet Cooking'
group by rc.SequenceNum, r.RecipeName, cu.Cuisine, r.Picture
order by rc.SequenceNum

/*
April Fools Page:
    On April 1st we have a page with a joke cookbook. For that page provide the following.
    a) A list of all the recipes that are in all cookbooks. The recipe name should be the reverse of the real name with the first letter capitalized and all others lower case.
        There are matching pictures for those names, include the reversed picture names so that we can show the joke pictures.
        Note: ".jpg" file extension must be at the end of the reversed picture name EX: Recipe_Seikooc_pihc_etalocohc.jpg
    b) When the user clicks on any recipe they should see a spoof steps lists showing the step instructions for the LAST step of EACH recipe in the system. No sequence required.
        Hint: Use CTE
*/

select concat(upper(substring(reverse(lower(r.RecipeName)), 1, 1)), substring(reverse(lower(r.RecipeName)), 2, 30)) as RecipeName,
    concat('Recipe_', replace(concat(upper(substring(reverse(lower(r.RecipeName)), 1, 1)), substring(reverse(lower(r.RecipeName)), 2, 30)), ' ', '_'), '.jpg') as Picture
from RecipeCookBook rc
join Recipe r
on rc.RecipeId = r.RecipeId

;
with x as(
select rs.RecipeId, max(rs.StepSequence) as LastStep
from RecipeStep rs
group by rs.RecipeId
)
select rs.Instructions
from x
join RecipeStep rs
on x.LastStep = rs.StepSequence
and x.RecipeId = rs.RecipeId

/*
For site administration page:
5 seperate reports
    a) List of how many recipes each user created per status. Show 0 if user has no recipes at all.
    b) List of how many recipes each user created and average amount of days that it took for the user's recipes to be published.
    c) For each user, show three columns: Total number of meals, Total Active meals, Total Inactive meals. Show 0 if none
        Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
    d) For each user, show three columns: Total number of cookbooks, Total Active cookbooks, Total Inactive cookbooks. Show 0 if none
        Hint: For active/inactive columns, use SUM function with CASE to only include in sum if active/inactive 
    e) List of archived recipes that were never published, and how long it took for them to be archived.
*/

--a)
select u.FirstName, u.LastName, isnull(r.RecipeStatus, ''), count(r.RecipeId) as NumRecipes
from Users u
left join Recipe r
on r.UserId = u.UserId
group by u.FirstName, u.LastName, r.RecipeStatus

--b)
select u.FirstName, u.LastName, 
    count(r.RecipeId) as NumRecipes, 
    avg(datediff(day, r.DateDrafted, r.DatePublished)) as AvgDays
from Users u
join Recipe r
on r.UserId = u.UserId
where r.RecipeStatus = 'Published'
group by u.FirstName, u.LastName

--c)
/*
This code ran before but doesn't anymore.
;
with x as(
select u.UserName, sum(count(m.MealId)) as Total,
case m.MealStatus when 1 then count(m.MealId) else 0 end as Active,
case m.MealStatus when 0 then count(m.MealId) else 0 end as Inactive
from Users u
left join Meal m
on u.UserId = m.UserId
group by u.UserName, m.MealStatus
)
select x.UserName, sum(x.Total) as TotalMeals, sum(x.Active) as TotalActiveMeals, sum(x.Inactive) as TotalInactiveMeals
from x
group by x.UserName
*/

select u.UserName, count(m.MealId) as TotalMeals,
    case m.MealStatus when 1 then count(m.MealId) else 0 end as TotalActiveMeals,
    case m.MealStatus when 0 then count(m.MealId) else 0 end as TotalInactiveMeals
from Users u
left join meal m
on u.UserId = m.UserId
group by u.UserName, m.MealStatus

--d)
;
with x as(
select u.UserName, count(c.CookBookId) as Total,
case c.Active when 1 then count(c.CookBookId) else 0 end as Active,
case c.Active when 0 then count(c.CookBookId) else 0 end as Inactive
from Users u
left join Cookbook c
on u.UserId = c.UserId
group by u.UserName, c.Active
)
select x.UserName, sum(x.Total) as TotalCookbooks, sum(x.Active) as TotalActiveCookbooks, sum(x.Inactive) as TotalInactiveCookbooks
from x
group by x.UserName

--e)
select r.RecipeName, datediff(day, r.DateDrafted, r.DateArchived) as DaysTillArchived
from Recipe r
where r.DatePublished is null
and r.DateArchived is not null
group by r.RecipeName, r.DateDrafted, r.DateArchived

/*
For user dashboard page:
    a) For a specific user, show one result set with the number of recipes, meals, and cookbooks. Each row should have a column with the item name (Ex: Recipes) and a column with the count.
        Tip: If you would like, you can use a CTE to get the User Id once instead of in each union select
    b) List of the user's recipes, display the status and the number of hours between the status it's in and the one before that. Omit recipes in drafted status.
*/

;
with x as(
select *
from Users u
)
select x.UserName, 'Recipes' as ItemName, count(distinct r.RecipeId) as Count
    from x
    left join Recipe r
    on x.UserId = r.UserId
    where x.UserName = 'dboan'
    group by x.UserName
union select x.UserName, 'Meals', count(distinct m.MealId)
    from x
    left join Meal m
    on x.UserId = m.UserId
    where x.UserName = 'dboan'
    group by x.UserName
union select x.UserName, 'Cookbooks', count(distinct c.CookBookId)
    from x
    left join Cookbook c
    on x.UserId = c.UserId
    where x.UserName = 'dboan'
    group by x.UserName

select r.RecipeName, r.RecipeStatus,
    case when r.DateArchived is null then datediff(hour, r.DateDrafted, r.DatePublished)
    else datediff(hour, isnull(r.DatePublished, r.DateDrafted) , r.DateArchived) end as HoursInStatus
--    isnull(datediff(hour, r.DateDrafted, r.DateArchived), 
--            datediff(hour, r.DateDrafted, r.DatePublished)) as HoursInStatus
from Recipe r
join Users u
on r.UserId = u.UserId
where u.UserName = 'dboan'
and r.RecipeStatus <> 'Draft'

/*
    OPTIONAL CHALLENGE QUESTION
    c) Show a list of cuisines and the count of recipes the user has per cuisine, 0 if none
        Hint: Start by writing a CTE to give you cuisines for which the user does have recipes. 
*/

;
with x as(
select u.UserName,c.CuisineId, c.Cuisine, r.RecipeId
from Recipe r
join Cuisine c
on r.CuisineId = c.CuisineId
join Users u
on r.UserId = u.UserId
where u.UserName = 'dboan'
)
select c.Cuisine, count(x.RecipeId) as NumRecipes
from Cuisine c
left join x
on c.CuisineId = x.CuisineId
group by c.Cuisine
