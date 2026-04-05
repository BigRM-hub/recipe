using CPUFramework;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace RecipeSystem
{
    public class Recipe
    {
        public static DataTable GetCuisineList()
        {
            return SQLUtility.GetDataTable("select CuisineId, Cuisine from Cuisine");
        }

        public static DataTable GetUserList()
        {
            return SQLUtility.GetDataTable("select UserId, UserName from Users");
        }

        public static void Save(DataTable dtrecipe)
        {
            DataRow r = dtrecipe.Rows[0];
            int id = (int)r["RecipeId"];
            string sql = "";

            if (id > 0)
            {
                sql = string.Join(Environment.NewLine, $"update recipe set",
                    //$"FirstName = '{r["FirstName"]}',",
                    //$"LastName = '{r["LastName"]}',",
                    $"UserId = '{r["UserId"]}',",
                    $"CuisineId = '{r["CuisineId"]}',",
                    $"RecipeName = '{r["RecipeName"]}',",
                    $"Calories = '{r["Calories"]}',",
                    $"DateDrafted = '{r["DateDrafted"]}'",
                    //$"RecipeStatus = '{r["RecipeStatus"]}'",
                    $"where RecipeId = {r["RecipeId"]}");
            }
            else
            {
                //sql = "insert RecipeStandAlone(FirstName, LastName, Cuisine, RecipeName, Calories, DateDrafted)";//, DatePublished, DateArchived)"
                sql = "insert Recipe(UserId, CuisineId, RecipeName, Calories, DateDrafted) ";//, DatePublished, DateArchived) ";
                sql += $"select '{r["UserId"]}', '{r["CuisineId"]}', '{r["RecipeName"]}', '{r["Calories"]}', '{r["DateDrafted"]}'";//, '{r["DatePublished"]}', '{r["DateArchived"]}'";
            }
            Debug.Print("-------------------");
            Debug.Print(sql);
            SQLUtility.ExecuteSQL(sql);
        }

        public static void Delete(DataTable dtrecipe)
        {
            int id = (int)dtrecipe.Rows[0]["RecipeId"];
            string sql = "delete recipe where RecipeId = " + id;
            //Debug.Print(sql);
            SQLUtility.ExecuteSQL(sql);
        }

    }
}
