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
    public partial class ncstatus : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["carcnstr"].ConnectionString;
        string Thisyear = DateTime.Now.Year.ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGrv1(Thisyear);
                YearDropdown();
                //lblToday.Text = DateTime.Now.ToString();
                lblToday.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
            }

            
        }

        public void YearDropdown()
        {
            // เพิ่มรายการปีปัจจุบันลงใน DropDownList
            int currentYear = DateTime.Now.Year;
            ListItem currentYearItem = new ListItem(currentYear.ToString(), currentYear.ToString());
            ddlYear.Items.Add(currentYearItem);

            // เพิ่มรายการปีตั้งแต่ปีปัจจุบันไปจนถึงปี 2005
            for (int year = currentYear - 1; year >= 2005; year--)
            {
                ListItem yearItem = new ListItem(year.ToString(), year.ToString());
                ddlYear.Items.Add(yearItem);
            }
        }

       
        private void BindingGrv1(string intyear)
        {
           
            using (SqlConnection con = new SqlConnection(cnstr))
            {
                con.Open();
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SumCar";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@year", intyear);
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //BindingGrv1(ddlYear.SelectedValue);
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindingGrv1(ddlYear.SelectedValue);
            lblToday.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
        }

    }
}