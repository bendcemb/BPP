using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.SqlServer.Server;

namespace R01.qm.proc
{
    public partial class p02 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGrv1();

            }
        }

        private void BindingGrv1()
        {
            string strrefno = Request.QueryString["refno"];
            string strid = Request.QueryString["id"];
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();

                using (SqlCommand cmd1 = new SqlCommand("GetP02_1", con))
                {
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@refno", strrefno);
                    cmd1.ExecuteNonQuery();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd1))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand("GetP02", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@refno", strrefno);
                    cmd.Parameters.AddWithValue("@pid", strid);
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv2.DataSource = dt;
                    grv2.DataBind();

                   
                    //SqlDataReader reader = cmd.ExecuteReader();
                    //if (reader.Read())
                    //{
                    //    lblpurpose.Text = reader["purpose"].ToString();
                    //}
                    //reader.Close();

                }

                string strquery2 = "SELECT TOP (1000) [id] ,[item] ,[itemdesc] ,[docdesc] " +
                                   "FROM [qmdocsql].[dbo].[proc03]" +
                                   " WHERE id = @id" +
                                   " AND fromid IS NULL";

                

                using (SqlCommand cmd = new SqlCommand(strquery2, con))
                {
                   
                    cmd.Parameters.AddWithValue("@id", strid);
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv1.DataSource = dt;
                    grv1.DataBind();
                }
            }
        }
    }
}