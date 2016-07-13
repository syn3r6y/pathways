using Pathway_System.BLL;
using Pathway_System.Entities;
using Pathway_System.Entities.POCOs;
using Pathway_System.Entities.Security;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPages_InstituteAdmin_InsertProgram : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;

        if (User.IsInRole(SecurityRoles.InstituteAdmins))
        {
            InstituteAdminAccess.Visible = true;
            RestrictAccess.Visible = false;
        }

        if (!Page.IsPostBack)
        {
            SetInitialCourse();
            SetInitialProgram();
            SetInitialDegree();
        }
    }

    //---------COURSE GRIDVIEW CODE----------//
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
        Course_Gridview.DataSource = dt;
        Course_Gridview.DataBind();

    }

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
                    DropDownList courseList = (DropDownList)Course_Gridview.Rows[rowIndex].Cells[1].FindControl("CourseList");
                    TextBox marks = (TextBox)Course_Gridview.Rows[rowIndex].Cells[2].FindControl("EnterMark");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumberCourse"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Column1Course"] = courseList.Text;
                    dtCurrentTable.Rows[i - 1]["Column2Course"] = marks.Text;

                    rowIndex++;
                }
                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["CurrentTableCourse"] = dtCurrentTable;

                Course_Gridview.DataSource = dtCurrentTable;
                Course_Gridview.DataBind();
            }
        }

        else
        {
            Response.Write("ViewState is null");
        }
        //Set Previous Data on Postbacks
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
                    DropDownList courseList = (DropDownList)Course_Gridview.Rows[rowIndex].Cells[1].FindControl("CourseList");
                    TextBox marks = (TextBox)Course_Gridview.Rows[rowIndex].Cells[2].FindControl("EnterMark");

                    courseList.Text = dt.Rows[i]["Column1Course"].ToString();
                    marks.Text = dt.Rows[i]["Column2Course"].ToString();

                    rowIndex++;
                }
            }
        }
    }

    //---------------------------------------//

    //---------PROGRAM GRIDVIEW CODE---------//
    private void SetInitialProgram()
    {
        //Create DataTable
        DataTable dt = new DataTable();
        DataRow dr = null;

        //Add initail values to DataTable
        dt.Columns.Add(new DataColumn("RowNumberProgram", typeof(string)));
        dt.Columns.Add(new DataColumn("Column1Program", typeof(string)));

        dr = dt.NewRow();
        dr["RowNumberProgram"] = 1;
        dr["Column1Program"] = string.Empty;

        dt.Rows.Add(dr);
        dr = dt.NewRow();

        //Store the DataTable in ViewState
        ViewState["CurrentTableProgram"] = dt;
        Program_GridView.DataSource = dt;
        Program_GridView.DataBind();

    }

    private void AddNewRowToProgram()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTableProgram"] != null)
        {
            //create new datatable, cast datatable of viewstate
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTableProgram"];
            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    //extract the values
                    DropDownList programList = (DropDownList)Program_GridView.Rows[rowIndex].Cells[1].FindControl("ProgramList");


                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumberProgram"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Column1Program"] = programList.Text;


                    rowIndex++;
                }

                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["CurrentTableProgram"] = dtCurrentTable;

                Program_GridView.DataSource = dtCurrentTable;
                Program_GridView.DataBind();
            }
        }

        else
        {
            Response.Write("ViewState is null");
        }
        //Set Previous Data on Postbacks
        SetPreviousProgramData();

    }

    private void SetPreviousProgramData()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTableProgram"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTableProgram"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList programList = (DropDownList)Program_GridView.Rows[rowIndex].Cells[1].FindControl("ProgramList");

                    programList.Text = dt.Rows[i]["Column1Program"].ToString();
                    rowIndex++;
                }
            }
        }
    }
    //---------------------------------------//

    //---------DEGREE GRIDVIEW CODE----------//
    private void SetInitialDegree()
    {
        //Create DataTable
        DataTable dt = new DataTable();
        DataRow dr = null;

        //Add initail values to DataTable
        dt.Columns.Add(new DataColumn("RowNumberDegree", typeof(string)));
        dt.Columns.Add(new DataColumn("Column1Degree", typeof(string)));

        dr = dt.NewRow();
        dr["RowNumberDegree"] = 1;
        dr["Column1Degree"] = string.Empty;

        dt.Rows.Add(dr);
        dr = dt.NewRow();

        //Store the DataTable in ViewState
        ViewState["CurrentTableDegree"] = dt;
        DegreeList_GridView.DataSource = dt;
        DegreeList_GridView.DataBind();
    }

    private void AddNewRowToDegree()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTableDegree"] != null)
        {
            //create new datatable, cast datatable of viewstate
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTableDegree"];
            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    //extract the values
                    DropDownList degreeList = (DropDownList)DegreeList_GridView.Rows[rowIndex].Cells[1].FindControl("DegreeList");


                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumberDegree"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Column1Degree"] = degreeList.Text;


                    rowIndex++;
                }

                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["CurrentTableDegree"] = dtCurrentTable;

                DegreeList_GridView.DataSource = dtCurrentTable;
                DegreeList_GridView.DataBind();
            }
        }

        else
        {
            Response.Write("ViewState is null");
        }
        //Set Previous Data on Postbacks
        SetPreviousDegreeData();

    }

    private void SetPreviousDegreeData()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTableDegree"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTableDegree"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList degreeList = (DropDownList)DegreeList_GridView.Rows[rowIndex].Cells[1].FindControl("DegreeList");

                    degreeList.Text = dt.Rows[i]["Column1Degree"].ToString();
                    rowIndex++;
                }
            }
        }
    }
    //---------------------------------------//


    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        MessageUserControl.TryRun(() =>
            {

                if (Course_Gridview.Rows.Count < 5)
                {
                    AddNewRowToCourse();
                }
                else
                {
                    throw new Exception("You cannot add more than 5 courses per program");
                }
            });
    }

    protected void SubmitProgram_Click(object sender, EventArgs e)
    {

        MessageUserControl.TryRun(() =>
       {
           // Variables
           string programName, credentialType, programLink, programLength;
           string errorList = "";
           int categoryID, temp;
           Uri tempUrl;
           bool workOutdoors, shiftWork, travel, activated, checkURL;

           //Validate non-string variables
           //Po
           bool result = int.TryParse(ProgramLength.Text.Trim(), out temp);
           if (!result)
           {
               errorList += "- Please enter a numeric value into the program length field (whole number only).\\n";
           }
           if (temp != 0)
           {
               if ((int.Parse(ProgramLength.Text)) < 0 || (int.Parse(ProgramLength.Text)) > 100)
               {
                   errorList += "- Program length must be a whole number between 1 - 99.\\n";
               }
           }

           //Validate URL
           result = Uri.TryCreate(ProgramLink.Text, UriKind.Absolute, out tempUrl) && tempUrl.Scheme == Uri.UriSchemeHttp;
           if (!result)
           {
               errorList += "- Please enter a properly formatted URL (ex. http://www.example.com).\\n";
           }

           PathwaysController controller = new PathwaysController();

           //Validate field lengths
           if (ProgramName.Text.Trim().Length > 100)
           {
               errorList += "- Program Name cannot exceed 100 characters. \\n";
           }

           if (ProgramLink.Text.Trim().Length > 150)
           {
               errorList += "- Program Link cannot exceed 150 characters. \\n";
           }

           //check to see if program name exists
           //Po
           result = controller.CheckProgramName(ProgramName.Text.Trim());
           //verify the name does not exist
            if (result == false)
            {
                errorList += "- The Program Name selected currently exists in the system, and cannot be repeated.\\n";
            }



           // Get values from page
           //Po
           programName = ProgramName.Text.Trim();
           credentialType = CredentialType.SelectedValue;
           programLink = ProgramLink.Text.Trim();
           programLength = ProgramLength.Text.Trim() + " " + ProgramLengthDDL.SelectedValue;
           workOutdoors = WorkOutdoors.Checked;
           shiftWork = ShiftWork.Checked;
           travel = Travel.Checked;
           activated = Activated.Checked;
           categoryID = int.Parse(CategoryList.SelectedValue);



           if (credentialType == "Degree")
           {
               //verify the URL does not exist 
               checkURL = controller.CheckDegUrl(programLink);
               if (checkURL == false)
               {
                   errorList += "- The url selected currently exists in the system, and cannot be repeated.\\n";
               }

               // Make a list for entering degree pathway information
               List<int> diplomaIDs = new List<int>();
               Degree degreeProgram = new Degree();

               // Populate a new degree
               degreeProgram.DegreeName = programName;
               degreeProgram.DegreeLink = programLink;
               degreeProgram.DegreeLength = programLength;
               degreeProgram.Activated = activated;
               degreeProgram.WorkOutdoors = workOutdoors;
               degreeProgram.WorkTravel = travel;
               degreeProgram.ShiftWork = shiftWork;
               degreeProgram.CategoryID = categoryID;

               int numOfRows = Program_GridView.Rows.Count;

               if (numOfRows != 0)
               {
                   //gather data from the degree pathway gridview for processing
                   foreach (GridViewRow row in Program_GridView.Rows)
                   {
                       // Find controls in the Gridview
                       int diplomaID = int.Parse((row.FindControl("ProgramList") as DropDownList).SelectedValue);
                       diplomaIDs.Add(diplomaID);
                   }
               }

               int index = 0;
               diplomaIDs.Sort();
               bool flagDip = true;
               while (index < diplomaIDs.Count - 1 && flagDip == true)
               {
                   if (diplomaIDs[index] == diplomaIDs[index + 1])
                   {
                       errorList += "- Diploma pathways cannot appear more than once.\\n";
                       flagDip = false;
                   }
                   else
                   {
                       index++;
                   }
               }

               if (errorList != "")
               {
                   throw new Exception(errorList);
               }

               //Insert the entry
               controller.InsertDegreeProgram(degreeProgram, diplomaIDs);
               ClearFields();
               Response.Write("<script type=\"text/javascript\">alert('Entry has been inserted.');</script>");
               //Hide panels 
               ShowCoursesView.Checked = false;
               ShowDipPathView.Checked = false;
               ShowDegPathView.Checked = false;
               entrance_req.Visible = false;
               degree_link.Visible = false;
               degree_pathways.Visible = false;

           }

           if (credentialType == "Diploma")
           {
               //verify the URL does not exist 
               checkURL = controller.CheckDipCertUrl(programLink);
               if (checkURL == false)
               {
                   errorList += "- The url selected currently exists in the system, and cannot be repeated.\\n";
               }
               //validate field length
               if (EntReqDetail.Text.Length > 150)
               {
                   errorList += "- Entrance Requirement Details cannot exceed 150 characters. \\n";
               }

               //check coompetitive advantage
               //Po
               result = int.TryParse(CompetitiveAdv.Text.Trim(), out temp);
               if (!result)
               {
                   errorList += "- Please enter a numeric value into the competitive advantage field (whole number only).\\n";
               }
               if (temp != 0)
               {
                   if ((int.Parse(CompetitiveAdv.Text)) < 0 || (int.Parse(CompetitiveAdv.Text)) > 100)
                   {
                       errorList += "- Competitive advantage must be a whole number between 1 - 99.\\n";
                   }
               }
               // get other required data
               byte competitiveAdvantage = byte.Parse(CompetitiveAdv.Text);
               string entReqDetail = EntReqDetail.Text;

               DiplomaCertificate diploma = new DiplomaCertificate();

               // Populate a new diploma
               diploma.ProgramName = programName;
               diploma.ProgramLink = programLink;
               diploma.ProgramLength = programLength;
               diploma.Activated = activated;
               diploma.WorkOutdoors = workOutdoors;
               diploma.WorkTravel = travel;
               diploma.ShiftWork = shiftWork;
               diploma.CategoryID = categoryID;
               diploma.CredentialType = true;
               diploma.CompetitveAdvantage = competitiveAdvantage;
               diploma.EntranceRequirementDetail = entReqDetail;

               // Make a list for entering entrance requirement information
               List<EntranceRequirementList> entranceReqList = new List<EntranceRequirementList>();


               if (ShowCoursesView.Checked)
               {
                   // Gather data from course gridview for processing items
                   foreach (GridViewRow row in Course_Gridview.Rows)
                   {
                       // Find controls in the Gridview
                       //Po
                       int courseID = int.Parse((row.FindControl("CourseList") as DropDownList).SelectedValue);
                       byte mark;
                       result = byte.TryParse(((row.FindControl("EnterMark") as TextBox).Text.Trim()), out mark);
                       if (!result)
                       {
                           errorList += "- Marks entered must be numeric values (whole numbers greater than 0). \\n";
                       }
                       if (mark > 100 || mark < 0)
                       {
                           errorList += "- Marks entered must whole numbers between 1 - 99. \\n";
                       }

                       entranceReqList.Add(new EntranceRequirementList()
                       {
                           CourseID = courseID,
                           Mark = mark
                       });
                   }
               }
               List<int> courseIds = new List<int>();
               foreach (EntranceRequirementList item in entranceReqList)
               {
                   courseIds.Add(item.CourseID);
               }

               courseIds.Sort();
               int index = 0;
               bool flag = true;
               while (index < entranceReqList.Count - 1 && flag == true)
               {
                   if (courseIds[index] == courseIds[index + 1])
                   {
                       errorList += "- Courses in entrance requirements cannot appear more than once.\\n";
                       flag = false;
                   }
                   else
                   {
                       index++;
                   }
               }

               int numOfRows = DegreeList_GridView.Rows.Count;
               List<int> degreeIDs = new List<int>();
               if (numOfRows != 0)
               {
                   //gather data from the degree pathway gridview for processing
                   foreach (GridViewRow row in DegreeList_GridView.Rows)
                   {
                       // Find controls in the Gridview
                       int degreeID = int.Parse((row.FindControl("DegreeList") as DropDownList).SelectedValue);
                       if (degreeID != 0)
                       {
                           degreeIDs.Add(degreeID);
                       }
                   }

               }

               degreeIDs.Sort();
               bool flagDeg = true;
               while (index < degreeIDs.Count - 1 && flagDeg == true)
               {
                   if (degreeIDs[index] == degreeIDs[index + 1])
                   {
                       errorList += "- Degree pathways cannot appear more than once.\\n";
                       flagDeg = false;
                   }
                   else
                   {
                       index++;
                   }
               }

               if (errorList != "")
               {
                   throw new Exception(errorList);
               }

               //Insert the entry
               controller.InsertDiplomaProgram(diploma, entranceReqList, degreeIDs);
               ClearFields();
               Response.Write("<script type=\"text/javascript\">alert('Entry has been inserted.');</script>");
               //Hide panels 
               ShowCoursesView.Checked = false;
               ShowDipPathView.Checked = false;
               ShowDegPathView.Checked = false;
               entrance_req.Visible = false;
               degree_link.Visible = false;
               degree_pathways.Visible = false;
           }

           if (credentialType == "Certificate")
           {
               //verify the URL does not exist 
               checkURL = controller.CheckDipCertUrl(programLink);
               if (checkURL == false)
               {
                   errorList += "- The url selected currently exists in the system, and cannot be repeated.\\n";
               }
               //validate field length
               if (EntReqDetail.Text.Length > 150)
               {
                   errorList += "- Entrance Requirement Details cannot exceed 150 characters. \\n";
               }
               byte competitiveAdvantage;
               //Po
               result = byte.TryParse(CompetitiveAdv.Text.Trim(), out competitiveAdvantage);
               if (!result)
               {
                   errorList += "- Please enter a numeric value into the competitive advantage field (whole numbers greater than zero only).\\n";
               }

               if (competitiveAdvantage < 0 || competitiveAdvantage > 100)
               {
                   errorList += "- Please enter a numeric value between 1 - 99. \\n";
               }
               //check coompetitive advantage
               //po
               result = int.TryParse(CompetitiveAdv.Text.Trim(), out temp);
               if (!result)
               {
                   errorList += "- Please enter a numeric value into the competitive advantage field (whole number only).\\n";
               }
               if (temp != 0)
               {
                   if ((int.Parse(CompetitiveAdv.Text)) < 0 || (int.Parse(CompetitiveAdv.Text)) > 100)
                   {
                       errorList += "- Competitive advantage must be a whole number between 1 - 99.\\n";
                   }
               }
               string entReqDetail = EntReqDetail.Text;


               DiplomaCertificate certificate = new DiplomaCertificate();
               // Populate a new certificate
               certificate.ProgramName = programName;
               certificate.ProgramLink = programLink;
               certificate.ProgramLength = programLength;
               certificate.Activated = activated;
               certificate.WorkOutdoors = workOutdoors;
               certificate.WorkTravel = travel;
               certificate.ShiftWork = shiftWork;
               certificate.CategoryID = categoryID;
               certificate.CredentialType = false;
               certificate.CompetitveAdvantage = competitiveAdvantage;
               certificate.EntranceRequirementDetail = entReqDetail;

               // Make a list for entering entrance requirement information
               List<EntranceRequirementList> entranceReqList = new List<EntranceRequirementList>();
               if (ShowCoursesView.Checked)
               {
                   // Gather data from course gridview for processing items
                   foreach (GridViewRow row in Course_Gridview.Rows)
                   {
                       // Find controls in the Gridview
                       int courseID = int.Parse((row.FindControl("CourseList") as DropDownList).SelectedValue);
                       byte mark;
                       result = byte.TryParse(((row.FindControl("EnterMark") as TextBox).Text.Trim()), out mark);
                       if (!result)
                       {
                           errorList += "- Marks entered must be numeric values (whole numbers greater than 0). \\n";
                       }
                       if (mark > 100 || mark < 0)
                       {
                           errorList += "- Marks entered must whole numbers between 1 - 99. \\n";
                       }

                       entranceReqList.Add(new EntranceRequirementList()
                       {
                           CourseID = courseID,
                           Mark = mark
                       });
                   }
                   List<int> courseIds = new List<int>();
                   foreach (EntranceRequirementList item in entranceReqList)
                   {
                       courseIds.Add(item.CourseID);
                   }

                   courseIds.Sort();
                   int index = 0;
                   bool flag = true;
                   while (index < entranceReqList.Count - 1 && flag == true)
                   {
                       if (courseIds[index] == courseIds[index + 1])
                       {
                           errorList += "- Courses in entrance requirements cannot appear more than once.\\n";
                           flag = false;
                       }
                       else
                       {
                           index++;
                       }
                   }
               }

               if (errorList != "")
               {
                   throw new Exception(errorList);
               }

               //Insert the entry
               controller.InsertCertificateProgram(certificate, entranceReqList);
               ClearFields();
               Response.Write("<script type=\"text/javascript\">alert('Entry has been inserted.');</script>");
               //Hide panels 
               ShowCoursesView.Checked = false;
               ShowDipPathView.Checked = false;
               ShowDegPathView.Checked = false;
               entrance_req.Visible = false;
               degree_link.Visible = false;
               degree_pathways.Visible = false;
           }
       });
    }

    protected void CredentialType_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (CredentialType.SelectedValue)
        {
            case "Diploma":
                {
                    entrance_req.Visible = true;
                    degree_link.Visible = false;
                    degree_pathways.Visible = true;
                }
                break;
            case "Certificate":
                {
                    entrance_req.Visible = true;
                    degree_link.Visible = false;
                    degree_pathways.Visible = false;
                }
                break;
            case "Degree":
                {
                    entrance_req.Visible = false;
                    degree_link.Visible = true;
                    degree_pathways.Visible = false;
                }
                break;
            default:
                {
                    entrance_req.Visible = false;
                    degree_link.Visible = false;
                    degree_pathways.Visible = false;
                }
                break;
        }
    }
    protected void ProgramAdd_Click(object sender, EventArgs e)
    {
        AddNewRowToProgram();
    }
    protected void DegreeAdd_Click(object sender, EventArgs e)
    {
        AddNewRowToDegree();
    }

    protected void ClearFields()
    {

        ProgramName.Text = "";
        CredentialType.SelectedIndex = 0;
        ProgramLink.Text = "";
        ProgramLength.Text = "";
        ProgramLengthDDL.SelectedIndex = 0;
        WorkOutdoors.Checked = false;
        ShiftWork.Checked = false;
        Travel.Checked = false;
        Activated.Checked = false;
        CompetitiveAdv.Text = "";
        EntReqDetail.Text = "";
        CategoryList.SelectedIndex = 0;
        ShowCoursesView.Checked = false;
        ShowDipPathView.Checked = false;
        ShowDegPathView.Checked = false;

        Course_Gridview.DataBind();
        SetInitialCourse();
        Program_GridView.DataBind();
        SetInitialProgram();
        DegreeList_GridView.DataBind();
        SetInitialDegree();
    }
    protected void ShowCoursesView_CheckedChanged(object sender, EventArgs e)
    {
        if (ShowCoursesView.Checked)
        {
            Course_Gridview.Visible = true;
        }
        else
        {
            SetInitialCourse();
            Course_Gridview.Visible = false;
        }
    }
    protected void ShowDipPathView_CheckedChanged(object sender, EventArgs e)
    {
        if (ShowDipPathView.Checked)
        {
            Program_GridView.Visible = true;
        }
        else
        {
            SetInitialProgram();
            Program_GridView.Visible = false;
        }
    }
    protected void ShowDegPathView_CheckedChanged(object sender, EventArgs e)
    {
        if (ShowDegPathView.Checked)
        {
            DegreeList_GridView.Visible = true;
        }
        else
        {
            SetInitialDegree();
            DegreeList_GridView.Visible = false;
        }
    }

    protected void ButtonSubtract_Click(object sender, EventArgs e)
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
                    DropDownList courseList = (DropDownList)Course_Gridview.Rows[rowIndex].Cells[1].FindControl("CourseList");
                    TextBox marks = (TextBox)Course_Gridview.Rows[rowIndex].Cells[2].FindControl("EnterMark");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumberCourse"] = i;

                    dtCurrentTable.Rows[i - 1]["Column1Course"] = courseList.Text;
                    dtCurrentTable.Rows[i - 1]["Column2Course"] = marks.Text;

                    rowIndex++;
                }

                dtCurrentTable.Rows[rowIndex - 1].Delete();

                ViewState["CurrentTableCourse"] = dtCurrentTable;

                Course_Gridview.DataSource = dtCurrentTable;
                Course_Gridview.DataBind();

                SetPreviousCourseData();
            }

            
        }


    }

    protected void DiplomaRemove_Click(object sender, EventArgs e)
    {
        if (ViewState["CurrentTableProgram"] != null)
        {
            //create new datatable, cast datatable of viewstate
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTableProgram"];
            DataRow drCurrentRow = null;

            int rowIndex = 0;

            if (dtCurrentTable.Rows.Count > 1)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    //extract the values
                    DropDownList programList = (DropDownList)Program_GridView.Rows[rowIndex].Cells[1].FindControl("ProgramList");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumberProgram"] = i;

                    dtCurrentTable.Rows[i - 1]["Column1Program"] = programList.Text;

                    rowIndex++;
                }

                dtCurrentTable.Rows[rowIndex - 1].Delete();

                ViewState["CurrentTableProgram"] = dtCurrentTable;

                Program_GridView.DataSource = dtCurrentTable;
                Program_GridView.DataBind();

                SetPreviousProgramData();
            }


        }
    }
    protected void DegreeRemove_Click(object sender, EventArgs e)
    {
        //create new datatable, cast datatable of viewstate
        DataTable dtCurrentTable = (DataTable)ViewState["CurrentTableDegree"];
        DataRow drCurrentRow = null;

        int rowIndex = 0;

        if (dtCurrentTable.Rows.Count > 1)
        {
            for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
            {
                //extract the values
                DropDownList degreeList = (DropDownList)DegreeList_GridView.Rows[rowIndex].Cells[1].FindControl("DegreeList");

                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["RowNumberDegree"] = i;

                dtCurrentTable.Rows[i - 1]["Column1Degree"] = degreeList.Text;

                rowIndex++;
            }

            dtCurrentTable.Rows[rowIndex - 1].Delete();

            ViewState["CurrentTableProgram"] = dtCurrentTable;

            DegreeList_GridView.DataSource = dtCurrentTable;
            DegreeList_GridView.DataBind();

            SetPreviousDegreeData();
        }
    }
}