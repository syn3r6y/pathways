using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pathway_System.BLL;
using Pathway_System.Entities.Security;

public partial class AdminPages_SuperUser_ManageInstitute : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.IsInRole(SecurityRoles.WebsiteAdmins))
        {
            SuperUserAccess.Visible = true;
            RestrictAccess.Visible = false;
        }
    }
    protected void InstituteList_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";
            bool checkInst;
            PathwaysController controller = new PathwaysController();

            string instName = (e.Item.FindControl("InstituteNameTextBox") as TextBox).Text;
            checkInst = controller.CheckInstName(instName);

            if (instName.Length > 100)
            {
                errorList += "- The Institute name cannot exceed 100 characters. \\n";
            }
            if (checkInst == false)
            {
                errorList += "- The Institute Name selected currently exists in the system, and cannot be repeated.\\n";
            }

            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }
    protected void InstituteList_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";

            ListViewItem item = InstituteList.Items[e.ItemIndex];
            string courseyName = (item.FindControl("InstituteNameTextBox") as TextBox).Text;

            if (courseyName.Length > 100)
            {
                errorList += "- The Subject name cannot exceed 100 characters. \\n";
            }


            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }
}