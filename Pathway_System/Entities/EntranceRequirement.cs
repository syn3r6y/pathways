namespace Pathway_System.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EntranceRequirement")]
    public partial class EntranceRequirement
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ProgramID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CourseID { get; set; }

        public byte Marks { get; set; }

        public virtual Course Course { get; set; }

        public virtual DiplomaCertificate DiplomaCertificate { get; set; }
    }
}
