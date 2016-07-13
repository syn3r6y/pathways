namespace Pathway_System.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Master
    {
        public Master()
        {
            Degrees = new HashSet<Degree>();
            Institutes = new HashSet<Institute>();
            PHDs = new HashSet<PHD>();
        }

        [Key]
        public int MastersID { get; set; }

        [Required]
        [StringLength(100)]
        public string MastersName { get; set; }

        public byte MastersLength { get; set; }

        [StringLength(150)]
        public string MastersLink { get; set; }

        public bool Activated { get; set; }

        public bool WorkOutdoors { get; set; }

        public bool ShiftWork { get; set; }

        public bool WorkTravel { get; set; }

        public int CategoryID { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<Degree> Degrees { get; set; }

        public virtual ICollection<Institute> Institutes { get; set; }

        public virtual ICollection<PHD> PHDs { get; set; }
    }
}
