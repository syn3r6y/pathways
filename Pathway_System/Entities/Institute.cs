namespace Pathway_System.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Institute")]
    public partial class Institute
    {
        public Institute()
        {
            Degrees = new HashSet<Degree>();
            Masters = new HashSet<Master>();
            PHDs = new HashSet<PHD>();
            DiplomaCertificates = new HashSet<DiplomaCertificate>();
        }

        public int InstituteID { get; set; }

        [Required]
        [StringLength(100)]
        public string InstituteName { get; set; }

        public bool Activated { get; set; }

        public virtual ICollection<Degree> Degrees { get; set; }

        public virtual ICollection<Master> Masters { get; set; }

        public virtual ICollection<PHD> PHDs { get; set; }

        public virtual ICollection<DiplomaCertificate> DiplomaCertificates { get; set; }
    }
}
