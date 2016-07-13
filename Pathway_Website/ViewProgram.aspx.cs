using Pathway_System.BLL;
using Pathway_System.Entities;
using Pathway_System.Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProgram : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CourseMarks_Gridview.DataBind();
        MarksNotQualified.Visible = false;

        string programID = Request.QueryString["programID"];

        //Course-Marks query string
        string allEnteredCourseMarks = Request.QueryString["allEnteredCourseMarks"];

        if (!string.IsNullOrEmpty(allEnteredCourseMarks))
        {
            allEnteredCourseMarks = allEnteredCourseMarks.Remove(allEnteredCourseMarks.Length - 1);

            //test data transfer
            List<string> firstSplit = allEnteredCourseMarks.Split(';').ToList();
            string[] secondSplit = new string[2];

            List<string> courses = new List<string>();
            List<string> marks = new List<string>();
            foreach (string item in firstSplit)
            {
                secondSplit = item.Split(',');
                //if (allEnteredCourseMarks.Split(',').Length > 2)
                //{
                    courses.Add(secondSplit[0]);
                    marks.Add(secondSplit[1]);
                //}
            }

            PathwaysController controller = new PathwaysController();
            List<CourseMarks> marksEntered = controller.ProcessStudentMarks(courses, marks);

            CourseMarks_Gridview.DataSource = marksEntered;
            CourseMarks_Gridview.DataBind();

            //Compare the certain course-marks
            int countGVRow = 0;

            foreach (GridViewRow theRow in EntReq_GridView.Rows)
            {
                var myCourseReqName = theRow.FindControl("LB_CourseName") as Label;
                var mycourseReqMarks = theRow.FindControl("LB_Marks") as Label;

                int countCourse = 0;

                foreach (string myCourseId in courses)
                {
                    PathwaysController myCourseController = new PathwaysController();
                    string myCourseName = myCourseController.GetCourseNameByID(int.Parse(myCourseId));

                    //Check the same course for comparison marks
                    if (myCourseName.Equals(myCourseReqName.Text))
                    {
                        //for the same column/record check
                        int countMarks = 0;

                        //get marks 
                        foreach (string myCourseMarks in marks)
                        {
                            //if they are in the same associated row/data
                            if (countCourse == countMarks)
                            {
                                //compare marks at the certain course
                                if (int.Parse(myCourseMarks) < int.Parse(mycourseReqMarks.Text))
                                {
                                    //show prompt messages
                                    MarksNotQualified.Visible = true;

                                    //Check the same row.data as the one associated with the compared data
                                    int enteredCourseMarksCount = 0;

                                    //for change row color if marks comparison failed
                                    foreach (GridViewRow myEnterCoureMarks in CourseMarks_Gridview.Rows)
                                    {
                                        //check the it is at the same row as the accosicated row
                                        if (countCourse == enteredCourseMarksCount)
                                        {
                                            //change color if marks comparison failed
                                            myEnterCoureMarks.ForeColor = ColorTranslator.FromHtml("#ff3300");
                                            myEnterCoureMarks.Font.Bold = true;
                                        }

                                        //for count the row, which row it is now.
                                        enteredCourseMarksCount += 1;

                                    }
                                }
                            }
                            countMarks += 1;                        
                        }                      
                    }
                    countCourse += 1;
                }

                countGVRow += 1;
            }
        }

        if (String.IsNullOrEmpty(programID))
        {
            Response.Redirect("~/Default.aspx");
        }
        else 
        {
            PathwaysController controller = new PathwaysController();

            // find out the type of program
            bool programType = controller.GetProgramType(int.Parse(programID));

            if (programType) //if its diploma/certificate
            {
                DiplomaCertificate dipCert = new DiplomaCertificate();
                dipCert = controller.GetSingleProgram(int.Parse(programID));


                //Populate page fields

                //Program Name:
                ProgramName.Text = dipCert.ProgramName;
                //Credential Type:
                if (dipCert.CredentialType == true)
                {
                    CredentialType.Text = "Diploma Program - " + dipCert.ProgramLength;

                    //Po's future path data bind
                    RP_FuturePathWay.DataSourceID = "ODS_FuturePath";
                    RP_FuturePathWay.DataBind();
                    foreach (RepeaterItem myFuturePath in RP_FuturePathWay.Items)
                    {
                        var myFuturePathID = myFuturePath.FindControl("LB_MyFuturePathDegreeID") as Label;
                        
                        if (!string.IsNullOrEmpty(myFuturePathID.Text))
                        {
                            Div_FuturePathway.Visible = true;
                        }
                    }     
                }
                else
                {
                    CredentialType.Text = "Certificate Program - " + dipCert.ProgramLength;
                }

                //Competitive Advantage
                CompetitiveAdvantage.Text = dipCert.CompetitveAdvantage + "%";

                //Working outdoors
                if (dipCert.WorkOutdoors == true)
                {
                    WorkOutdoors.Text = "Yes";
                }
                else
                {
                    WorkOutdoors.Text = "No";
                }
                //Travel
                if (dipCert.WorkTravel == true)
                {
                    Travel.Text = "Yes";
                }
                else
                {
                    Travel.Text = "No";
                }
                //Shift Work
                if (dipCert.ShiftWork == true)
                {
                    Schedule.Text = "Rotational";
                }
                else
                {
                    Schedule.Text = "Regular Hours";
                }

                //Program Link
                ProgramLink.Text = dipCert.ProgramLink;
                ProgramLink.NavigateUrl = dipCert.ProgramLink;

                //Entrance Req Details
                EntranceDetails.Text = dipCert.EntranceRequirementDetail;
            }

            else 
            {
                ProgramEnvironment.Visible = false;
                ProgramGradeInfo.Visible = false;
                MarkInfo.Visible = false;
                DegreeWorkInfo.Visible = true;
                Degree degree = new Degree();
                degree = controller.DegreeProgram_byID(int.Parse(programID));


                //Populate page fields

                //Program Name:
                ProgramName.Text = degree.DegreeName;
                //Credential Type:
                
                CredentialType.Text = "Degree Program - " + degree.DegreeLength;
                

                //Working outdoors
                if (degree.WorkOutdoors == true)
                {
                    DegOutDoors.Text = "Yes";
                }
                else
                {
                    DegOutDoors.Text = "No";
                }
                //Travel
                if (degree.WorkTravel == true)
                {
                    DegTravel.Text = "Yes";
                }
                else
                {
                    DegTravel.Text = "No";
                }
                //Shift Work
                if (degree.ShiftWork == true)
                {
                    DegSchedule.Text = "Rotational";
                }
                else
                {
                    DegSchedule.Text = "Regular Hours";
                }
                //Program Link
                ProgramLink.Text = degree.DegreeLink;
                ProgramLink.NavigateUrl = degree.DegreeLink;            
            }            
        }
    }
   
    protected void CourseMarks_Gridview_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Left;
        }

        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[1].Text = "Course Name";
            e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Left;
            e.Row.Cells[2].Text = "Grade";

            e.Row.Cells[0].Visible = false;            
        }
    }
}