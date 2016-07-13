namespace Pathway_System.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Category")]
    public partial class Category
    {
        public Category()
        {
            Degrees = new HashSet<Degree>();
            Masters = new HashSet<Master>();
            PHDs = new HashSet<PHD>();
            DiplomaCertificates = new HashSet<DiplomaCertificate>();
        }

        public int CategoryID { get; set; }

        [Required]
        [StringLength(100)]
        public string CategoryName { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string CategoryDescription { get; set; }

        public bool Activated { get; set; }

        public virtual ICollection<Degree> Degrees { get; set; }

        public virtual ICollection<Master> Masters { get; set; }

        public virtual ICollection<PHD> PHDs { get; set; }

        public virtual ICollection<DiplomaCertificate> DiplomaCertificates { get; set; }
    }
}
