using Microsoft.AspNet.Identity.EntityFramework;
using Pathway_System.DAL;
using Pathway_System.DAL.Security;
using Pathway_System.Entities.DTOs;
using Pathway_System.Entities.Security;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pathway_System.BLL
{
    [DataObject]
    public class UsersRolesController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<IdentityRole> Role_List()
        {
            using (var context = new ApplicationDbContext())
            {
                var allRoles = context.Roles.ToList();

                return allRoles;
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ApplicationUser> User_List()
        {
            using (var context = new ApplicationDbContext())
            {
                var allUsers = context.Users.ToList();

                return allUsers;
            }    

        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public ApplicationUser Get_User(string userID)
        {
            using (var context = new ApplicationDbContext())
            {
                return context.Users.Where(item => item.Id == userID).SingleOrDefault();
            }

        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<IdentityRole> Get_UserRole(string userID)
        {
            using (var context = new ApplicationDbContext())
            {
             
                var results = context.Roles.Where(x => x.Users.Select(y => y.UserId).Contains(userID)).ToList();
                return results;
            }
           
        }

        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void DeleteUser(string userID)
        {
            using (var context = new ApplicationDbContext())
            {
                ApplicationUser user = context.Users.Where(item => item.Id == userID).SingleOrDefault();
                context.Users.Remove(user);
                context.SaveChanges();
            }
        }
    }
}
