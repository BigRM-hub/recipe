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
            lblCaptionUser = new Label();
            lblCaptionCuisine = new Label();
            lblCaptionRecipeName = new Label();
            lblCaptionCalories = new Label();
            lblCaptionDateDrafted = new Label();
            lblCaptionDatePublished = new Label();
            lblCaptionDateArchived = new Label();
            lblCaptionRecipeStatus = new Label();
            lblPicture = new Label();
            txtRecipeName = new TextBox();
            txtCalories = new TextBox();
            imgPicture = new PictureBox();
            txtDateDrafted = new TextBox();
            lblRecipeStatus = new Label();
            lstCuisine = new ComboBox();
            lstUserName = new ComboBox();
            lblDatePublished = new Label();
            lblDateArchived = new Label();
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
            tblRecipe.Controls.Add(lblCaptionUser, 0, 1);
            tblRecipe.Controls.Add(lblCaptionCuisine, 0, 2);
            tblRecipe.Controls.Add(lblCaptionRecipeName, 0, 3);
            tblRecipe.Controls.Add(lblCaptionCalories, 0, 4);
            tblRecipe.Controls.Add(lblCaptionDateDrafted, 0, 5);
            tblRecipe.Controls.Add(lblCaptionDatePublished, 0, 6);
            tblRecipe.Controls.Add(lblCaptionDateArchived, 0, 7);
            tblRecipe.Controls.Add(lblCaptionRecipeStatus, 0, 8);
            tblRecipe.Controls.Add(lblPicture, 0, 9);
            tblRecipe.Controls.Add(txtRecipeName, 1, 3);
            tblRecipe.Controls.Add(txtCalories, 1, 4);
            tblRecipe.Controls.Add(imgPicture, 1, 9);
            tblRecipe.Controls.Add(txtDateDrafted, 1, 5);
            tblRecipe.Controls.Add(lblRecipeStatus, 1, 8);
            tblRecipe.Controls.Add(lstCuisine, 1, 2);
            tblRecipe.Controls.Add(lstUserName, 1, 1);
            tblRecipe.Controls.Add(lblDatePublished, 1, 6);
            tblRecipe.Controls.Add(lblDateArchived, 1, 7);
            tblRecipe.Dock = DockStyle.Fill;
            tblRecipe.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            tblRecipe.Location = new Point(0, 0);
            tblRecipe.Name = "tblRecipe";
            tblRecipe.RowCount = 10;
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
            tblRecipe.RowStyles.Add(new RowStyle(SizeType.Absolute, 20F));
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
            // lblCaptionUser
            // 
            lblCaptionUser.Anchor = AnchorStyles.Left;
            lblCaptionUser.AutoSize = true;
            lblCaptionUser.Location = new Point(3, 41);
            lblCaptionUser.Name = "lblCaptionUser";
            lblCaptionUser.Size = new Size(42, 21);
            lblCaptionUser.TabIndex = 0;
            lblCaptionUser.Text = "User";
            // 
            // lblCaptionCuisine
            // 
            lblCaptionCuisine.Anchor = AnchorStyles.Left;
            lblCaptionCuisine.AutoSize = true;
            lblCaptionCuisine.Location = new Point(3, 81);
            lblCaptionCuisine.Name = "lblCaptionCuisine";
            lblCaptionCuisine.Size = new Size(61, 21);
            lblCaptionCuisine.TabIndex = 1;
            lblCaptionCuisine.Text = "Cuisine";
            // 
            // lblCaptionRecipeName
            // 
            lblCaptionRecipeName.Anchor = AnchorStyles.Left;
            lblCaptionRecipeName.AutoSize = true;
            lblCaptionRecipeName.Location = new Point(3, 121);
            lblCaptionRecipeName.Name = "lblCaptionRecipeName";
            lblCaptionRecipeName.Size = new Size(102, 21);
            lblCaptionRecipeName.TabIndex = 2;
            lblCaptionRecipeName.Text = "Recipe Name";
            // 
            // lblCaptionCalories
            // 
            lblCaptionCalories.Anchor = AnchorStyles.Left;
            lblCaptionCalories.AutoSize = true;
            lblCaptionCalories.Location = new Point(3, 161);
            lblCaptionCalories.Name = "lblCaptionCalories";
            lblCaptionCalories.Size = new Size(66, 21);
            lblCaptionCalories.TabIndex = 3;
            lblCaptionCalories.Text = "Calories";
            // 
            // lblCaptionDateDrafted
            // 
            lblCaptionDateDrafted.Anchor = AnchorStyles.Left;
            lblCaptionDateDrafted.AutoSize = true;
            lblCaptionDateDrafted.Location = new Point(3, 201);
            lblCaptionDateDrafted.Name = "lblCaptionDateDrafted";
            lblCaptionDateDrafted.Size = new Size(98, 21);
            lblCaptionDateDrafted.TabIndex = 4;
            lblCaptionDateDrafted.Text = "Date Drafted";
            // 
            // lblCaptionDatePublished
            // 
            lblCaptionDatePublished.Anchor = AnchorStyles.Left;
            lblCaptionDatePublished.AutoSize = true;
            lblCaptionDatePublished.Location = new Point(3, 241);
            lblCaptionDatePublished.Name = "lblCaptionDatePublished";
            lblCaptionDatePublished.Size = new Size(114, 21);
            lblCaptionDatePublished.TabIndex = 5;
            lblCaptionDatePublished.Text = "Date Published";
            // 
            // lblCaptionDateArchived
            // 
            lblCaptionDateArchived.Anchor = AnchorStyles.Left;
            lblCaptionDateArchived.AutoSize = true;
            lblCaptionDateArchived.Location = new Point(3, 281);
            lblCaptionDateArchived.Name = "lblCaptionDateArchived";
            lblCaptionDateArchived.Size = new Size(107, 21);
            lblCaptionDateArchived.TabIndex = 6;
            lblCaptionDateArchived.Text = "Date Archived";
            // 
            // lblCaptionRecipeStatus
            // 
            lblCaptionRecipeStatus.Anchor = AnchorStyles.Left;
            lblCaptionRecipeStatus.AutoSize = true;
            lblCaptionRecipeStatus.Location = new Point(3, 321);
            lblCaptionRecipeStatus.Name = "lblCaptionRecipeStatus";
            lblCaptionRecipeStatus.Size = new Size(102, 21);
            lblCaptionRecipeStatus.TabIndex = 7;
            lblCaptionRecipeStatus.Text = "Recipe Status";
            // 
            // lblPicture
            // 
            lblPicture.AutoSize = true;
            lblPicture.Location = new Point(3, 362);
            lblPicture.Margin = new Padding(3, 10, 3, 0);
            lblPicture.Name = "lblPicture";
            lblPicture.Size = new Size(58, 21);
            lblPicture.TabIndex = 8;
            lblPicture.Text = "Picture";
            // 
            // txtRecipeName
            // 
            txtRecipeName.Dock = DockStyle.Fill;
            txtRecipeName.Location = new Point(123, 115);
            txtRecipeName.Name = "txtRecipeName";
            txtRecipeName.Size = new Size(420, 29);
            txtRecipeName.TabIndex = 13;
            // 
            // txtCalories
            // 
            txtCalories.Dock = DockStyle.Fill;
            txtCalories.Location = new Point(123, 155);
            txtCalories.Name = "txtCalories";
            txtCalories.Size = new Size(420, 29);
            txtCalories.TabIndex = 14;
            // 
            // imgPicture
            // 
            imgPicture.Dock = DockStyle.Fill;
            imgPicture.Location = new Point(123, 355);
            imgPicture.Name = "imgPicture";
            imgPicture.Size = new Size(420, 149);
            imgPicture.TabIndex = 15;
            imgPicture.TabStop = false;
            // 
            // txtDateDrafted
            // 
            txtDateDrafted.Dock = DockStyle.Fill;
            txtDateDrafted.Location = new Point(123, 195);
            txtDateDrafted.Name = "txtDateDrafted";
            txtDateDrafted.Size = new Size(420, 29);
            txtDateDrafted.TabIndex = 16;
            // 
            // lblRecipeStatus
            // 
            lblRecipeStatus.AutoSize = true;
            lblRecipeStatus.Dock = DockStyle.Fill;
            lblRecipeStatus.Location = new Point(123, 312);
            lblRecipeStatus.Name = "lblRecipeStatus";
            lblRecipeStatus.Size = new Size(420, 40);
            lblRecipeStatus.TabIndex = 19;
            lblRecipeStatus.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lstCuisine
            // 
            lstCuisine.FormattingEnabled = true;
            lstCuisine.Location = new Point(123, 75);
            lstCuisine.Name = "lstCuisine";
            lstCuisine.Size = new Size(197, 29);
            lstCuisine.TabIndex = 23;
            // 
            // lstUserName
            // 
            lstUserName.FormattingEnabled = true;
            lstUserName.Location = new Point(123, 35);
            lstUserName.Name = "lstUserName";
            lstUserName.Size = new Size(197, 29);
            lstUserName.TabIndex = 24;
            // 
            // lblDatePublished
            // 
            lblDatePublished.AutoSize = true;
            lblDatePublished.Dock = DockStyle.Fill;
            lblDatePublished.Location = new Point(123, 232);
            lblDatePublished.Name = "lblDatePublished";
            lblDatePublished.Size = new Size(420, 40);
            lblDatePublished.TabIndex = 25;
            lblDatePublished.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblDateArchived
            // 
            lblDateArchived.AutoSize = true;
            lblDateArchived.Dock = DockStyle.Fill;
            lblDateArchived.Location = new Point(123, 272);
            lblDateArchived.Name = "lblDateArchived";
            lblDateArchived.Size = new Size(420, 40);
            lblDateArchived.TabIndex = 26;
            lblDateArchived.TextAlign = ContentAlignment.MiddleLeft;
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
        private Label lblCaptionUser;
        private Label lblCaptionCuisine;
        private Label lblCaptionRecipeName;
        private Label lblCaptionCalories;
        private Label lblCaptionDateDrafted;
        private Label lblCaptionDatePublished;
        private Label lblCaptionDateArchived;
        private Label lblCaptionRecipeStatus;
        private Label lblPicture;
        private TextBox txtRecipeName;
        private TextBox txtCalories;
        private PictureBox imgPicture;
        private TextBox txtDateDrafted;
        private Label lblRecipeStatus;
        private ToolStrip tsMain;
        private ToolStripButton btnSave;
        private ToolStripSeparator toolStripSeparator1;
        private ToolStripButton btnDelete;
        private ToolStripSeparator toolStripSeparator2;
        private ComboBox lstCuisine;
        private ComboBox lstUserName;
        private Label lblDatePublished;
        private Label lblDateArchived;
    }
}