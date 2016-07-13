namespace Pathway_System.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PHD")]
    public partial class PHD
    {
        public PHD()
        {
            Degrees = new HashSet<Degree>();
            Institutes = new HashSet<Institute>();
            Masters = new HashSet<Master>();
        }

        [Key]
        public int PHD_ID { get; set; }

        [Required]
        [StringLength(100)]
        public string PHD_Name { get; set; }

        public byte PHD_Length { get; set; }

        [StringLength(150)]
        public string PHD_Link { get; set; }

        public bool Activated { get; set; }

        public bool WorkOutdoors { get; set; }

        public bool ShiftWork { get; set; }

        public bool WorkTravel { get; set; }

        public int CategoryID { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<Degree> Degrees { get; set; }

        public virtual ICollection<Institute> Institutes { get; set; }

        public virtual ICollection<Master> Masters { get; set; }
    }
}
