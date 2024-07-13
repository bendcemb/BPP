using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.qm.risks
{
    public partial class q0702 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        string strsp = "GetQ0702_1";
        string strsp2 = "GetQ0702_2";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindingGrv();
            }
        }

        private void BindingGrv()
        {
            string strquery = Request.QueryString["key"];
            using(SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using(SqlCommand cmd = new SqlCommand(strsp, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pprocedure", strquery);                 
                    using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        grv1.DataSource = dt;
                        grv1.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand(strsp2, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pprocedure", strquery);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        grv2.DataSource = dt;
                        grv2.DataBind();
                    }
                }
            }
        }

        protected string GetStatusText(object docstate)
        {
            if (docstate != null)
            {
                int state = Convert.ToInt32(docstate);
                if (state == 0)
                {
                    return "ฉบับร่าง";
                }
                else if (state == 1)
                {
                    return "ขึ้นทะเบียนแล้ว";
                }
            }
            return string.Empty;
        }

    }
}