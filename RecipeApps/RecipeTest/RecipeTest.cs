using System.Data;


namespace RecipeTest
{
    public class RecipeTest
    {
        [SetUp]
        public void Setup()
        {
            DBManager.SetConnectionString("Server=tcp:dev-cpurm.database.windows.net,1433;Initial Catalog=HeartyHearthDB;Persist Security Info=False;User ID=dev_login;Password=Yuza591886;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
        }

        [Test]
        public void InsertNewRecipe()
        {
            DataTable dt = SQLUtility.GetDataTable("select * from recipe where recipeid = 0");
            DataRow r = dt.Rows.Add();
            Assume.That(dt.Rows.Count == 1);

            int userId = SQLUtility.GetFirstColumnFirstRowValue("select top 1 UserId from Users");
            Assume.That(userId > 0, "Can't run test. No users in db");

            int cuisineId = SQLUtility.GetFirstColumnFirstRowValue("select top 1 CuisineId from Cuisine");
            Assume.That(cuisineId > 0, "Can't run test. No cuisines in db");

            string recipename = "NewRecipe";

            r["UserId"] = userId;
            r["CuisineId"] = cuisineId;
            r["RecipeName"] = recipename;
            r["Calories"] = 100;
            r["DateDrafted"] = DateTime.Now;
            Recipe.Save(dt);

            int newid = SQLUtility.GetFirstColumnFirstRowValue("select * from recipe where recipename = '" + recipename + "'");
            Assert.IsTrue(newid > 0, "Recipe was not inserted");
            TestContext.WriteLine("Inserted recipe id = " + newid + " name = " + recipename);
        }

        [Test]
        public void ChangeExistingRecipeCalories()
        {
            int recipeID = GetExistingRecipeId();
            Assume.That(recipeID > 0, "No recipes in DB to test against");

            int calories = SQLUtility.GetFirstColumnFirstRowValue("select calories from recipe where recipeid = " + recipeID);
            TestContext.WriteLine("calories for recipeid " + recipeID + " is " + calories);

            int newCalories = calories + 1;
            TestContext.WriteLine("change calories to " + newCalories);

            DataTable dt = SQLUtility.GetDataTable("select * from recipe where recipeid = " + recipeID);
            dt.Rows[0]["Calories"] = newCalories;
            Recipe.Save(dt);

            int updated = SQLUtility.GetFirstColumnFirstRowValue("select calories from recipe where recipeid = " + recipeID);
            Assert.IsTrue(updated == newCalories, $"calories for recipe ({recipeID}) = {updated} expected {newCalories}");
            TestContext.WriteLine("Updated calories for recipe (" + recipeID + ") to " + updated);
        }

        [Test]
        public void DeleteRecipe()
        {
            DataTable dt = SQLUtility.GetDataTable(
                "select top 1 r.RecipeId, r.RecipeName " +
                "from Recipe r " +
                "left join RecipeIngredient ri on r.RecipeId = ri.RecipeId " +
                "left join RecipeStep rs on r.RecipeId = rs.RecipeId " +
                "left join RecipeCookBook rc on r.RecipeId = rc.RecipeId " +
                "where ri.RecipeIngredientId is null and rs.RecipeStepId is null and rc.RecipeCookBookId is null " +
                "order by recipeid desc");
            int recipeID = 0;
            string recdesc = "";
            if (dt.Rows.Count > 0)
            {
                recipeID = (int)dt.Rows[0]["RecipeId"];
                recdesc = dt.Rows[0]["RecipeName"].ToString();
            }

            Assume.That(recipeID > 0, "No deletable recipes found in DB");
            TestContext.WriteLine("existing recipe without dependencies id = " + recipeID + " name = " + recdesc);

            Recipe.Delete(dt);

            DataTable dtafter = SQLUtility.GetDataTable("select * from recipe where recipeid = " + recipeID);
            Assert.IsTrue(dtafter.Rows.Count == 0, "record with recipeid " + recipeID + " still exists in DB");
            TestContext.WriteLine("Record with recipeid = " + recipeID + " successfully deleted");
        }

        [Test]
        public void LoadRecipe()
        {
            int recipeID = GetExistingRecipeId();
            Assume.That(recipeID > 0, "No recipes in DB to test against");
            TestContext.WriteLine("existing recipe with id = " + recipeID);
            TestContext.WriteLine("Ensure that app loads recipe " + recipeID);

            DataTable dt = SQLUtility.GetDataTable("select * from recipe where recipeid = " + recipeID);
            int loadedid = (int)dt.Rows[0]["RecipeId"];
            Assert.IsTrue(loadedid == recipeID, $"{loadedid} <> {recipeID}");
            TestContext.WriteLine("Loaded recipe (" + loadedid + ")");
        }

        [Test]
        public void GetListOfCuisines()
        {
            int cuisineCount = SQLUtility.GetFirstColumnFirstRowValue("select total = count(*) from Cuisine");
            Assume.That(cuisineCount > 0, "No cuisines in DB to test against");
            TestContext.WriteLine("Num of cuisines in DB = " + cuisineCount);

            DataTable dt = Recipe.GetCuisineList();
            Assert.IsTrue(dt.Rows.Count == cuisineCount, "num rows returned by app (" + dt.Rows.Count + ") <> " + cuisineCount);

            TestContext.WriteLine("Number of rows in Cuisines returned by app = " + dt.Rows.Count);
        }

        private int GetExistingRecipeId()
        {
            return SQLUtility.GetFirstColumnFirstRowValue("select top 1 recipeid from recipe order by recipeid desc");
        }
    }
}
