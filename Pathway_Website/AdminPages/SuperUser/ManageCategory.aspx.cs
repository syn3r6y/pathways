using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pathway_System.BLL;
using Pathway_System.Entities.Security;

public partial class AdminPages_InstituteAdmin_ManageCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.IsInRole(SecurityRoles.WebsiteAdmins))
        {
            SuperUserAccess.Visible = true;
            RestrictAccess.Visible = false;
        }
    }


    protected void CategoryList_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";
            bool checkCat;

            PathwaysController controller = new PathwaysController();

            string categoryName = (e.Item.FindControl("CategoryNameTextbox") as TextBox).Text;

            checkCat = controller.CheckCategoryName(categoryName);

            if (categoryName.Length > 100)
            {
                errorList += "- The Category name cannot exceed 100 characters.\\n";
            }

            if (checkCat == false)
            {
                errorList += "- The Category Name selected currently exists in the system, and cannot be repeated.\\n";
            }
            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }

    protected void CategoryList_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";

            ListViewItem item = CategoryList.Items[e.ItemIndex];
            string categoryName = (item.FindControl("CategoryNameTextbox") as TextBox).Text;

            if (categoryName.Length > 100)
            {
                errorList += "- The Category name cannot exceed 100 characters. \\n";
            }


            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }
}