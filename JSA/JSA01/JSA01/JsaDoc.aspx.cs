using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JSA01
{
    public partial class JsaDoc : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
        string getJsaDoc =
               "SELECT TOP(1000) [jsa_doc_id]" +
               ",[approval_date]" +
               ",[section_id]" +
               ",[create_by]" +
               ",[status]" +
               ",[note]" +
               ",[create_date]" +
               ",[edit_date]" +
               "FROM[BPP].[dbo].[jsa_doc]" +
               "WHERE [status] = 1";

        string approv_status_no =
               "SELECT TOP(1000) [jsa_doc_id]" +
               ",[approval_date]" +
               ",[section_id]" +
               ",[create_by]" +
               ",[status]" +
               ",[note]" +
               ",[create_date]" +
               ",[edit_date]" +
               "FROM[BPP].[dbo].[jsa_doc]" +
               "WHERE [status] = 0";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindingGrv1();

            }
        }

        private void BindingGrv1()
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                conn.Open();

               
                using (SqlCommand cmd = new SqlCommand(getJsaDoc, conn))
                {
                    cmd.CommandText = getJsaDoc;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv1.DataSource = dt;
                    grv1.DataBind();

                }

                using (SqlCommand cmd = new SqlCommand(approv_status_no, conn))
                {
                    cmd.CommandText = approv_status_no;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv2.DataSource = dt;
                    grv2.DataBind();

                }
            }
        }

    }
}