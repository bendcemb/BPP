using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.report.qm
{
    public partial class docqmhist : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        string spHist = "GetDocHistByDoc_Code";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGrv1();
                lblCode.Text = Request.QueryString["code"];
            }
        }



        private void BindingGrv1()
        {
            string query = Request.QueryString["code"];
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(spHist, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Doc_Code", query);
                    //cmd.ExecuteNonQuery();
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