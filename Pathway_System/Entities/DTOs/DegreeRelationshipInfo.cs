using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pathway_System.Entities.DTOs
{
    public class DegreeRelationshipInfo
    {
        public int ProgramID { get; set; }
        public int DegreeID { get; set; }
        public string LinkedProgramName { get; set; }
    }
}
