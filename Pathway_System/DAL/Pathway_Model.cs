namespace Pathway_System.DAL

{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using Pathway_System.Entities;

    public partial class Pathway_Model : DbContext
    {
        public Pathway_Model()
            : base("name=Pathway_Model")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<Degree> Degrees { get; set; }
        public virtual DbSet<DiplomaCertificate> DiplomaCertificates { get; set; }
        public virtual DbSet<EntranceRequirement> EntranceRequirements { get; set; }
        public virtual DbSet<Institute> Institutes { get; set; }
        public virtual DbSet<Master> Masters { get; set; }
        public virtual DbSet<PHD> PHDs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>()
                .Property(e => e.CategoryName)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.CategoryDescription)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Degrees)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Masters)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.PHDs)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.DiplomaCertificates)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Course>()
                .Property(e => e.SubjectName)
                .IsUnicode(false);

            modelBuilder.Entity<Course>()
                .HasMany(e => e.EntranceRequirements)
                .WithRequired(e => e.Course)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Degree>()
                .Property(e => e.DegreeName)
                .IsUnicode(false);

            modelBuilder.Entity<Degree>()
                .Property(e => e.DegreeLink)
                .IsUnicode(false);

            modelBuilder.Entity<Degree>()
                .HasMany(e => e.Masters)
                .WithMany(e => e.Degrees)
                .Map(m => m.ToTable("DegreeMastersDetail").MapLeftKey("DegreeID").MapRightKey("MastersID"));

            modelBuilder.Entity<Degree>()
                .HasMany(e => e.PHDs)
                .WithMany(e => e.Degrees)
                .Map(m => m.ToTable("DegreePHD_Detail").MapLeftKey("DegreeID").MapRightKey("PHD_ID"));

            modelBuilder.Entity<Degree>()
                .HasMany(e => e.DiplomaCertificates)
                .WithMany(e => e.Degrees)
                .Map(m => m.ToTable("DegreeRelationship").MapLeftKey("DegreeID").MapRightKey("ProgramID"));

            modelBuilder.Entity<Degree>()
                .HasMany(e => e.Institutes)
                .WithMany(e => e.Degrees)
                .Map(m => m.ToTable("InstituteDegreeDetail").MapLeftKey("DegreeID").MapRightKey("InstituteID"));

            modelBuilder.Entity<DiplomaCertificate>()
                .Property(e => e.ProgramName)
                .IsUnicode(false);

            modelBuilder.Entity<DiplomaCertificate>()
                .Property(e => e.EntranceRequirementDetail)
                .IsUnicode(false);

            modelBuilder.Entity<DiplomaCertificate>()
                .Property(e => e.ProgramLink)
                .IsUnicode(false);

            modelBuilder.Entity<DiplomaCertificate>()
                .HasMany(e => e.EntranceRequirements)
                .WithRequired(e => e.DiplomaCertificate)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Institute>()
                .Property(e => e.InstituteName)
                .IsUnicode(false);

            modelBuilder.Entity<Institute>()
                .HasMany(e => e.Masters)
                .WithMany(e => e.Institutes)
                .Map(m => m.ToTable("InstituteMastersDetail").MapLeftKey("InstituteID").MapRightKey("MastersID"));

            modelBuilder.Entity<Institute>()
                .HasMany(e => e.PHDs)
                .WithMany(e => e.Institutes)
                .Map(m => m.ToTable("InstitutePHD_Detail").MapLeftKey("InstituteID").MapRightKey("PHD_ID"));

            modelBuilder.Entity<Institute>()
                .HasMany(e => e.DiplomaCertificates)
                .WithMany(e => e.Institutes)
                .Map(m => m.ToTable("InstituteProgramDetail").MapLeftKey("InstituteID").MapRightKey("ProgramID"));

            modelBuilder.Entity<Master>()
                .Property(e => e.MastersName)
                .IsUnicode(false);

            modelBuilder.Entity<Master>()
                .Property(e => e.MastersLink)
                .IsUnicode(false);

            modelBuilder.Entity<Master>()
                .HasMany(e => e.PHDs)
                .WithMany(e => e.Masters)
                .Map(m => m.ToTable("MastersPHD_Detail").MapLeftKey("MastersID").MapRightKey("PHD_ID"));

            modelBuilder.Entity<PHD>()
                .Property(e => e.PHD_Name)
                .IsUnicode(false);

            modelBuilder.Entity<PHD>()
                .Property(e => e.PHD_Link)
                .IsUnicode(false);
        }
    }
}
