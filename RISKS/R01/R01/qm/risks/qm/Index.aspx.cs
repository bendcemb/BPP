using Microsoft.Ajax.Utilities;
using R01.report.doccenter.tp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.qm.risks.qm
{
    public partial class Index : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGridview1();
                BindingGridview2();

                // เรียกใช้ JavaScript เพื่อเปิดแท็บ Tab1 เมื่อหน้าเว็บโหลด
                string script = "<script>openTab(event, 'Tab1');</script>";
                ScriptManager.RegisterStartupScript(this, GetType(), "OpenTabScript", script, false);

            }
        }

        private void BindingGridview1()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("GetStatusApprove", con))
                {
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv1.DataSource = dt;
                    grv1.DataBind();

                }
            }
        }

        private void BindingGridview2()
        {
           
            string strDraft = "SELECT TOP (1000) [pproceduregrp] ,[proceduregrpname] ,[username] ,[createdate] ,[editname] ,[editdate] ,[void] FROM [qmdocsql].[dbo].[Q601proceduregrp]";
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(strDraft, con))
                {
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv2.DataSource = dt;
                    grv2.DataBind();

                }
            }
        }

        
        protected string GetLinkText(object uidproc)
        {
            return (uidproc == null || uidproc == DBNull.Value || string.IsNullOrEmpty(uidproc.ToString())) ? "link" : uidproc.ToString();
        }

        protected string GetNavigateUrl(object uidproc)
        {
            //ถ้าไม่มีข้อมูลให้แสดงเป็น link ไปที่ q0702.aspx
            if (uidproc == null || uidproc == DBNull.Value || string.IsNullOrEmpty(uidproc.ToString()))
            {
                return "/qm/risks/q0702.aspx?key=" + Eval("pprocedure").ToString();

            }
            else
            {
                //ถ้ามีข้อมูลให้แสดงเป็นข้อมูลและ link ไปที่ docid.aspx
                return "/report/doccenter/tp/docid.aspx?id=" + Eval("uidproc").ToString();


            }
        }

        protected string GetLinkText2(object uidrisk)
        {
            return (uidrisk == null || uidrisk == DBNull.Value || string.IsNullOrEmpty(uidrisk.ToString())) ? "link" : uidrisk.ToString();
        }

        protected string GetNavigateUrl2(object uidrisk)
        {
            if (uidrisk == null || uidrisk == DBNull.Value || string.IsNullOrEmpty(uidrisk.ToString()))
            {
                return "/q0701.aspx?id=" + Eval("pprocedure").ToString();

            }
            else
            {

                return "/report/doccenter/tp/docid.aspx?id=" + Eval("uidrisk").ToString();
            }
        }
    }
}