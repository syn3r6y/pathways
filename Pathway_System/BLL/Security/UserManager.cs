using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using Pathway_System.DAL;
using Pathway_System.DAL.Security;
using Pathway_System.BLL.Security;
using Pathway_System.Entities.Security;
#endregion


namespace Pathway_System.BLL.Security
{
    public class UserManager : UserManager<ApplicationUser>
    {
        #region Constants & Config Values
        private string STR_DEFAULT_PASSWORD
        { get { return System.Configuration.ConfigurationSettings.AppSettings["DefaultPwd"]; } }
        private string STR_WEBMASTER_USERNAME
        { get { return System.Configuration.ConfigurationSettings.AppSettings["DefaultWebAdmin"]; } }
        private string STR_ACCOUNT_ADMIN_USERNAME
        { get { return System.Configuration.ConfigurationSettings.AppSettings["DefaultAccountAdmin"]; } }
        private string STR_DEFAULT_EMAIL_DOMAIN
        { get { return System.Configuration.ConfigurationSettings.AppSettings["DefaultEmailDomain"]; } }

        /// <summary>Requires FirstName and LastName</summary>
        private const string STR_USERNAME_FORMAT = "{0}.{0}";
        /// <summary>Requires UserName</summary>
        private const string STR_EMAIL_FORMAT = "{0}@{1}";

        #endregion

        #region Constructor
        public UserManager()
            : base(new UserStore<ApplicationUser>(new ApplicationDbContext()))
        {
        }
        #endregion

        public void AddDefaultUsers() // TODO: Make internal
        {
            CreateDefaultUserForRole(STR_WEBMASTER_USERNAME, SecurityRoles.WebsiteAdmins);
            CreateDefaultUserForRole(STR_ACCOUNT_ADMIN_USERNAME, SecurityRoles.AccountAdmins);
        }

        private void CreateDefaultUserForRole(string userName, string roleName)
        {
            var aUser = Users.FirstOrDefault(x => x.UserName.Equals(userName));
            // Add a web  master user
            if (aUser == null)
            {
                var webMasterAccount = new ApplicationUser()
                {
                    UserName = userName,
                    Email = string.Format(STR_EMAIL_FORMAT, userName, STR_DEFAULT_EMAIL_DOMAIN)
                };
                this.Create(webMasterAccount, STR_DEFAULT_PASSWORD);
                aUser = Users.FirstOrDefault(x => x.UserName.Equals(userName));
            }
            if (!this.IsInRole(aUser.Id, roleName))
                AddUserToRole(userName, roleName);
        }

        public static void AddUserToRole(string userName, string roleName)
        {

            ApplicationDbContext context = new ApplicationDbContext();
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));

            try
            {
                var user = UserManager.FindByName(userName);
                UserManager.AddToRole(user.Id, roleName);
                context.SaveChanges();
            }
            catch
            {
                throw;
            }
        }

        public static void RemoveUserFromRole(string userName, string roleName)
        {

            ApplicationDbContext context = new ApplicationDbContext();
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));

            try
            {
                var user = UserManager.FindByName(userName);
                UserManager.RemoveFromRole(user.Id, roleName);
                context.SaveChanges();
            }
            catch
            {
                throw;
            }
        }
    }
}
