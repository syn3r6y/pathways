using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pathway_System.BLL;
using Pathway_System.Entities.Security;

public partial class AdminPages_SuperUser_ManageCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.IsInRole(SecurityRoles.WebsiteAdmins))
        {
            SuperUserAccess.Visible = true;
            RestrictAccess.Visible = false;
        }
    }
    protected void CourseList_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";
            bool checkCourse;
            PathwaysController controller = new PathwaysController();

            string courseName = (e.Item.FindControl("SubjectNameTextBox") as TextBox).Text;

            checkCourse = controller.CheckSubjectName(courseName);

            if (courseName.Length > 150)
            {
                errorList += "- The Subject name cannot exceed 150 characters. \\n";
            }

            if (checkCourse == false)
            {
                errorList += "- The Subject Name selected currently exists in the system, and cannot be repeated.\\n";
            }
            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }

    protected void CourseList_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    { 
        MessageUserControl.TryRun(() =>
        {
            string errorList = "";

            ListViewItem item = CourseList.Items[e.ItemIndex];
            string courseyName = (item.FindControl("SubjectNameTextBox") as TextBox).Text;

            if (courseyName.Length > 150)
            {
                errorList += "- The Subject name cannot exceed 150 characters. \\n";
            }


            if (errorList != "")
            {
                e.Cancel = true;
                throw new Exception(errorList);
            }
        });
    }

}