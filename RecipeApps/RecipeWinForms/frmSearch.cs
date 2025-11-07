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
    public partial class frmSearch : Form
    {
        public frmSearch()
        {
            InitializeComponent();
            btnSearch.Click += BtnSearch_Click;
            gResults.CellDoubleClick += GResults_CellDoubleClick;
            FormatGrid();
        }

        private void RecipeSearch(string recipe)
        {
            string sql = "select r.RecipeId, r.RecipeName from recipe r where r.RecipeName like '%" + recipe + "%'";
            DataTable dt = SQLUtility.GetDataTable(sql);
            gResults.DataSource = dt;
            gResults.Columns["RecipeId"].Visible = false;
        }

        private void ShowRecipe(int rowindex)
        {
            int id = (int)gResults.Rows[rowindex].Cells["RecipeId"].Value;
            frmRecipe frm = new frmRecipe();
            frm.ShowForm(id);
        }

        private void FormatGrid()
        {
            gResults.AllowUserToAddRows = false;
            gResults.ReadOnly = true;
            gResults.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            gResults.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
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
