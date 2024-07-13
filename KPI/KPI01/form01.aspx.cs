using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KPI01
{
    public partial class form01 : System.Web.UI.Page
    {
        string strConn = ConfigurationManager.ConnectionStrings["strConnKpi"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropdownlistMonthYear();
                BindGrid();
                GenreDDL();

            }
        }

        private void DropdownlistMonthYear()
        {
            // Get current year
            int currentYear = DateTime.Now.Year;

            // Loop from current year to 2017 and add items to DropDownList
            for (int year = currentYear; year >= 2017; year--)
            {
                ddlYear.Items.Add(new ListItem(year.ToString(), year.ToString()));
            }

            // Create ThaiCultureInfo for Thai language
            CultureInfo thaiCulture = new CultureInfo("th-TH");

            // Loop through each month and add items to DropDownList
            for (int month = 1; month <= 12; month++)
            {
                DateTime monthDate = new DateTime(1, month, 1);
                ddlMonth.Items.Add(new ListItem(monthDate.ToString("MMMM", thaiCulture), month.ToString()));
            }
        }

        private void BindGrid()
        {
            try
            {
                string strQuery = ddlYear.Text;
                //lblDepartment



                using (SqlConnection Con = new SqlConnection(strConn))
                {
                    using (SqlCommand cmd = new SqlCommand("GetKpi", Con))
                    {
                        Con.Open();
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@yr", strQuery);


                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                       

                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "An error occurred: " + ex.Message;
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                TextBox txtCurrentTarget = (TextBox)row.FindControl("txtCurrentTarget");
                TextBox txtM01 = (TextBox)row.FindControl("txtM01");
                TextBox txtM02 = (TextBox)row.FindControl("txtM02");
                TextBox txtM03 = (TextBox)row.FindControl("txtM03");
                TextBox txtM04 = (TextBox)row.FindControl("txtM04");
                TextBox txtM05 = (TextBox)row.FindControl("txtM05");
                TextBox txtM06 = (TextBox)row.FindControl("txtM06");
                TextBox txtM07 = (TextBox)row.FindControl("txtM07");
                TextBox txtM08 = (TextBox)row.FindControl("txtM08");
                TextBox txtM09 = (TextBox)row.FindControl("txtM09");
                TextBox txtM10 = (TextBox)row.FindControl("txtM10");
                TextBox txtM11 = (TextBox)row.FindControl("txtM11");
                TextBox txtM12 = (TextBox)row.FindControl("txtM12");

                // You can process the data here, such as saving to database
                string fieldName00 = txtCurrentTarget.Text;
                string fieldName01 = txtM01.Text;
                string fieldName02 = txtM02.Text;
                string fieldName03 = txtM03.Text;
                string fieldName04 = txtM04.Text;
                string fieldName05 = txtM05.Text;
                string fieldName06 = txtM06.Text;
                string fieldName07 = txtM07.Text;
                string fieldName08 = txtM08.Text;
                string fieldName09 = txtM09.Text;
                string fieldName10 = txtM10.Text;
                string fieldName11 = txtM11.Text;
                string fieldName12 = txtM12.Text;

                // Do something with fieldName and fieldValue
            }
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
            GenreDDL();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // ตรวจสอบว่าขณะนี้เราอยู่ในแถวของข้อมูลหรือไม่
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // ดึงค่า ID จากข้อมูลในแถวปัจจุบัน
                int id = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "kpi_id"));

                // ตรวจสอบว่า ID เท่ากับ 3 หรือไม่
                if (id == 3 || id == 19)
                {
                    // หาก ID เท่ากับ 3 ให้หา Control TextBox และปิดการใช้งาน
                    TextBox txtCurrentTarget = e.Row.FindControl("txtCurrentTarget") as TextBox;
                    Label lblBeforeTarget = e.Row.FindControl("lblBeforeTarget") as Label;
                    if (txtCurrentTarget != null || lblBeforeTarget != null)
                    {
                        txtCurrentTarget.Visible = false;
                        lblBeforeTarget.Visible = false;
                    }

                    // ทำการซ่อน TextBox ที่มี ID เป็น txtM01 ถึง txtM12 โดยใช้ลูป
                    for (int i = 1; i <= 12; i++)
                    {
                        TextBox txtM = e.Row.FindControl("txtM" + i.ToString("D2")) as TextBox;
                        if (txtM != null)
                        {
                            txtM.Visible = false;
                        }
                    }
                }

                //ไม่แสดงข้อมูลของช่องรวมและช่องเฉลี่ย
                string souce_result = DataBinder.Eval(e.Row.DataItem, "souce_result").ToString();
                if (souce_result == "t")
                {
                    Label lblTotal = e.Row.FindControl("lbltotal") as Label;
                    if (lblTotal != null)
                    {
                        lblTotal.Visible = false;

                    }
                }
                else if (souce_result == "a")
                {
                    Label lblAverage2 = e.Row.FindControl("lblAverage") as Label;
                    if (lblAverage2 != null)
                    {
                        lblAverage2.Visible = false;
                    }
                }
                else if (souce_result == "x")
                {
                    Label lblTotal = e.Row.FindControl("lbltotal") as Label;
                    Label lblAverage2 = e.Row.FindControl("lblAverage") as Label;
                    lblTotal.Visible = false;
                    lblAverage2.Visible = false;
                }
                else
                {
                    
                }
                        
                // Calculate the sum of m01 to m12
                decimal sum = 0;
                int count = 0;

                for (int i = 1; i <= 12; i++)
                {
                    string columnName = "m" + i.ToString("D2");
                    object value = DataBinder.Eval(e.Row.DataItem, columnName);
                    if (value != DBNull.Value)
                    {
                        sum += Convert.ToDecimal(value);
                        count++;
                    }
                }

                decimal average = count > 0 ? sum / count : 0;

                // Find the Label control and set its text to the sum
                Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                Label lblAverage = (Label)e.Row.FindControl("lblAverage");

                if (lbltotal != null)
                {
                    lbltotal.Text = sum.ToString("N2"); // Format as needed

                }

                if (lblAverage != null)
                {
                    lblAverage.Text = average.ToString("N2"); // Format as needed
                }

            }
        }

        private void GenreDDL()
        {
            string strQueryGenre = "SELECT TOP (1000) " +
                                   "[genre_id] " +
                                   ",[genre_desc] " +
                                   "FROM [KPI].[dbo].[KPI_genre]";

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand(strQueryGenre, conn))
                {
                    
                    using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        // เพิ่มค่า index 0 เป็น "เลือกทุกประเภท"
                        DataRow newRow = dt.NewRow();
                        newRow["genre_id"] = 0;
                        newRow["genre_desc"] = "-- เลือกทุกประเภท --";
                        dt.Rows.InsertAt(newRow, 0);

                        ddlGenre.DataSource = dt;
                        ddlGenre.DataTextField = "genre_desc";
                        ddlGenre.DataValueField = "genre_id";
                        ddlGenre.DataBind();
                    }
                }
            }
        }

        protected void ddlGenre_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindingSelectGenre();           
        }

        private void BindingSelectGenre()
        {
            int genre_id = ddlGenre.SelectedIndex;
            string yr = ddlYear.Text;
          
            if(genre_id == 0)
            {
                BindGrid();
            }
            else 
            { 
            using(SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using( SqlCommand cmd = new SqlCommand("GetGenre",conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@yr", yr);
                    cmd.Parameters.AddWithValue("@genre_id",genre_id);
                    
                    using( SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                       
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
            }
        }
    }
}