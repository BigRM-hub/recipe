
use HeartyHearthDB
go
drop table if exists RecipeCookBook
go
drop table if exists CookBook
go
drop table if exists MealCourseRecipe
go
drop table if exists MealCourse
go
drop table if exists Course
go
drop table if exists Meal
go
drop table if exists RecipeStep
go
drop table if exists RecipeIngredient
go
drop table if exists Measurement
go
drop table if exists Ingredient
go
drop table if exists Recipe
go
drop table if exists Users
go
drop table if exists Cuisine
go

create table dbo.Cuisine(
    CuisineId int not null identity primary key,
    Cuisine varchar(30) not null
        constraint c_Cuisine_Cuisine_not_blank check(Cuisine <> '')
        constraint u_Cuisine_Cuisine unique
)


create table dbo.Users(
    UserId int not null identity primary key,
    FirstName varchar(25) not null constraint c_Users_FirstName_not_blank check(FirstName <> ''),
    LastName varchar(30) not null constraint c_Users_LastName_not_blank check(LastName <> ''),
    UserName varchar(35) not null unique constraint c_Users_UserName_not_blank check(UserName <> '')
)

create table dbo.Recipe(
    RecipeId int not null identity primary key,
    UserId int not null foreign key references Users(UserId),
    CuisineId int not null foreign key references Cuisine(CuisineId),
    RecipeName varchar(30) not null
        constraint c_Recipe_RecipeName_not_blank check(REcipeName <> '') 
        constraint u_Recipe_RecipeName unique,
    Calories int not null constraint c_Recipe_Calories_greater_than_0 check(Calories > 0),
    DateDrafted datetime not null default getdate()
        constraint c_Recipe_DateDrafted_before_today_and_after_Jan_1_2015 check(DateDrafted between '1-1-2015' and getdate()),
    DatePublished datetime null
        constraint c_Recipe_DatePublished_before_today_and_after_Jan_1_2015 check(DatePublished between '1-1-2015' and getdate()),
    DateArchived datetime null
        constraint c_Recipe_DateArchived_before_today_and_after_Jan_1_2015 check(DateArchived between '1-1-2015' and getdate()),
    RecipeStatus as case
        when DatePublished is null and DateArchived is null then 'Draft'
        when DateArchived is not null then 'Archive'
        else 'Published'
        end,
    Picture as concat('Recipe_', replace(RecipeName, ' ', '_'), '.jpg') persisted,
    --(OfficialFormat: Type(Ingredient, Recipe, etc.)_Name(Egg, Pizza, etc.).jpg -needs an underscore between every word)
    constraint c_Recipe_DateDrafted_less_than_or_equal_to_DatePublisned check(DateDrafted <= DatePublished),
    constraint c_Recipe_DatePublished_less_than_or_equal_to_DateArchived check(DatePublished <= DateArchived),
    constraint c_Recipe_DateDrafted_less_than_or_equal_to_DateArchived check(DateDrafted <= DateArchived)
)


create table dbo.Ingredient(
    IngredientId int not null identity primary key,
    Ingredient varchar(30) not null
        constraint c_Ingredient_Ingredient_not_blank check(Ingredient <> '')
        constraint u_Ingredient_Ingredient unique,
    Picture as concat('Ingredient_', replace(Ingredient, ' ', '_'), '.jpg') persisted
)


create table dbo.Measurement(
    MeasurementId int not null identity primary key,
    UOM varchar(15) not null constraint c_Measurement_UOM_not_blank check(UOM <> '')
)


create table dbo.RecipeIngredient(
    RecipeIngredientId int not null identity primary key,
    RecipeId int not null foreign key references Recipe(RecipeId),
    IngredientId int not null foreign key references Ingredient(IngredientId),
    MeasurementId int  null foreign key references Measurement(MeasurementID),
    Ammount decimal(4,2) not null constraint c_RecipeIngredient_Ammount_greater_than_0 check(Ammount > 0),
    --RecipeSequence int not null constraint c_RecipeSequence_greater_than_0 check(RecipeSequence > 0), --Possibly need to add for reports?
    IngredientSequence int not null constraint c_RecipeIngredient_IngredientSequence_greater_than_0 check(IngredientSequence > 0),
    constraint u_RecipeIngredient_Recipe_and_Ingredient unique(RecipeId, IngredientId)
)


create table dbo.RecipeStep(
    RecipeStepId int not null identity primary key,
    RecipeId int not null foreign key references Recipe(RecipeId),
    StepSequence int not null constraint c_RecipeStep_StepSequence_greater_than_0 check(StepSequence > 0),
    Instructions varchar(200) not null constraint c_RecipeStep_Instructions_not_blank check(Instructions <> ''),
    constraint u_RecipeStep_Recipe_and_StepSequence unique(RecipeId, StepSequence)
)


create table dbo.Meal(
    MealId int not null identity primary key,
    UserId int not null foreign key references Users(UserId),
    MealName varchar(30) not null 
        constraint c_Meal_MealName_not_blank check(MealName <> '')
        constraint u_Meal_MealName unique,
    MealStatus bit not null, --active or no w 1 being active and 0 being not
    --MealStatusText as case MealStatus
    --    when 1 then 'Active'
    --    else 'Archive' end,
    CreateDate datetime not null constraint c_Meal_CreateDate_between_Jan_1_2015_and_today check(CreateDate between '1-1-2015' and getdate()),
    Picture as concat('Meal_', replace(MealName, ' ', '_'),'.jpg') persisted
)


create table dbo.Course(
    CourseId int not null identity primary key,
    CourseType varchar(25) not null --appetizer, main, dessert, etc.
        constraint c_Course_CourseType_not_blank check(CourseType <> '')
        constraint u_Course_CourseType unique, 
    CourseSequence int not null --Order the course comes in a meal
        constraint c_Course_CourseSequence_greater_than_0 check(CourseSequence > 0)
        constraint u_Course_CourseSequence unique
)


create table dbo.MealCourse(
    MealCourseId int not null identity primary key,
    MealId int not null foreign key references Meal(MealId),
    CourseId int not null foreign key references Course(CourseId), 
    constraint u_MealCourse_Meal_and_Course unique(MealID, CourseId)
)


create table dbo.MealCourseRecipe(
    MealCourseRecipeId int not null identity primary key,
    MealCourseId int not null foreign key references MealCourse(MealCourseId), --instead of referencing course so it is linked to meal and course
    RecipeId int not null foreign key references Recipe(RecipeId),
    DishType bit not null default 0, -- 1 is main and 0 is side
    --DishType as case
    --    when DishTypeCode = 1 then 'Main'
    --    else 'Side' end persisted,
    constraint u_MealCourseRecipe_MealCourse_and_Recipe unique(MealCourseId, RecipeId)
)


create table dbo.Cookbook(
    CookBookId int not null identity primary key,
    UserId int not null foreign key references Users(UserId),
    BookName varchar(30) not null
        constraint c_Cookbook_BookName_not_blank check(BookName <> '')
        constraint u_Cookbook_BookName unique,
    Price decimal(5,2) not null constraint c_Cookbook_Price_greater_than_0 check(Price > 0),
    Active bit not null, -- 1 is active 0 is Archive
    CreateDate datetime not null default getdate()
        constraint c_CreateDate_between_Jan_1_2015_and_today check(CreateDate between '1/1/2015' and getdate()), --between the creation of the website and the current date
    Picture as concat('Cookbook', '_', replace(BookName, ' ', '_'),'.jpg') persisted
)


create table dbo.RecipeCookBook(
    RecipeCookBookId int not null identity primary key,
    CookBookId int not null foreign key references CookBook(CookBookId),
    RecipeId int not null foreign key references Recipe(RecipeId),
    SequenceNum int not null constraint c_SequenceNum_greater_than_0 check(SequenceNum > 0),
    constraint u_RecipeCookbook_Recipe_SequenceNum_and_CookBook unique(RecipeId, SequenceNum, CookbookId),
)

