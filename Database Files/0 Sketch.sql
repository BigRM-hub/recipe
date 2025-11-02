/*
HeartyHearthDB

Cusine
    CusineId int not null primary key
    Cusine varchar(30) not null not blank, unique


User
    UserId int not null primary key
    FirstName varchar(25) not null not blank
    LastName varchar(30) not null not blank
    UserName varchar(35) not null unique -concat(First letter of first name, last name)


Recipe
    RecipeId int not null primary key
    UserId int not null fk references User(UserId)
    CusineId int not null fk references Cusine(CusineId)
    RecipeName varchar(30) not null not blank unique
    Calories int not null greater than 0
--AS All dates must be before the current date and datedrafted must be after the creation of the website too (date that you make up)
    DateDrafted datetime not null default getdate() constraint between 1\1\2015 and getdate()
    DatePublished datetime null constraint between 1\1\2015 and getdate()
--AS In your case it won't it would have to be change manually in the dates and then the status column updates accordingly. In part 2 of the course this will be implemented.
    DateArchived datetime null constraint between 1\1\2015 and getdate()
    RecipeStatus as case
        when DatePublished is null and DateArchived is null then 'Draft'
        when DateArchived is not null then 'Archive'
        else 'Published'
        end
    Picture as concat('Recipe', '_', RecipeName,'.jpg') persisted
    --(OfficialFormat: Type(Ingredient, Recipe, etc.)_Name(Egg, Pizza, etc.).jpg -needs an underscore between every word)
    DateDrafted <= DatePublished constraint
    DatePublished <= DateArchived constraint


Ingredients
    IngredientId int not null primary key
    Ingredient varchar(30) not null not blank unique
    Picture int fk references Picture(PictureId)


Measurement
    MeasurementId
    UOM varchar(15) not null can be blank --for cases like 1 egg


RecipeIngredient
    RecipeIngredientId int not null primary key
    RecipeId int not null fk references Recipe(RecipeId)
    IngredientId int not null fk references Ingredient(IngredientId)
--AS Call this column MeasurementId
    MeasurementId int not null fk references Measurement(MeasurementID)
    Ammount int not null greater than 0
    unique recipe and ingredient


RecipeStep
    RecipeStepId int not null primary key
    RecipeId int not null fk references Recipe(RecipeId)
    StepSequence int not null greater than 0
    Instructions varchar(100) not null
    unique RecipeId and StepSequence

Meal
    MealId int not null primary key
    UserId int not null fk references User(UserId)
    MealName varchar(30) not null not blank unique
    MealStatus bit active or no w 1 being active and 0 being not
    CreateDate datetime not null constraint between 1\1\2015 and getdate()
    Picture as concat('Meal', '_', MealName,'.jpg') persisted


Course
    CourseId int not null primary key
    CourseType varchar(25) not null not blank unique --appetizer, main, dessert, etc. 
    CourseSequence int not null greater than 0 --Order the course comes in a meal


MealCourse
    MealCourseId int not null primary key
    MealId int not null fk references Meal(MealId)
    CourseId int not null fk references Course(CourseId)   
    unique mealID and courseID constraint


MealCourseRecipe
    MealCourseRecipeId int not null primary key
    MealCourseId int not null fk references MealCourse(MealCourseId) --instead of referencing course so it is linked to meal and course
    RecipeId int not null fk references Recipe(RecipeId)
    DishType bit not null default 0 -- 1 is main and 0 is side
    unique MealCourseId and RecipeId


Cookbook
    CookBookId int not null primary key
    UserId int not null fk references User(UserId)
    BookName varchar(25) not null not blank unique
    Price decimal(5,2) not null greater than 0
    Active bit not null -- 1 is active 0 is Archive
    CreateDate datetime not null --between the creation of the website and the current date
    Picture as concat('Cookbook', '_', BookName,'.jpg') persisted



RecipeCookBook
    RecipeCookBookId int not null primary key
    CookBookId int not null fk references CookBook(CookBookId)
    RecipeId int not null fk references Recipe(RecipeId)
    SequenceNum int not null greater than 0
    unique recipe and sequence number constraint
    unique recipe and CookBookID constraint


*/
