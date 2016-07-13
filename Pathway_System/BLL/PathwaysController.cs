using Pathway_System.DAL;
using Pathway_System.Entities;
using Pathway_System.Entities.POCOs;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespace
using Pathway_System.Entities.DTOs;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
#endregion

namespace Pathway_System.BLL
{
    [DataObject]
    public class PathwaysController
    {
        #region Admin Page
        //Get All Courses
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Course> Course_List()
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.Courses.OrderBy(x => x.SubjectName).ToList();
            }
        }

        //Get All Catgories
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Category> Category_List()
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.Categories.OrderBy(x => x.CategoryName).ToList();
            }
        }

        //Get All Degrees
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Degree> Degree_List()
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.Degrees.OrderBy(x => x.DegreeName).ToList();
            }
        }

        //Get All Diplomas
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<DiplomaCertificate> Diploma_List()
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.DiplomaCertificates.Where(anItem => anItem.CredentialType == true).OrderBy(x => x.ProgramName).ToList();
            }
        }

        //Get All Certificates
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<DiplomaCertificate> Certificate_List()
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.DiplomaCertificates.Where(anItem => anItem.CredentialType == false).OrderBy(x => x.ProgramName).ToList();
            }
        }

        //Get Entrance Requirements from ProgramID
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<EntranceRequirementInfo> EntReqList_byID(int programID)
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                var results = from data in model.EntranceRequirements
                              where data.ProgramID == programID
                              select new EntranceRequirementInfo
                              {
                                  ProgramID = data.ProgramID,
                                  CourseID = data.CourseID,
                                  CourseName = data.Course.SubjectName,
                                  Mark = data.Marks
                              };
                return results.ToList();
            }
        }

        //Get Certificate from ProgramID
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public DiplomaCertificate CertificateProgram_byID(int programID)
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.DiplomaCertificates.Where(items => items.ProgramID == programID && items.CredentialType == false).SingleOrDefault();
            }
        }

        //Get Diploma from ProgramID
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public DiplomaCertificate DiplomaProgram_byID(int programID)
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.DiplomaCertificates.Where(items => items.ProgramID == programID && items.CredentialType == true).SingleOrDefault();
            }
        }

        //Get Degree from DegreeID
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public Degree DegreeProgram_byID(int degreeID)
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.Degrees.Where(items => items.DegreeID == degreeID).SingleOrDefault();
            }
        }

        //Insert a degree program with links to diploma programs
        public void InsertDegreeProgram(Degree degreeProgram, List<int> diplomaIDs)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                Degree added = null;
                added = context.Degrees.Add(degreeProgram);
                // commits the add to the databas

                if (diplomaIDs != null)
                {
                    //create degree diploma entry for each row entered
                    foreach (int entry in diplomaIDs)
                    {
                        DiplomaCertificate selectedDiploma = context.DiplomaCertificates.SingleOrDefault(d => d.ProgramID == entry);
                        added.DiplomaCertificates.Add(selectedDiploma);
                    }
                }
                context.SaveChanges();
            }
        }
        //Insert a diploma program with entrance requirements for specific courses, and links to degree programs
        public void InsertDiplomaProgram(DiplomaCertificate diplomaProgram, List<EntranceRequirementList> entReqList, List<int> degreeIDs)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                DiplomaCertificate added = null;
                EntranceRequirement addedEntReq = null;
                added = context.DiplomaCertificates.Add(diplomaProgram);

                if (entReqList.Count != 0)
                {
                    // create entrance requirement entry for each row entered
                    foreach (EntranceRequirementList entry in entReqList)
                    {
                        EntranceRequirement entReq = new EntranceRequirement()
                        {
                            ProgramID = added.ProgramID,
                            CourseID = entry.CourseID,
                            Marks = entry.Mark
                        };

                        addedEntReq = context.EntranceRequirements.Add(entReq);
                    }
                }
                if (degreeIDs.Count != 0)
                {
                    //create degree diploma entry for each row entered
                    foreach (int entry in degreeIDs)
                    {
                        Degree selectedDegree = context.Degrees.SingleOrDefault(d => d.DegreeID == entry);
                        selectedDegree.DiplomaCertificates.Add(diplomaProgram);
                    }
                }


                // commits the add to the databas
                context.SaveChanges();
            }
        }
        //Insert a certificate program with links to specific entrance requirements
        public void InsertCertificateProgram(DiplomaCertificate certProgram, List<EntranceRequirementList> entReqList)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                DiplomaCertificate added = null;
                EntranceRequirement addedEntReq = null;
                added = context.DiplomaCertificates.Add(certProgram);

                if (entReqList != null)
                {
                    // create entrance requirement entry for each row entered
                    foreach (EntranceRequirementList entry in entReqList)
                    {
                        EntranceRequirement entReq = new EntranceRequirement()
                        {
                            ProgramID = added.ProgramID,
                            CourseID = entry.CourseID,
                            Marks = entry.Mark
                        };

                        addedEntReq = context.EntranceRequirements.Add(entReq);
                    }
                }
                // commits the add to the databas
                context.SaveChanges();
            }
        }

        // Insert entrance requirement
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void EntReq_Add(EntranceRequirementInfo item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {

                EntranceRequirement entReq = new EntranceRequirement()
                {
                    ProgramID = item.ProgramID,
                    CourseID = item.CourseID,
                    Marks = item.Mark
                };
                
                context.EntranceRequirements.Add(entReq);
                context.SaveChanges();
            }
        }

        // Update entrance requirement
        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void EntReq_Update(EntranceRequirementInfo item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {

                EntranceRequirement entReq = new EntranceRequirement()
                {
                    ProgramID = item.ProgramID,
                    CourseID = item.CourseID,
                    Marks = item.Mark
                };

                context.Entry<EntranceRequirement>(context.EntranceRequirements.Attach(entReq)).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void CertDiploma_Update(DiplomaCertificate item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {

                DiplomaCertificate entReq = new DiplomaCertificate()
                {
                    ProgramID = item.ProgramID,
                    ProgramName = item.ProgramName,
                    ProgramLength = item.ProgramLength,
                    EntranceRequirementDetail = item.EntranceRequirementDetail,
                    CompetitveAdvantage = item.CompetitveAdvantage,
                    ProgramLink = item.ProgramLink,
                    Activated = item.Activated,
                    WorkOutdoors = item.WorkOutdoors,
                    ShiftWork = item.ShiftWork,
                    WorkTravel = item.WorkTravel,
                    CredentialType = item.CredentialType,
                    CategoryID = item.CategoryID
                };

                context.Entry<DiplomaCertificate>(context.DiplomaCertificates.Attach(entReq)).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Degree_Update(Degree item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {

                Degree entReq = new Degree()
                {
                    DegreeID = item.DegreeID,
                    DegreeName = item.DegreeName,
                    DegreeLength = item.DegreeLength,
                    DegreeLink = item.DegreeLink,
                    Activated = item.Activated,
                    WorkOutdoors = item.WorkOutdoors,
                    ShiftWork = item.ShiftWork,
                    WorkTravel = item.WorkTravel,
                    CategoryID = item.CategoryID
                };

                context.Entry<Degree>(context.Degrees.Attach(entReq)).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        // Delete entrance requirement
        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void EntReq_Delete(EntranceRequirementInfo item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                EntranceRequirement existing = context.EntranceRequirements.Find(item.ProgramID, item.CourseID);
                context.EntranceRequirements.Remove(existing);
                context.SaveChanges();
            }
        }


        // Insert Degree Relationship
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void DegreeRel_Add(DegreeRelationshipInfo item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                //create degree diploma entry for row entered
                Degree selectedDegree = context.Degrees.SingleOrDefault(d => d.DegreeID == item.DegreeID);
                DiplomaCertificate selectedDiploma = context.DiplomaCertificates.SingleOrDefault(d => d.ProgramID == item.ProgramID);
                selectedDegree.DiplomaCertificates.Add(selectedDiploma);
                
                context.SaveChanges();
            }
        }
        
        // Delete Degree Relationship
        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void DegreeRel_Delete(DegreeRelationshipInfo item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                Degree selectedDegree = context.Degrees.SingleOrDefault(d => d.DegreeID == item.DegreeID);
                DiplomaCertificate selectedDiploma = context.DiplomaCertificates.SingleOrDefault(d => d.ProgramID == item.ProgramID);
                //selectedDegree.DiplomaCertificates.Add(selectedDiploma);
               // EntranceRequirement existing = context.EntranceRequirements.Find(item.ProgramID, item.CourseID);
                selectedDegree.DiplomaCertificates.Remove(selectedDiploma);
                context.SaveChanges();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<DegreeRelationshipInfo> Select_DegRel(int programID)
        {
            using (Pathway_Model context = new Pathway_Model())
            {

               //var query = context.Degrees.Where(m => m.DiplomaCertificates.Any(i => i.ProgramID == programID));


                var results = from data in context.DiplomaCertificates
                              from deg in data.Degrees
                              select new DegreeRelationshipInfo
                              {
                                  ProgramID = data.ProgramID,
                                  DegreeID = deg.DegreeID,
                                  LinkedProgramName = deg.DegreeName
                              };

                return results.Where(x => x.ProgramID == programID).ToList();

            }
        }

        //get a list of program links, and make sure they don't exist
        public bool CheckDipCertUrl(string Url)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                var urlNameExists = context.DiplomaCertificates.Any(x => x.ProgramLink == Url);

                if (urlNameExists)
                {
                    return false;
                }
                else 
                {
                    return true;
                }
            }
        
        }

        //get a list of prgoram links form degree
        public bool CheckDegUrl(string Url)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                var urlNameExists = context.Degrees.Any(x => x.DegreeLink == Url);

                if (urlNameExists)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }

        }

        // check to see if a program name exists
        public bool CheckProgramName(string name)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                var dipNameExists = context.DiplomaCertificates.Any(x => x.ProgramName == name);
                var degnameExists = context.Degrees.Any(x => x.DegreeName == name);

                if (dipNameExists || degnameExists)
                {
                    return false;
                }
                else 
                {
                    return true;
                }
            }
        }

        public bool CheckCategoryName(string catname)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                var catNameExists = context.Categories.Any(x => x.CategoryName == catname);


                if (catNameExists)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }
        public bool CheckSubjectName(string subname)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                var subNameExists = context.Courses.Any(x => x.SubjectName == subname);


                if (subNameExists)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }
        public bool CheckInstName(string instname)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                var instNameExists = context.Institutes.Any(x => x.InstituteName == instname);


                if (instNameExists)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }

        #region ManageCategory

        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void Category_Add(Category item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                Category added = null;
                added = context.Categories.Add(item);
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Category_Update(Category item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                context.Entry<Category>(context.Categories.Attach(item)).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }
        #endregion

        #region ManageCourse

        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void Course_Add(Course item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                Course added = null;
                added = context.Courses.Add(item);
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Course_Update(Course item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                context.Entry<Course>(context.Courses.Attach(item)).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }
        #endregion

        #region ManageInstitute
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Institute> Institute_List()
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                return context.Institutes.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void Institute_Add(Institute item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                Institute added = null;
                added = context.Institutes.Add(item);
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Institute_Update(Institute item)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                context.Entry<Institute>(context.Institutes.Attach(item)).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }
        #endregion
        #endregion

        #region Search Section
        //Get All Catgories
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Category> Category_List_ForSearch()
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.Categories.Where(x => x.Activated).ToList();
            }
        }

        //Get Programs(including degree, diploma & certificate) by category
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ProgramByCategory> GetProgramByCategory(int CateID)
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                //get program by category in DiplomaCertificate table 
                var DC_results = from DC in model.DiplomaCertificates
                                 where DC.CategoryID == CateID && DC.Activated
                                 orderby DC.ProgramName
                                 select new ProgramByCategory()
                                 {
                                     CategoryID = CateID,
                                     CategoryName = DC.Category.CategoryName,
                                     CategoryDescription = DC.Category.CategoryDescription,
                                     CredentialType = DC.CredentialType ? "Diploma" : "Certificate",
                                     ProgramName = DC.ProgramName,
                                     ProgramID = DC.ProgramID.ToString()
                                 };

                //get program by category in Degree table
                var Degree_result = from degree in model.Degrees
                                    where degree.CategoryID == CateID && degree.Activated
                                    orderby degree.DegreeName
                                    select new ProgramByCategory()
                                    {
                                        CategoryID = CateID,
                                        CategoryName = degree.Category.CategoryName,
                                        CategoryDescription = degree.Category.CategoryDescription,
                                        CredentialType = "Degree",
                                        ProgramName = degree.DegreeName,
                                        ProgramID = degree.DegreeID.ToString()
                                    };

                //combine two dump of result
                var Final_result = DC_results.Concat(Degree_result);

                //return final result to list
                return Final_result.ToList();

            }
        }

        //Get Programs By Credential Type
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ProgramByType> GetProgramByType(string type)
        {
            //get programs by Credential Type
            using (Pathway_Model model = new Pathway_Model())
            {
                //get programs in DiplomaCertificate table 
                var DC_All_Results = from DC in model.DiplomaCertificates
                                     where DC.Activated
                                     select new ProgramByType()
                                     {
                                         CategoryID = DC.CategoryID,
                                         CategoryName = DC.Category.CategoryName,
                                         CategoryDescription = DC.Category.CategoryDescription,
                                         CredentialType = DC.CredentialType ? "Diploma" : "Certificate",
                                         ProgramName = DC.ProgramName,
                                         ProgramID = DC.ProgramID

                                     };

                var Degree_All_Results = from degree in model.Degrees
                                         where degree.Activated
                                         select new ProgramByType()
                                         {
                                             CategoryID = degree.CategoryID,
                                             CategoryName = degree.Category.CategoryName,
                                             CategoryDescription = degree.Category.CategoryDescription,
                                             CredentialType = "Degree",
                                             ProgramName = degree.DegreeName,
                                             ProgramID = degree.DegreeID
                                         };

                var Final_Results = DC_All_Results.Concat(Degree_All_Results);

                return Final_Results.Where(ByType => ByType.CredentialType == type).ToList();
            }
        }

        //Get Programs By Keyword(s) 
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<AllPrograms> GetProgramByKeyword(string keyword)
        {
            //using DAL.context/model to get entity data
            using (Pathway_Model model = new Pathway_Model())
            {

                //get programs in DiplomaCertificate table 
                var DC_All_Results = from DC in model.DiplomaCertificates
                                     where DC.Activated
                                     select new AllPrograms()
                                     {
                                         CategoryID = DC.CategoryID,
                                         CategoryName = DC.Category.CategoryName,
                                         CategoryDescription = DC.Category.CategoryDescription,
                                         CredentialType = DC.CredentialType ? "Diploma" : "Certificate",
                                         ProgramName = DC.ProgramName,
                                         ProgramID = DC.ProgramID.ToString()
                                     };

                //get programs in Degree table
                var Degree_All_Results = from degree in model.Degrees
                                         where degree.Activated
                                         select new AllPrograms()
                                         {
                                             CategoryID = degree.CategoryID,
                                             CategoryName = degree.Category.CategoryName,
                                             CategoryDescription = degree.Category.CategoryDescription,
                                             CredentialType = "Degree",
                                             ProgramName = degree.DegreeName,
                                             ProgramID = degree.DegreeID.ToString()
                                         };


                //combine two dump of results By keyword
                var Final_All_Results = DC_All_Results.Concat(Degree_All_Results);

                return Final_All_Results.Where(ByKeyword => (
                                                                keyword.Contains(ByKeyword.CredentialType)
                                                                || keyword.Contains(ByKeyword.CategoryName)
                                                                || keyword.Contains(ByKeyword.ProgramName)
                                                            )
                                                            || 
                                                            (
                                                                ByKeyword.CredentialType.Equals(keyword)
                                                                || ByKeyword.CategoryName.Contains(keyword)
                                                                || ByKeyword.ProgramName.Contains(keyword)
                                                            )
                                                ).ToList();

            }

        }
        #endregion

        #region View Program Section 
        public bool GetProgramType(int programID)
        { 
            //Find the program type:
            using (Pathway_Model context = new Pathway_Model())
            {
                var dipNameExists = context.DiplomaCertificates.Any(x => x.ProgramID == programID);

                if (dipNameExists)
                {
                    return true;
                }

                else //False is a degree program
                {
                    return false;
                }

            }

        }

        public DiplomaCertificate GetSingleProgram(int programID)
        {
            using (Pathway_Model context = new Pathway_Model())
            {
                return context.DiplomaCertificates.Where(item => item.ProgramID == programID).SingleOrDefault();
            }
        }

        public string GetCourseNameByID(int courseId)
        {

            using (Pathway_Model model = new Pathway_Model())
            {
                return model.Courses.Single(x => x.CourseID == courseId).SubjectName.ToString();
            }


        }

        //process student marks
        public List<CourseMarks> ProcessStudentMarks(List<string> courses, List<string> marks)
        {

            List<CourseMarks> userMarks = new List<CourseMarks>();

            using (Pathway_Model context = new Pathway_Model())
            {
                int count = 0;
                foreach (string item in courses)
                {

                    int id = int.Parse(item);
                    CourseMarks entry = new CourseMarks()
                    {


                        CourseID = id,
                        Marks = int.Parse(marks[count]),
                        SubjectName = (from a in context.Courses
                                       where a.CourseID == id
                                       select a).Single().SubjectName
                    };
                    count++;
                    userMarks.Add(entry);
                }
            }

            return userMarks;
        }
        #endregion 

        #region Profile Section
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public Course GetSingleCourseNameByCourseID(int courseId)
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.Courses.Find(courseId);
            }
        }

        //Get programs(No Degree) By Credential Type
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ProgramByType> GetProgramNoDegreeByType(string type)
        {
            //get programs by Credential Type
            using (Pathway_Model model = new Pathway_Model())
            {
                //get programs in DiplomaCertificate table 
                var DC_All_Results = from DC in model.DiplomaCertificates
                                     where DC.Activated == true // no test yet
                                     select new ProgramByType()
                                     {
                                         CategoryID = DC.CategoryID,
                                         CategoryName = DC.Category.CategoryName,
                                         CategoryDescription = DC.Category.CategoryDescription,
                                         CredentialType = DC.CredentialType ? "Diploma" : "Certificate",
                                         ProgramName = DC.ProgramName

                                     };

                return DC_All_Results.Where(ByType => ByType.CredentialType == type).ToList();
            }
        }

        //Get List of Courses
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Course> GetCourseList()
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                return model.Courses.Where(x => x.Activated == true).ToList();
            }
        }

        //Get Final Profile 
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ProfileResults> GetProfileResults(string type, int categoryId, Boolean outdoors, Boolean shift, Boolean travel)
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                var results = from data in model.DiplomaCertificates
                              where data.CategoryID == categoryId
                                    && data.Activated
                                    && data.WorkOutdoors == outdoors
                                    && data.ShiftWork == shift
                                    && data.WorkTravel == travel

                              select new ProfileResults()
                              {
                                  ProgramID = data.ProgramID,
                                  ProgramName = data.ProgramName,
                                  CredentialType = data.CredentialType ? "Diploma" : "Certificate",
                                  ProgramLength = data.ProgramLength,
                                  CompetitiveAdv = data.CompetitveAdvantage,
                                  WorkOutboors = data.WorkOutdoors ? "Work Outdoors" : "Work Indoors",
                                  ShiftWork = data.ShiftWork ? "Rotational" : "Regular",
                                  WorkTravel = data.WorkTravel ? "Possible Travel" : "No Travel",
                                  ProgramLink = data.ProgramLink,
                                  // ??
                                  //ProgramCount = data.Category.DiplomaCertificates.Count,
                                  EntranceRequirement = data.EntranceRequirementDetail,
                                  ProgramCourseMarks = from item in data.EntranceRequirements
                                                       where item.ProgramID == data.ProgramID
                                                                && item.Course.Activated
                                                       select new CourseMarks()
                                                       {
                                                           CourseID = item.CourseID,
                                                           SubjectName = item.Course.SubjectName,
                                                           Marks = item.Marks
                                                       }

                                  //ProgramDegreeLinks = from item in model.DiplomaCertificates
                                  //                     from deg in data.Degrees
                                  //                     where deg.Activated
                                  //                      && item.ProgramID == data.ProgramID
                                  //                     select new ProgramDegreeLink()
                                  //                     {
                                  //                         ProgramID = data.ProgramID,
                                  //                         DegreeID = item.DegreeID,
                                  //                         DegreeName = item.Degree.DegreeName,
                                  //                         DegreeLink = item.Degree.DegreeLink
                                  //                     }
                              };

                return results.Where(x => x.CredentialType == type).ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ProfileResults> GetDegreeProfileResults(string type, int categoryId, Boolean outdoors, Boolean shift, Boolean travel)
        {

            using (Pathway_Model model = new Pathway_Model())
            {

                var degree_Results = from data in model.Degrees
                                     where data.CategoryID == categoryId
                                           && data.Activated
                                           && data.WorkOutdoors == outdoors
                                           && data.ShiftWork == shift
                                           && data.WorkTravel == travel

                                     select new ProfileResults()
                                     {
                                         ProgramID = data.DegreeID,
                                         ProgramName = data.DegreeName,
                                         CredentialType = "Degree",
                                         ProgramLength = data.DegreeLength,
                                         CompetitiveAdv = 0,
                                         WorkOutboors = data.WorkOutdoors ? "Work Outdoors" : "Work Indoors",
                                         ShiftWork = data.ShiftWork ? "Rotational" : "Regular",
                                         WorkTravel = data.WorkTravel ? "Possible Travel" : "No Travel",
                                         ProgramLink = data.DegreeLink

                                     };

                return degree_Results.Where(x => x.CredentialType == type).ToList();
            }
        }

        //Get Program Degree Link
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ProgramDegreeLink> GetProgramDegreeLinks(int programID)
        {
            using (Pathway_Model model = new Pathway_Model())
            {
                var prog = model.DiplomaCertificates.Find(programID);

                var results = from item in prog.Degrees
                              where item.Activated

                              select new ProgramDegreeLink()
                              {
                                  ProgramID = programID,
                                  DegreeID = item.DegreeID,
                                  DegreeName = item.DegreeName,
                                  DegreeLink = item.DegreeLink
                              };

                return results.ToList();
            }

        }

        #endregion

    }
}
