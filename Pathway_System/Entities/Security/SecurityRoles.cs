using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pathway_System.Entities.Security
{
    public static class SecurityRoles
    {
        public const string InstituteAdmins = "InstituteAdmins";
        public const string WebsiteAdmins = "WebsiteAdmins";
        public const string AccountAdmins = "AccountAdmins";

        internal static List<string> DefaultSecurityRoles
        {
            get
            {
                List<string> value = new List<string>();
                value.Add(InstituteAdmins);
                value.Add(WebsiteAdmins);
                value.Add(AccountAdmins);
                return value;
            }
        }
    }
}
