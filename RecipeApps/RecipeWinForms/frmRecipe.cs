using CPUFramework;
using CPUWindowsFormsFramwork;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using RecipeSystem;

namespace RecipeWinForms
{
    public partial class frmRecipe : Form
    {
        DataTable dtrecipe;
        public frmRecipe()
        {
            InitializeComponent();
            btnSave.Click += BtnSave_Click;
            btnDelete.Click += BtnDelete_Click;
        }

        public void ShowForm(int recipeid)
        {
            //string sql = "select RecipeId, FirstName, LastName, Cuisine, RecipeName, Calories, DateDrafted, DatePublished, DateArchived, RecipeStatus, Picture" +
            //    " from recipestandalone where RecipeId = " + recipeid.ToString();
            string sql = "select r.RecipeId, u.UserId, u.UserName, c.CuisineId, c.Cuisine, r.RecipeName, r.Calories, r.DateDrafted, r.DatePublished, r.DateArchived, r.RecipeStatus, r.Picture" +
                " from recipe r join users u on r.UserId = u.UserId join cuisine c on r.CuisineId = c.CuisineId where r.RecipeId = " + recipeid.ToString();
            dtrecipe = SQLUtility.GetDataTable(sql);
            if (recipeid == 0)
            {
                dtrecipe.Rows.Add();
            }

            DataTable dtUser = Recipe.GetUserList();
            WindowsFormsUtility.SetListBinding(lstUserName, dtUser, dtrecipe, "User");
            //WindowsFormsUtility.SetControlBinding(txtLastName, dtrecipe);
            //WindowsFormsUtility.SetControlBinding(lstCuisine, dtrecipe);
            DataTable dtCuisine = Recipe.GetCuisineList();
            WindowsFormsUtility.SetListBinding(lstCuisine, dtCuisine, dtrecipe, "Cuisine");
            WindowsFormsUtility.SetControlBinding(txtRecipeName, dtrecipe);
            WindowsFormsUtility.SetControlBinding(txtCalories, dtrecipe);
            WindowsFormsUtility.SetControlBinding(txtDateDrafted, dtrecipe);
            WindowsFormsUtility.SetControlBinding(lblDatePublished, dtrecipe);
            WindowsFormsUtility.SetControlBinding(lblDateArchived, dtrecipe);
            WindowsFormsUtility.SetControlBinding(lblRecipeStatus, dtrecipe);
            //lblFirstName.DataBindings.Add("Text", dt, "FirstName");
            //lblLastName.DataBindings.Add("Text", dt, "LastName");
            //lblCuisine.DataBindings.Add("Text", dt, "Cuisine");
            //txtRecipeName.DataBindings.Add("Text", dt, "RecipeName");
            //txtCalories.DataBindings.Add("Text", dt, "Calories");
            //txtDateDrafted.DataBindings.Add("Text", dt, "DateDrafted");
            //txtDatePublished.DataBindings.Add("Text", dt, "DatePublished");
            //txtDateArchived.DataBindings.Add("Text", dt, "DateArchived");
            //lblRecipeStatus.DataBindings.Add("Text", dt, "RecipeStatus");
            this.Show();
        }

        private void Save()
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

        private void Delete()
        {
            int id = (int)dtrecipe.Rows[0]["RecipeId"];
            string sql = "delete recipe where RecipeId = " + id;
            Debug.Print(sql);
            SQLUtility.ExecuteSQL(sql);
            this.Close();
        }

        private void BtnDelete_Click(object? sender, EventArgs e)
        {
            Delete();
        }

        private void BtnSave_Click(object? sender, EventArgs e)
        {
            Save();
        }

    }
}

