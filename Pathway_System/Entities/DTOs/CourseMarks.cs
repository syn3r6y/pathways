using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pathway_System.Entities.DTOs
{
    public class CourseMarks
    {
        public int CourseID { get; set; }
        public string SubjectName { get; set; }
        //public bool Active_Course { get; set; }
        public int Marks { get; set; }
    }
}
