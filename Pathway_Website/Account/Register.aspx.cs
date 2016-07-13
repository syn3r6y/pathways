using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using Pathway_Website;
using Pathway_System.BLL.Security;
using Pathway_System.Entities.Security;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text, Email = Email.Text, Institution = InstituteList.SelectedValue, FullName = FullName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}