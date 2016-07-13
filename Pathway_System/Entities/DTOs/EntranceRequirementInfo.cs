using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pathway_System.Entities.DTOs
{
    public class EntranceRequirementInfo
    {
        public int ProgramID { get; set; }
        public int CourseID { get; set; }
        public string CourseName { get; set; }
        public byte Mark { get; set; }
    }
}
