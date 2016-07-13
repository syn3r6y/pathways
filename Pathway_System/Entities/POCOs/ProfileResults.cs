using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pathway_System.Entities.POCOs
{
    public class ProfileResults
    {
        public int ProgramID { get; set; }
        public string ProgramName { get; set; }
        //public bool Active_Program { get; set; }
        public string CredentialType { get; set; }
        public string ProgramLength { get; set; }
        public int CompetitiveAdv { get; set; }
        public string WorkOutboors { get; set; }
        public string ShiftWork { get; set; }
        public string WorkTravel { get; set; }
        public string ProgramLink { get; set; }
        public string EntranceRequirement { get; set; }
        public int ProgramCount { get; set; }
        public IEnumerable ProgramCourseMarks { get; set; }
        public IEnumerable ProgramDegreeLinks { get; set; }
        //public int CourseID { get; set; }
        //public string SubjectName { get; set; }
        ////public bool Active_Course { get; set; }
        //public int Marks { get; set; }

    }
}
