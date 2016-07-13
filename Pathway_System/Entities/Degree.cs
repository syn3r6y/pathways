namespace Pathway_System.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Degree")]
    public partial class Degree
    {
        public Degree()
        {
            Masters = new HashSet<Master>();
            PHDs = new HashSet<PHD>();
            DiplomaCertificates = new HashSet<DiplomaCertificate>();
            Institutes = new HashSet<Institute>();
        }

        public int DegreeID { get; set; }

        [Required]
        [StringLength(100)]
        public string DegreeName { get; set; }

        public string DegreeLength { get; set; }

        [StringLength(150)]
        public string DegreeLink { get; set; }

        public bool Activated { get; set; }

        public bool WorkOutdoors { get; set; }

        public bool ShiftWork { get; set; }

        public bool WorkTravel { get; set; }

        public int CategoryID { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<Master> Masters { get; set; }

        public virtual ICollection<PHD> PHDs { get; set; }

        public virtual ICollection<DiplomaCertificate> DiplomaCertificates { get; set; }

        public virtual ICollection<Institute> Institutes { get; set; }
    }
}
