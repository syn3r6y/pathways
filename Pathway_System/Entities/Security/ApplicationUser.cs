using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pathway_System.Entities.Security
{
    public class ApplicationUser : IdentityUser
    {
        public string Institution { get; set; }
        public string FullName { get; set; }
    }
}
