using Microsoft.AspNet.Identity.EntityFramework;
using Pathway_System.BLL;
using Pathway_System.BLL.Security;
using Pathway_System.Entities.DTOs;
using Pathway_System.Entities.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPages_SuperUser_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.IsInRole(SecurityRoles.AccountAdmins))
        {
            ManageAdminAccess.Visible = true;
            RestrictAccess.Visible = false;
        }
        

        if (!IsPostBack)
        {
            DataBindRoleList();
        }

    }

    private void DataBindRoleList()
    {
        // Populate the Roles Info
        RoleListView.DataSource = new RoleManager().Roles.ToList();
        RoleListView.DataBind();
    }

    protected void RoleListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "AddDefaultRoles":
                new RoleManager().AddDefaultRoles();
                DataBindRoleList();
                break;
            default:
                break;
        }
    }


    protected void User_ListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        // this gives you Row for your list items
        ListViewDataItem dataItem = (ListViewDataItem)e.Item;

        // Retrieve the DropDownList control from the current row. 
        Label userID = (Label)dataItem.FindControl("UserNameID");
        string userId = userID.Text;
        UserIdField.Value = userId;

        UsersRolesController controller = new UsersRolesController(); 

        ApplicationUser user = controller.Get_User(userId);

        UserName.Text = user.UserName;
        FullName.Text = user.FullName;
        Institute.Text = user.Institution;
        Email.Text = " " + user.Email;


        List<IdentityRole> userRole = controller.Get_UserRole(userId);
        UserRoleView.DataSource = userRole;
        UserRoleView.ShowFooter = true;
        UserRoleView.DataBind();
       
    }
    protected void AddRole_Click(object sender, EventArgs e)
    {
        string userName = UserName.Text;

        string roleName;
        bool addOk = true;

        DropDownList roles = UserRoleView.FooterRow.FindControl("UserRolesDDL") as DropDownList;
        roleName = roles.SelectedValue;

        foreach (GridViewRow row in UserRoleView.Rows)
        { 
            if(((Label)row.FindControl("RoleName")).Text == roleName)
            {
                addOk = false;
            }
        }

        if (addOk == true)
        {
            UserManager.AddUserToRole(userName, roleName);
            DataBindRoleList();
            Response.Write("<script>alert('Role has been updated.');</script>");
        }

        UsersRolesController controller = new UsersRolesController();
        List<IdentityRole> userRole = controller.Get_UserRole(UserIdField.Value);
        UserRoleView.DataSource = userRole;
        UserRoleView.ShowFooter = true;
        UserRoleView.DataBind();
        
    }
    protected void RemoveRoleButton_Click(object sender, EventArgs e)
    {
        string userName = UserName.Text;

        //Get the button that raised the event
        LinkButton deleteButton = (LinkButton)sender;

        //Get the row that contains this button
        GridViewRow row = (GridViewRow)deleteButton.NamingContainer;

        //get the role from the row
        string role = ((Label)row.FindControl("RoleName")).Text;

        //remove the role from the user
        UserManager.RemoveUserFromRole(userName, role);

        UsersRolesController controller = new UsersRolesController();
        List<IdentityRole> userRole = controller.Get_UserRole(UserIdField.Value);
        UserRoleView.DataSource = userRole;
        UserRoleView.ShowFooter = true;
        UserRoleView.DataBind();
        Response.Write("<script>alert('Role has been removed.');</script>");

    }
    protected void AddRoleEmpty_Click(object sender, EventArgs e)
    {
        string userName = UserName.Text;
        string roleName;
        bool addOk = true;

        DropDownList roles = UserRoleView.Controls[0].Controls[0].FindControl("UserRolesDDLonEmpty") as DropDownList;
        roleName = roles.SelectedValue;

        foreach (GridViewRow row in UserRoleView.Rows)
        {
            if (((Label)row.FindControl("RoleName")).Text == roleName)
            {
                addOk = false;
            }
        }

        if (addOk == true)
        {
            UserManager.AddUserToRole(userName, roleName);
            DataBindRoleList();
            Response.Write("<script>alert('Role has been updated.');</script>");
        }

        UsersRolesController controller = new UsersRolesController();
        List<IdentityRole> userRole = controller.Get_UserRole(UserIdField.Value);
        UserRoleView.DataSource = userRole;
        UserRoleView.ShowFooter = true;
        UserRoleView.DataBind();
    }
    protected void RemoveUserFromSystem_Click(object sender, EventArgs e)
    {
        UsersRolesController controller = new UsersRolesController();
        controller.DeleteUser(UserIdField.Value);
        UserIdField = null;

        Response.Redirect(Request.RawUrl);

    }
}