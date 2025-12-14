namespace RecipeWinForms
{
    partial class frmRecipe
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmRecipe));
            tblRecipe = new TableLayoutPanel();
            tsMain = new ToolStrip();
            btnSave = new ToolStripButton();
            toolStripSeparator1 = new ToolStripSeparator();
            btnDelete = new ToolStripButton();
            toolStripSeparator2 = new ToolStripSeparator();
            lblCaptionLastName = new Label();
            lblCaptionCuisine = new Label();
            lblCaptionRecipeName = new Label();
            lblCaptionCalories = new Label();
            lblCaptionDateDrafted = new Label();
            lblCaptionDatePublished = new Label();
            lblCaptionDateArchived = new Label();
            lblCaptionRecipeStatus = new Label();
            lblPicture = new Label();
            lblCaptionFirstName = new Label();
            txtRecipeName = new TextBox();
            txtCalories = new TextBox();
            imgPicture = new PictureBox();
            txtDateDrafted = new TextBox();
            txtDatePublished = new TextBox();
            txtDateArchived = new TextBox();
            lblRecipeStatus = new Label();
            txtCuisine = new TextBox();
            txtLastName = new TextBox();
            txtFirstName = new TextBox();
            tblRecipe.SuspendLayout();
            tsMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)imgPicture).BeginInit();
            SuspendLayout();
            // 
            // tblRecipe
            // 
            tblRecipe.ColumnCount = 2;
            tblRecipe.ColumnStyles.Add(new ColumnStyle());
            tblRecipe.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            tblRecipe.Controls.Add(tsMain, 0, 0);
            tblRecipe.Controls.Add(lblCaptionLastName, 0, 2);
            tblRecipe.Controls.Add(lblCaptionCuisine, 0, 3);
            tblRecipe.Controls.Add(lblCaptionRecipeName, 0, 4);
            tblRecipe.Controls.Add(lblCaptionCalories, 0, 5);
            tblRecipe.Controls.Add(lblCaptionDateDrafted, 0, 6);
            tblRecipe.Controls.Add(lblCaptionDatePublished, 0, 7);
            tblRecipe.Controls.Add(lblCaptionDateArchived, 0, 8);
            tblRecipe.Controls.Add(lblCaptionRecipeStatus, 0, 9);
            tblRecipe.Controls.Add(lblPicture, 0, 10);
            tblRecipe.Controls.Add(lblCaptionFirstName, 0, 1);
            tblRecipe.Controls.Add(txtRecipeName, 1, 4);
            tblRecipe.Controls.Add(txtCalories, 1, 5);
            tblRecipe.Controls.Add(imgPicture, 1, 10);
            tblRecipe.Controls.Add(txtDateDrafted, 1, 6);
            tblRecipe.Controls.Add(txtDatePublished, 1, 7);
            tblRecipe.Controls.Add(txtDateArchived, 1, 8);
            tblRecipe.Controls.Add(lblRecipeStatus, 1, 9);
            tblRecipe.Controls.Add(txtCuisine, 1, 3);
            tblRecipe.Controls.Add(txtLastName, 1, 2);
            tblRecipe.Controls.Add(txtFirstName, 1, 1);
            tblRecipe.Dock = DockStyle.Fill;
            tblRecipe.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            tblRecipe.Location = new Point(0, 0);
            tblRecipe.Name = "tblRecipe";
            tblRecipe.RowCount = 11;
            tblRecipe.RowStyles.Add(new RowStyle());
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 40F));
            tblRecipe.Size = new Size(546, 507);
            tblRecipe.TabIndex = 0;
            // 
            // tsMain
            // 
            tblRecipe.SetColumnSpan(tsMain, 2);
            tsMain.Dock = DockStyle.Fill;
            tsMain.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point, 0);
            tsMain.Items.AddRange(new ToolStripItem[] { btnSave, toolStripSeparator1, btnDelete, toolStripSeparator2 });
            tsMain.Location = new Point(0, 0);
            tsMain.Name = "tsMain";
            tsMain.Size = new Size(546, 32);
            tsMain.TabIndex = 3;
            tsMain.Text = "toolStrip1";
            // 
            // btnSave
            // 
            btnSave.DisplayStyle = ToolStripItemDisplayStyle.Text;
            btnSave.Image = (Image)resources.GetObject("btnSave.Image");
            btnSave.ImageTransparentColor = Color.Magenta;
            btnSave.Name = "btnSave";
            btnSave.Size = new Size(55, 29);
            btnSave.Text = "Save";
            // 
            // toolStripSeparator1
            // 
            toolStripSeparator1.Name = "toolStripSeparator1";
            toolStripSeparator1.Size = new Size(6, 32);
            // 
            // btnDelete
            // 
            btnDelete.DisplayStyle = ToolStripItemDisplayStyle.Text;
            btnDelete.Image = (Image)resources.GetObject("btnDelete.Image");
            btnDelete.ImageTransparentColor = Color.Magenta;
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(70, 29);
            btnDelete.Text = "Delete";
            // 
            // toolStripSeparator2
            // 
            toolStripSeparator2.Name = "toolStripSeparator2";
            toolStripSeparator2.Size = new Size(6, 32);
            // 
            // lblCaptionLastName
            // 
            lblCaptionLastName.Anchor = AnchorStyles.Left;
            lblCaptionLastName.AutoSize = true;
            lblCaptionLastName.Location = new Point(3, 81);
            lblCaptionLastName.Name = "lblCaptionLastName";
            lblCaptionLastName.Size = new Size(84, 21);
            lblCaptionLastName.TabIndex = 0;
            lblCaptionLastName.Text = "Last Name";
            // 
            // lblCaptionCuisine
            // 
            lblCaptionCuisine.Anchor = AnchorStyles.Left;
            lblCaptionCuisine.AutoSize = true;
            lblCaptionCuisine.Location = new Point(3, 121);
            lblCaptionCuisine.Name = "lblCaptionCuisine";
            lblCaptionCuisine.Size = new Size(61, 21);
            lblCaptionCuisine.TabIndex = 1;
            lblCaptionCuisine.Text = "Cuisine";
            // 
            // lblCaptionRecipeName
            // 
            lblCaptionRecipeName.Anchor = AnchorStyles.Left;
            lblCaptionRecipeName.AutoSize = true;
            lblCaptionRecipeName.Location = new Point(3, 161);
            lblCaptionRecipeName.Name = "lblCaptionRecipeName";
            lblCaptionRecipeName.Size = new Size(102, 21);
            lblCaptionRecipeName.TabIndex = 2;
            lblCaptionRecipeName.Text = "Recipe Name";
            // 
            // lblCaptionCalories
            // 
            lblCaptionCalories.Anchor = AnchorStyles.Left;
            lblCaptionCalories.AutoSize = true;
            lblCaptionCalories.Location = new Point(3, 201);
            lblCaptionCalories.Name = "lblCaptionCalories";
            lblCaptionCalories.Size = new Size(66, 21);
            lblCaptionCalories.TabIndex = 3;
            lblCaptionCalories.Text = "Calories";
            // 
            // lblCaptionDateDrafted
            // 
            lblCaptionDateDrafted.Anchor = AnchorStyles.Left;
            lblCaptionDateDrafted.AutoSize = true;
            lblCaptionDateDrafted.Location = new Point(3, 241);
            lblCaptionDateDrafted.Name = "lblCaptionDateDrafted";
            lblCaptionDateDrafted.Size = new Size(98, 21);
            lblCaptionDateDrafted.TabIndex = 4;
            lblCaptionDateDrafted.Text = "Date Drafted";
            // 
            // lblCaptionDatePublished
            // 
            lblCaptionDatePublished.Anchor = AnchorStyles.Left;
            lblCaptionDatePublished.AutoSize = true;
            lblCaptionDatePublished.Location = new Point(3, 281);
            lblCaptionDatePublished.Name = "lblCaptionDatePublished";
            lblCaptionDatePublished.Size = new Size(114, 21);
            lblCaptionDatePublished.TabIndex = 5;
            lblCaptionDatePublished.Text = "Date Published";
            // 
            // lblCaptionDateArchived
            // 
            lblCaptionDateArchived.Anchor = AnchorStyles.Left;
            lblCaptionDateArchived.AutoSize = true;
            lblCaptionDateArchived.Location = new Point(3, 321);
            lblCaptionDateArchived.Name = "lblCaptionDateArchived";
            lblCaptionDateArchived.Size = new Size(107, 21);
            lblCaptionDateArchived.TabIndex = 6;
            lblCaptionDateArchived.Text = "Date Archived";
            // 
            // lblCaptionRecipeStatus
            // 
            lblCaptionRecipeStatus.Anchor = AnchorStyles.Left;
            lblCaptionRecipeStatus.AutoSize = true;
            lblCaptionRecipeStatus.Location = new Point(3, 361);
            lblCaptionRecipeStatus.Name = "lblCaptionRecipeStatus";
            lblCaptionRecipeStatus.Size = new Size(102, 21);
            lblCaptionRecipeStatus.TabIndex = 7;
            lblCaptionRecipeStatus.Text = "Recipe Status";
            // 
            // lblPicture
            // 
            lblPicture.AutoSize = true;
            lblPicture.Location = new Point(3, 402);
            lblPicture.Margin = new Padding(3, 10, 3, 0);
            lblPicture.Name = "lblPicture";
            lblPicture.Size = new Size(58, 21);
            lblPicture.TabIndex = 8;
            lblPicture.Text = "Picture";
            // 
            // lblCaptionFirstName
            // 
            lblCaptionFirstName.Anchor = AnchorStyles.Left;
            lblCaptionFirstName.AutoSize = true;
            lblCaptionFirstName.Location = new Point(3, 41);
            lblCaptionFirstName.Name = "lblCaptionFirstName";
            lblCaptionFirstName.Size = new Size(86, 21);
            lblCaptionFirstName.TabIndex = 9;
            lblCaptionFirstName.Text = "First Name";
            // 
            // txtRecipeName
            // 
            txtRecipeName.Dock = DockStyle.Fill;
            txtRecipeName.Location = new Point(123, 155);
            txtRecipeName.Name = "txtRecipeName";
            txtRecipeName.Size = new Size(420, 29);
            txtRecipeName.TabIndex = 13;
            // 
            // txtCalories
            // 
            txtCalories.Dock = DockStyle.Fill;
            txtCalories.Location = new Point(123, 195);
            txtCalories.Name = "txtCalories";
            txtCalories.Size = new Size(420, 29);
            txtCalories.TabIndex = 14;
            // 
            // imgPicture
            // 
            imgPicture.Dock = DockStyle.Fill;
            imgPicture.Location = new Point(123, 395);
            imgPicture.Name = "imgPicture";
            imgPicture.Size = new Size(420, 109);
            imgPicture.TabIndex = 15;
            imgPicture.TabStop = false;
            // 
            // txtDateDrafted
            // 
            txtDateDrafted.Dock = DockStyle.Fill;
            txtDateDrafted.Location = new Point(123, 235);
            txtDateDrafted.Name = "txtDateDrafted";
            txtDateDrafted.Size = new Size(420, 29);
            txtDateDrafted.TabIndex = 16;
            // 
            // txtDatePublished
            // 
            txtDatePublished.Dock = DockStyle.Fill;
            txtDatePublished.Location = new Point(123, 275);
            txtDatePublished.Name = "txtDatePublished";
            txtDatePublished.Size = new Size(420, 29);
            txtDatePublished.TabIndex = 17;
            // 
            // txtDateArchived
            // 
            txtDateArchived.Dock = DockStyle.Fill;
            txtDateArchived.Location = new Point(123, 315);
            txtDateArchived.Name = "txtDateArchived";
            txtDateArchived.Size = new Size(420, 29);
            txtDateArchived.TabIndex = 18;
            // 
            // lblRecipeStatus
            // 
            lblRecipeStatus.AutoSize = true;
            lblRecipeStatus.Dock = DockStyle.Fill;
            lblRecipeStatus.Location = new Point(123, 352);
            lblRecipeStatus.Name = "lblRecipeStatus";
            lblRecipeStatus.Size = new Size(420, 40);
            lblRecipeStatus.TabIndex = 19;
            lblRecipeStatus.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // txtCuisine
            // 
            txtCuisine.Dock = DockStyle.Fill;
            txtCuisine.Location = new Point(123, 115);
            txtCuisine.Name = "txtCuisine";
            txtCuisine.Size = new Size(420, 29);
            txtCuisine.TabIndex = 20;
            // 
            // txtLastName
            // 
            txtLastName.Dock = DockStyle.Fill;
            txtLastName.Location = new Point(123, 75);
            txtLastName.Name = "txtLastName";
            txtLastName.Size = new Size(420, 29);
            txtLastName.TabIndex = 21;
            // 
            // txtFirstName
            // 
            txtFirstName.Dock = DockStyle.Fill;
            txtFirstName.Location = new Point(123, 35);
            txtFirstName.Name = "txtFirstName";
            txtFirstName.Size = new Size(420, 29);
            txtFirstName.TabIndex = 22;
            // 
            // frmRecipe
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(546, 507);
            Controls.Add(tblRecipe);
            Name = "frmRecipe";
            Text = "Recipe Details";
            tblRecipe.ResumeLayout(false);
            tblRecipe.PerformLayout();
            tsMain.ResumeLayout(false);
            tsMain.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)imgPicture).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private TableLayoutPanel tblRecipe;
        private Label lblCaptionLastName;
        private Label lblCaptionCuisine;
        private Label lblCaptionRecipeName;
        private Label lblCaptionCalories;
        private Label lblCaptionDateDrafted;
        private Label lblCaptionDatePublished;
        private Label lblCaptionDateArchived;
        private Label lblCaptionRecipeStatus;
        private Label lblPicture;
        private Label lblCaptionFirstName;
        private TextBox txtRecipeName;
        private TextBox txtCalories;
        private PictureBox imgPicture;
        private TextBox txtDateDrafted;
        private TextBox txtDatePublished;
        private TextBox txtDateArchived;
        private Label lblRecipeStatus;
        private ToolStrip tsMain;
        private ToolStripButton btnSave;
        private ToolStripSeparator toolStripSeparator1;
        private ToolStripButton btnDelete;
        private ToolStripSeparator toolStripSeparator2;
        private TextBox txtCuisine;
        private TextBox txtLastName;
        private TextBox txtFirstName;
    }
}