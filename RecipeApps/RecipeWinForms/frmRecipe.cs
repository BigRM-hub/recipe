using CPUFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        public frmRecipe()
        {
            InitializeComponent();
        }

        public void ShowForm(int recipeid)
        {
            string sql = "select r.RecipeId, u.FirstName, u.LastName, c.Cuisine, r.RecipeName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, r.RecipeStatus, r.Picture" +
                " from recipe r join users u on r.UserId = u.UserId join cuisine c on r.CuisineId = c.CuisineId where r.RecipeId = " + recipeid.ToString();
            DataTable dt = SQLUtility.GetDataTable(sql);
            lblFirstName.DataBindings.Add("Text", dt, "FirstName");
            lblLastName.DataBindings.Add("Text", dt, "LastName");
            lblCuisine.DataBindings.Add("Text", dt, "Cuisine");
            txtRecipeName.DataBindings.Add("Text", dt, "RecipeName");
            txtCalories.DataBindings.Add("Text", dt, "Calories");
            txtDateDrafted.DataBindings.Add("Text", dt, "DateDrafted");
            txtDatePublished.DataBindings.Add("Text", dt, "DatePublished");
            txtDateArchived.DataBindings.Add("Text", dt, "DateArchived");
            lblRecipeStatus.DataBindings.Add("Text", dt, "RecipeStatus");
            this.Show();
        }

    }
}

