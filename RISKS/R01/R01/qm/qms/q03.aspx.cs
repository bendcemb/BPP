using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace R01.qm.qms
{
    public partial class q03 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
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
                    cmd.CommandText = "SELECT TOP (100) A.[ctcode] ,[ctitem] ,[cttype] ,[ctissue] ,[ctrisk] ,[ctopportunity] ,[ctconcern] ,B.[ctcode] ,B.[ctname] " + 
                                      "FROM[qmdocsql].[dbo].[Q21502] A " +
                                      "JOIN [qmdocsql].[dbo].[Q21501] B " +
                                      "ON A.ctcode = B.ctcode " +
                                      "WHERE ctitem = @ctitem";

                    cmd.Parameters.AddWithValue("@ctitem", strqury);
                    cmd.ExecuteNonQuery();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        grv1.DataSource = dt;
                        grv1.DataBind();

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
    }
}