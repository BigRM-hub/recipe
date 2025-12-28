using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;



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

    }
}
