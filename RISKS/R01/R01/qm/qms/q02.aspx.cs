using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.qm.qms
{
    public partial class q02 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGrv();
                BindingTable();
            }
        }

        private void BindingTable()
        {
            string strqury = Request.QueryString["item"];
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT TOP (1000) [ctcode] ,[ctname] FROM [qmdocsql].[dbo].[Q21501] WHERE ctcode = @ctcode";
                    cmd.Parameters.AddWithValue("@ctcode", strqury);
                    cmd.ExecuteNonQuery();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);



                        string strctcode = "";
                        string strctname = "";
                       

                        foreach (DataRow row in dt.Rows)
                        {
                            strctcode += row["ctcode"].ToString() + " ";
                            strctname += row["ctname"].ToString() + " "; // แทน "columnName" ด้วยชื่อคอลัมน์ที่ต้องการแสดง
                        }

                        lblitem.Text = strctcode;
                        lblctname.Text = strctname;
                    
                    }

                }
            }
        }

        

        private void BindingGrv()
        {
            string strqury = Request.QueryString["item"];
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT TOP (100) [ctcode] ,[ctitem] ,[cttype] ,[ctissue] ,[ctrisk] ,[ctopportunity] ,[ctconcern] " +
                                      "FROM [qmdocsql].[dbo].[Q21502] WHERE ctcode = @ctcode";
                    cmd.Parameters.AddWithValue("@ctcode", strqury);
                 
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        grv1.DataSource = dt;
                        grv1.DataBind();
                    }
                       
                }
            }
        }
    }
}