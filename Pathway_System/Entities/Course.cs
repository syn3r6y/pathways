namespace Pathway_System.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Course")]
    public partial class Course
    {
        public Course()
        {
            EntranceRequirements = new HashSet<EntranceRequirement>();
        }

        public int CourseID { get; set; }

        [Required]
        [StringLength(150)]
        public string SubjectName { get; set; }

        public bool Activated { get; set; }

        public virtual ICollection<EntranceRequirement> EntranceRequirements { get; set; }
    }
}
