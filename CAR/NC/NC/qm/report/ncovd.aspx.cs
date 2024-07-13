using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace NC.qm.report
{
    public partial class ncovd : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["carcnstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGrv();
            }
        }

        public void BindingGrv()
        {
            using (SqlConnection con = new SqlConnection(cnstr))
            {
                con.Open();
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "GetCarOverdue";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();

                        dt.Load(reader);


                        grv1.DataSource = dt;
                        grv1.DataBind();
                        
                    }
                }
            }
        }
    }
}