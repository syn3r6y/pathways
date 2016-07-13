namespace Pathway_System.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DiplomaCertificate")]
    public partial class DiplomaCertificate
    {
        public DiplomaCertificate()
        {
            EntranceRequirements = new HashSet<EntranceRequirement>();
            Degrees = new HashSet<Degree>();
            Institutes = new HashSet<Institute>();
        }

        [Key]
        public int ProgramID { get; set; }

        [Required]
        [StringLength(100)]
        public string ProgramName { get; set; }

        public string ProgramLength { get; set; }

        [Required]
        [StringLength(150)]
        public string EntranceRequirementDetail { get; set; }

        public byte CompetitveAdvantage { get; set; }

        [StringLength(150)]
        public string ProgramLink { get; set; }

        public bool Activated { get; set; }

        public bool WorkOutdoors { get; set; }

        public bool ShiftWork { get; set; }

        public bool WorkTravel { get; set; }

        public bool CredentialType { get; set; }

        public int CategoryID { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<EntranceRequirement> EntranceRequirements { get; set; }

        public virtual ICollection<Degree> Degrees { get; set; }

        public virtual ICollection<Institute> Institutes { get; set; }
    }
}
