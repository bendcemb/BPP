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
    public partial class docsch : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindingGridview();
            }
        }

        private void BindingGridview()
        {
            string strDoc_Qm = Request.QueryString["key"];

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("GetDocumentByDocCode", con))
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Doc_Code", strDoc_Qm);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv1.DataSource = dt;
                    grv1.DataBind();

                }

            }
        }

        private void SearchDocument()
        {
            string strSearch = txtSearch.Text;
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SearchDocByDocName", con))
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Doc_Code", strSearch);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv1.DataSource = dt;
                    grv1.DataBind();

                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchDocument();
        }

        protected void grv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grv1.PageIndex = e.NewPageIndex;
            SearchDocument();
        }
    }
}