using CPUFramework;
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
using CPUWindowsFormsFramwork;

namespace RecipeWinForms
{
    public partial class frmSearch : Form
    {
        DataTable dtrecipe;
        public frmSearch()
        {
            InitializeComponent();
            btnSearch.Click += BtnSearch_Click;
            gResults.CellDoubleClick += GResults_CellDoubleClick;
            btnNew.Click += BtnNew_Click;
            WindowsFormsUtility.FormatGridForSearchResults(gResults);
        }

        private void RecipeSearch(string recipe)
        {
            string sql = "select r.RecipeId, r.RecipeName from recipestandalone r where r.RecipeName like '%" + recipe + "%'";
            //string sql = "select r.RecipeId, r.RecipeName from recipe r where r.RecipeName like '%" + recipe + "%'";
            DataTable dt = SQLUtility.GetDataTable(sql);
            gResults.DataSource = dt;
            gResults.Columns["RecipeId"].Visible = false;
        }

        private void ShowRecipe(int rowindex)
        {
            int id = 0;
            if (rowindex > -1)
            {
                id = (int)gResults.Rows[rowindex].Cells["RecipeId"].Value;
            }
            frmRecipe frm = new frmRecipe();
            frm.ShowForm(id);
        }




        private void BtnNew_Click(object? sender, EventArgs e)
        {
            ShowRecipe(-1);
        }

        private void GResults_CellDoubleClick(object? sender, DataGridViewCellEventArgs e)
        {
            ShowRecipe(e.RowIndex);
        }

        private void BtnSearch_Click(object? sender, EventArgs e)
        {
            RecipeSearch(txtSearch.Text);
        }

    }
}
