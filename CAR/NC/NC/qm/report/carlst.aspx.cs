using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NC.qm.report
{
    public partial class carlst : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["carcnstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGrv();
                //lblNoData.Text = "";
            }
        }

        public void BindingGrv()
        {
            using (SqlConnection con = new SqlConnection(cnstr))
            {
                con.Open();
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "GetCarOpen";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();

                        dt.Load(reader);


                        grv1.DataSource = dt;
                        grv1.DataBind();
                        lblNoData.Text = "";
                    }
                }
            }
        }

        public void SearchCarNo()
        {
            string searchTerm = txtSearch.Text.Trim(); // ตัดเว้นวรรคออกจากข้อมูลที่ค้นหา
            using (SqlConnection con = new SqlConnection(cnstr))
            {
                con.Open();
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SearchCarNo";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@KeyWord", searchTerm);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            grv1.DataSource = dt;
                            grv1.DataBind();
                            lblNoData.Text = "";
                        }
                        else
                        {
                            // ไม่พบข้อมูล ให้ล้าง GridView และแสดงข้อความ
                            grv1.DataSource = null; // ล้าง DataSource
                            grv1.DataBind(); // ล้างข้อมูลใน GridView
                            //Response.Write("ไม่พบข้อมูล");                                                    
                            lblNoData.Text = "ไม่พบข้อมูลที่ค้นหา !";
                        }
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text == "")
            {
                BindingGrv();
            }
            else
            {
                SearchCarNo();
            }

        }
    }
}