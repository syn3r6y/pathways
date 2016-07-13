using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Addition Namespace
using Pathway_Website;
using PathwayModel.UI;
using Pathway_System.BLL;
using Pathway_System.Entities;
using Pathway_System.Entities.DTOs;
using Pathway_System.Entities.POCOs;
using Pathway_System.DAL;
using System.Drawing;
#endregion
public partial class FilteredSearch : System.Web.UI.Page
{
    List<string> errors = new List<string>();
    //List<string> allEnteredCourseMarksList = new List<string>();
    
    string allEnteredCourseMarks = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
        if (!Page.IsPostBack)
        {
            SetInitialCourse();
        }
    }

    #region Enter Marks

    private void SetInitialCourse()
    {
        //Create DataTable
        DataTable dt = new DataTable();
        DataRow dr = null;

        //Add initail values to DataTable
        dt.Columns.Add(new DataColumn("RowNumberCourse", typeof(string)));
        dt.Columns.Add(new DataColumn("Column1Course", typeof(string)));
        dt.Columns.Add(new DataColumn("Column2Course", typeof(string)));
        //dt.Columns.Add(new DataColumn("Column3", typeof(string)));

        dr = dt.NewRow();
        dr["RowNumberCourse"] = 1;
        dr["Column1Course"] = string.Empty;
        dr["Column2Course"] = string.Empty;
        //dr["Column3"] = string.Empty;

        dt.Rows.Add(dr);
        dr = dt.NewRow();

        //Store the DataTable in ViewState
        ViewState["CurrentTableCourse"] = dt;
        GV_EnterCourseMarks.DataSource = dt;
        GV_EnterCourseMarks.DataBind();

    }
    //add course-marks
    private void AddNewRowToCourse()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTableCourse"] != null)
        {
            //create new datatable, cast datatable of viewstate
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTableCourse"];
            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    //extract the values
                    DropDownList courseList = (DropDownList)GV_EnterCourseMarks.Rows[rowIndex].Cells[1].FindControl("DL_Course");
                    TextBox marks = (TextBox)GV_EnterCourseMarks.Rows[rowIndex].Cells[2].FindControl("TB_EnterMarks");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumberCourse"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Column1Course"] = courseList.Text;
                    dtCurrentTable.Rows[i - 1]["Column2Course"] = marks.Text;

                    rowIndex++;
                }

                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["CurrentTableCourse"] = dtCurrentTable;

                GV_EnterCourseMarks.DataSource = dtCurrentTable;
                GV_EnterCourseMarks.DataBind();
            }
        }

        else
        {
            Response.Write("ViewState is null");
        }
        //Set Previous Data on Postbacks
        SetPreviousCourseData();
    }
    //remove course-marks
    protected void Remove_Btn_Click(object sender, EventArgs e)
    {
        if (ViewState["CurrentTableCourse"] != null)
        {
            //create new datatable, cast datatable of viewstate
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTableCourse"];
            DataRow drCurrentRow = null;

            int rowIndex = 0;

            if (dtCurrentTable.Rows.Count > 1)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    //extract the values
                    DropDownList courseList = (DropDownList)GV_EnterCourseMarks.Rows[rowIndex].Cells[1].FindControl("DL_Course");
                    TextBox marks = (TextBox)GV_EnterCourseMarks.Rows[rowIndex].Cells[2].FindControl("TB_EnterMarks");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumberCourse"] = i;

                    dtCurrentTable.Rows[i - 1]["Column1Course"] = courseList.Text;
                    dtCurrentTable.Rows[i - 1]["Column2Course"] = marks.Text;

                    rowIndex++;
                }

                dtCurrentTable.Rows[rowIndex - 1].Delete();

                ViewState["CurrentTableCourse"] = dtCurrentTable;

                GV_EnterCourseMarks.DataSource = dtCurrentTable;
                GV_EnterCourseMarks.DataBind();
            }
        }

        SetPreviousCourseData();
    }

    private void SetPreviousCourseData()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTableCourse"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTableCourse"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList courseList = (DropDownList)GV_EnterCourseMarks.Rows[rowIndex].Cells[1].FindControl("DL_Course");
                    TextBox marks = (TextBox)GV_EnterCourseMarks.Rows[rowIndex].Cells[2].FindControl("TB_EnterMarks");

                    courseList.Text = dt.Rows[i]["Column1Course"].ToString();
                    marks.Text = dt.Rows[i]["Column2Course"].ToString();

                    rowIndex++;
                }
            }
        }
    }

    //Add a new Row
    protected void Add_Btn_Click(object sender, EventArgs e)
    {
        MessageUserControl.TryRun(() => 
        { 
            if(GV_EnterCourseMarks.Rows.Count < 8)
            {
                AddNewRowToCourse();

            }
            else
            {
                throw new Exception("You cannot enter more than 8 Courses-Marks each time.");
            }
        
        });
    }

    //Delete an existing Row
    protected void GV_EnterCourseMarks_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GV_EnterCourseMarks.DeleteRow(e.RowIndex);
        SetPreviousCourseData();
    }
    #endregion

    #region Compare Marks
    protected void CompareMarks()
    {
        //GridView userCourseMarks_GV = new GridView();
        //Repeater dbCourseMarks_RP = new Repeater();

        GridView userCourseMarks_GV = GV_EnterCourseMarks as GridView;
        Repeater dbCourseMarks_RP = RP_ProfileResults as Repeater;

        //Get GV Row Data
        foreach (GridViewRow theRow in userCourseMarks_GV.Rows)
        {
            //Setup variables for GV data
            var myGVCourseControl = theRow.FindControl("DL_Course") as DropDownList;
            var myGVMarksControl = theRow.FindControl("TB_EnterMarks") as TextBox;

            //Pass course and marks to next page
            //allEnteredCourseMarksList.Add(myGVCourseControl.SelectedItem.ToString() + "," + myGVMarksControl.Text + ";");
            //allEnteredCourseMarksList.ToString();

            string myGVCourse = "No Course";
            int myGVMarks = 101;

            //Get selected course from GV
            if (myGVCourseControl.SelectedIndex != 0)
            {
                myGVCourse = myGVCourseControl.SelectedValue;
                LB_EnterCourse.Text = myGVCourse;
            }
            else
            {
                MessageUserControl.ShowInfo("A course field requires a selection.");
                myGVCourseControl.SelectedIndex = 0;
                myGVMarksControl.Text = "";
            }

            //Get entered marks from GV
            if (!string.IsNullOrEmpty(myGVMarksControl.Text))
            {
                myGVMarks = int.Parse(myGVMarksControl.Text.ToString());
            }
            else
            {
                MessageUserControl.ShowInfo("A grade field must be filled out.");
                myGVCourseControl.SelectedIndex = 0;
                myGVMarksControl.Text = "";
            }

            //add entered courses and marks as a query string
            allEnteredCourseMarks += myGVCourseControl.SelectedValue.ToString() + "," + myGVMarksControl.Text + ";"; 

            LB_EnterMarks.Text = myGVMarks.ToString();

            //Get Parent Repeater Data
            foreach (RepeaterItem theItem in dbCourseMarks_RP.Items)
            {
                var Upgrading_Lbtn = theItem.FindControl("Upgrading_Lbtn") as LinkButton;
                var myProgramNameControl = theItem.FindControl("ProgramName") as Label;
                var MoreInfo_Lbtn = theItem.FindControl("MoreInfo_Lbtn") as LinkButton;
                var LB_NoEntranceReqMessage = theItem.FindControl("LB_NoEntranceReqMessage") as Label;
                //var ReuiredTitle_Original = theItem.FindControl("ReuiredTitle_Original") as Label;

                var StatusHeader = theItem.FindControl("StatusHeader") as Label;
                var EntReqHeader = theItem.FindControl("EntReqHeader") as Label;

                //for first child repeater
                var rp_Controls = theItem.FindControl("RP_CourseMarks") as Repeater;

                //for 2nd child repeater
                var rp_MyProgramDetail = theItem.FindControl("RP_DetailCourseMarks") as Repeater;

                //for 2nd child repeater
                var rp_MySuggestion = theItem.FindControl("RP_UnqualifiedCourse") as Repeater;
                var mySuggestionTable = theItem.FindControl("SuggestionTable") as Table;
                var myOrgRequiredTitle = theItem.FindControl("ReuiredTitle_Original") as Label;
                var myRequiredTitle = theItem.FindControl("RequiredTitle") as Label;
                var myEnteredTitle = theItem.FindControl("EnteredTitle") as Label;

                List<string> qualifiedList = new List<string>();

                //Get child Repeater Data
                foreach (RepeaterItem theChildItem in rp_Controls.Items)
                {
                    // setup repeater child item as instance
                    var courseControl = theChildItem.FindControl("LB_Results_CourseID") as Label;
                    var marksControl = theChildItem.FindControl("LB_Results_Marks") as Label;
                    var subjectCourse = theChildItem.FindControl("LB_Results_SubjectName") as Label;
                    var LB_UserEnterMessage = theChildItem.FindControl("LB_UserEnterMessage") as Label;

                    //get data from repeater items
                    string rp_TheCourse = courseControl.Text.ToString();
                    string rp_Marks = marksControl.Text.ToString();
                    


                    //assign marks that user enters in
                    int rp_TheMarks = int.Parse(marksControl.Text.ToString());
                    
                    // Compare course and marks 
                    if (myGVCourse.Equals(rp_TheCourse))
                    {
                        if (myGVMarks < rp_TheMarks)
                        {
                            Upgrading_Lbtn.Visible = true;
                            subjectCourse.ForeColor = ColorTranslator.FromHtml("#ff3300");
                            subjectCourse.Font.Bold = true;
                            marksControl.ForeColor = ColorTranslator.FromHtml("#ff3300");
                            marksControl.Font.Bold = true;
                            LB_UserEnterMessage.Text = "<span class='glyphicon glyphicon-ban-circle'></span>";
                            LB_UserEnterMessage.ForeColor = System.Drawing.Color.Red;
                         
                        }
                        else
                        {
                            subjectCourse.ForeColor = ColorTranslator.FromHtml("#009900");
                            subjectCourse.Font.Bold = true;
                            marksControl.ForeColor = ColorTranslator.FromHtml("#009900");
                            marksControl.Font.Bold = true;
                            LB_UserEnterMessage.Text = "<span class='glyphicon glyphicon-ok'></span>";
                            LB_UserEnterMessage.ForeColor = System.Drawing.Color.Green;
                        }

                        qualifiedList.Add(LB_UserEnterMessage.Text);

                    }

                    if (LB_UserEnterMessage.Text == "")
                    {
                        LB_UserEnterMessage.Text = "-";
                    }

                    LB_NoEntranceReqMessage.Visible = false;

                    EntReqHeader.Visible = true;
                    StatusHeader.Visible = true;

                    //ReuiredTitle_Original.Visible = true;
                }
             
            }

        }
    }

    #endregion
    
    protected void Results_Lbtn_Click(object sender, EventArgs e)
    {
        MessageUserControl.TryRun(() =>
        {
            List<string> allCourseList = new List<string>();
            List<string> repeatCourse = new List<string>();
            foreach (GridViewRow theRow in GV_EnterCourseMarks.Rows)
            {
                int sameCourseCount = 0;

                DropDownList DL_Course = (DropDownList)theRow.FindControl("DL_Course");

                allCourseList.Add(DL_Course.SelectedValue);

                foreach (string theCourse in allCourseList)
                {
                    if (DL_Course.SelectedValue == theCourse)
                    {
                        sameCourseCount += 1;
                    }
                }
                if (sameCourseCount >= 2)
                {
                    repeatCourse.Add(DL_Course.SelectedValue);
                }

            }

            if (repeatCourse.Count == 0)
            {
               
                if (DL_CredentialTypes.SelectedValue == "Degree")
                {
                    RP_Degree_ProfileResults.DataBind();
                    RP_ProfileResults.Visible = false;
                    RP_Degree_ProfileResults.Visible = true;
                    LB_ProgramCount.Text = "Total Programs Matched: (" + RP_Degree_ProfileResults.Items.Count + ")";
                }
                else
                {
                    RP_ProfileResults.DataBind();
                    RP_ProfileResults.Visible = true;
                    RP_Degree_ProfileResults.Visible = false;
                    LB_ProgramCount.Text = "Total Programs Matched: (" + RP_ProfileResults.Items.Count + ")";
                }

                Step4.Visible = false;
                Results_Header.Visible = true;
                Results.Visible = true;
                wizard.Visible = false;
                TryAgain.Visible = true;
                
            }
            else
            {
                throw new Exception("You cannot enter the Same Course at the same time.");
            }

        });
        MessageUserControl.TryRun((ProcessRequest)CompareMarks);
        foreach (RepeaterItem myCertainProgram in RP_ProfileResults.Items)
        {
            var lb_MyProgramID = myCertainProgram.FindControl("LB_ProgramID") as Label;
            var btn_MyMoreInfo = myCertainProgram.FindControl("MoreInfo_Lbtn") as LinkButton;

            if (allEnteredCourseMarks.Equals(",;"))
            {
                allEnteredCourseMarks = "";
            }

            btn_MyMoreInfo.OnClientClick =
            "window.open('ViewProgram.aspx?programID=" + lb_MyProgramID.Text +
                            "&allEnteredCourseMarks=" + allEnteredCourseMarks + "')";

        }
        foreach (RepeaterItem myCertainDegree in RP_Degree_ProfileResults.Items)
        {
            var lb_MyDegreeID = myCertainDegree.FindControl("LB_DegreeID") as Label;
            var btn_MyDegreeMoreInfo = myCertainDegree.FindControl("MoreInfo_Lbtn") as LinkButton;

            if (allEnteredCourseMarks.Contains(",;"))
            {
                allEnteredCourseMarks = "";
            }

            btn_MyDegreeMoreInfo.OnClientClick =
                 "window.open('ViewProgram.aspx?programID=" + lb_MyDegreeID.Text +
                                "&allEnteredCourseMarks=" + allEnteredCourseMarks + "')";

        }
    }

    protected void TryAgain_Click(object sender, EventArgs e)
    {
        TryAgain.Visible = false;
        Results_Header.Visible = false;
        Results.Visible = false;
        wizard.Visible = true;
        Step1.Visible = true;
        degreehide.Visible = true;
    }
    protected void Step1_Next_Click(object sender, EventArgs e)
    {
        Step1.Visible = false;
        Step2.Visible = true;
    }
    protected void Step2_Prev_Click(object sender, EventArgs e)
    {
        Step1.Visible = true;
        Step2.Visible = false;
    }
    protected void Step2_Next_Click(object sender, EventArgs e)
    {
        Step2.Visible = false;
        Step3.Visible = true;
    }
    protected void Step3_Prev_Click(object sender, EventArgs e)
    {
        Step2.Visible = true;
        Step3.Visible = false;
    }
    protected void Step3_Next_Click(object sender, EventArgs e)
    {
        Step3.Visible = false;
        Step4.Visible = true;
        if (DL_CredentialTypes.SelectedValue == "Degree")
        {
            LB_EnterMarksTitle.Visible = false;
            GV_EnterCourseMarks.Visible = false;
            LB_NoMarksEnteredMessage.Visible = true;
            degreehide.Visible = false;
        }
        else
        {
            LB_EnterMarksTitle.Visible = true;
            GV_EnterCourseMarks.Visible = true;
            LB_NoMarksEnteredMessage.Visible = false;
        }
    }
    protected void Step4_Prev_Click(object sender, EventArgs e)
    {
        Step3.Visible = true;
        Step4.Visible = false;
    }

    protected void EntReqShow_CheckedChanged(object sender, EventArgs e)
    {
        if (EntReqShow.Checked)
        {
            EnterMarksShowHide.Visible = true;
        }
        else
        {
            EnterMarksShowHide.Visible = false;
            SetInitialCourse();
        }
    }
}

