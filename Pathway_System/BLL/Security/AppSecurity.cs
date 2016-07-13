using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pathway_System.BLL.Security
{
    public static class AppSecurity
    {
        public static void Startup()
        {
            new RoleManager().AddDefaultRoles();
            new UserManager().AddDefaultUsers();
        }
    }
}
