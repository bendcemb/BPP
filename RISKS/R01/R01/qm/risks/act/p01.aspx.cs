using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Principal;
using R01.report.doccenter.tp;

namespace R01.qm.risks.act
{
    public partial class p01 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGridview1();
                NewDocId();
                BindingDDL();
            }          
        }

        private void BindingGridview1()
        {
            string strDraft = "SELECT TOP (1000) [pproceduregrp] ,[proceduregrpname] ,[username] ,[createdate] ,[editname] ,[editdate] ,[void] FROM [qmdocsql].[dbo].[Q601proceduregrp] WHERE pproceduregrp = @pproceduregrp";
            string strpproceduregrp = Request.QueryString["key"];
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(strDraft, con))
                {
                    cmd.Parameters.AddWithValue("@pproceduregrp", strpproceduregrp);
                    cmd.CommandType = CommandType.Text;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv1.DataSource = dt;
                    grv1.DataBind();

                }

                using (SqlCommand cmd = new SqlCommand("R01_GetProcedureDetail", con))
                {
                    cmd.Parameters.AddWithValue("@pproceduregrp", strpproceduregrp);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv2.DataSource = dt;
                    grv2.DataBind();

                }

              
            }
        }

        private void NewDocId()
        {
            string strKey = Request.QueryString["key"];

            using(SqlConnection con = new SqlConnection(conn))
            {
                con.Open() ;
                using(SqlCommand cmd = new SqlCommand("Newpproceduregrp", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pproceduregrp", strKey);
                    using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            pprocedure.Text = dt.Rows[0]["Newpprocedure"].ToString(); // แทน ColumnName ด้วยชื่อคอลัมน์ที่ต้องการใช้ในการแสดงผล
                        }
                        else
                        {
                            pprocedure.Text = "No Data Found";
                        }
                    }
                }
            }
        }

        protected void grv2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // เช็คค่า editdate ว่าเป็นค่า null หรือไม่
                if (DataBinder.Eval(e.Row.DataItem, "editdate") == DBNull.Value)
                {
                    // ถ้า editdate เป็น null ให้แสดงข้อมูลของ createdate แทน
                    e.Row.Cells[12].Text = DataBinder.Eval(e.Row.DataItem, "createdate", "{0:dd/MM/yyyy HH:mm}").ToString();
                }
            }
        }

        protected string GetEditUrl(object procedure, object docstate)
        {
            if (docstate.ToString() == "0")
            {
                return "/qm/risks/qm/r01.aspx?key=" + procedure.ToString();
            }
            else
            {
                return "javascript:void(0);"; // หรือใช้ URL ที่ต้องการสำหรับสถานะเอกสารที่ไม่ใช่ 0
            }
        }

        private void InsertDoc()
        {
            string strpprocedure = pprocedure.Text;

            string strprocedurename = procedurename.Text;
            string strusername = WindowsIdentity.GetCurrent().Name;

            string streditname = WindowsIdentity.GetCurrent().Name;

            int strvoid = 0;
            string strpproceduregrp = Request.QueryString["key"];
            int strdocstate = 0;
            string strproccode = "";
            string strprocrev = "";
            string strapprovedate = approvedate.Text;
            string struidproc = "";
            string struidrisk = "";
            string strowner = "";
            string strpossessor = "";
            string strpremark = premark.Text;

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("R01_InsertProcedure", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@pprocedure", SqlDbType.NVarChar, 50).Value = strpprocedure;
                    cmd.Parameters.Add("@procedurename", SqlDbType.NVarChar, 250).Value = strprocedurename;
                    cmd.Parameters.Add("@username", SqlDbType.NVarChar, 50).Value = strusername;
                    cmd.Parameters.Add("@editname", SqlDbType.NVarChar, 50).Value = streditname;
                    cmd.Parameters.Add("@void", SqlDbType.Int).Value = strvoid;


                    cmd.Parameters.Add("@pproceduregrp", SqlDbType.NVarChar, 50).Value = strpproceduregrp;
                    cmd.Parameters.Add("@docstate", SqlDbType.Int).Value = strdocstate;


                    cmd.Parameters.Add("@proccode", SqlDbType.NVarChar, 10).Value = strproccode;
                    cmd.Parameters.Add("@procrev", SqlDbType.NVarChar, 2).Value = strprocrev;
                    cmd.Parameters.Add("@approvedate", SqlDbType.NVarChar,50).Value = strapprovedate;

                    cmd.Parameters.Add("@uidproc", SqlDbType.NVarChar, 50).Value = struidproc;
                    cmd.Parameters.Add("@uidrisk", SqlDbType.NVarChar, 50).Value = struidrisk;
                    cmd.Parameters.Add("@owner", SqlDbType.NVarChar, 50).Value = strowner;
                    cmd.Parameters.Add("@possessor", SqlDbType.NVarChar, 150).Value = strpossessor;
                    cmd.Parameters.Add("@premark", SqlDbType.NVarChar, -1).Value = strpremark; // MAX


                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    // ตรวจสอบว่าข้อมูลถูกแทรกเข้าไปหรือไม่
                    if (rowsAffected > 0)
                    {
                        // ข้อมูลถูกแทรกเข้าไป
                        Response.Write("Data inserted successfully.");
                    }
                    else
                    {
                        // ไม่สามารถแทรกข้อมูลได้
                        Response.Write("Failed to insert data.");
                    }
                }
            }
           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertDoc();
        }

        private void BindingDDL()
        {
            using(SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT TOP (1000) [Job_Code] ,[Job_Name] ,[Dept] ,[it] ,[Job_Code] + ' ' + [Job_Name] AS JJ FROM [qmdocsql].[dbo].[Job]", con))
                {
                    using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        
                        ddlowner.DataSource = dt;
                        ddlowner.DataValueField = "Job_Code";
                        ddlowner.DataTextField = "JJ";
                        ddlowner.DataBind();


                        ddlpossessor.DataSource = dt;
                        ddlpossessor.DataValueField = "Job_Code";
                        ddlpossessor.DataTextField = "JJ";
                        ddlpossessor.DataBind();
                    }
                }
            }
        }
    }
}