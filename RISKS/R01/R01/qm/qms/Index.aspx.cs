using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.qm.qms
{
    public partial class Index : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) 
            {
                BindingGrv();
            }
        }

        private void BindingGrv()
        {
            using(SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using(SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT TOP (100) [ctcode] ,[ctname] FROM [qmdocsql].[dbo].[Q21501]";
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