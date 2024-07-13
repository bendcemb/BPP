using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.report.qm
{
    public partial class qmdinfo : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindingTable1();
            }
        }

        private void BindingTable1()
        {
            string strquery = Request.QueryString["doc_id"];

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("GetQmdinfo", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@doc_id", strquery);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                               
                                Doc_Code.InnerText = reader["Doc_Code"].ToString();
                                Doc_Job.InnerText = reader["Doc_Job"].ToString();
                                Doc_Name.InnerText = reader["Doc_Name"].ToString();
                                Doc_Type.InnerText = reader["Doc_Type"].ToString();
                                doc_obj.InnerText = reader["doc_obj"].ToString();
                                Doc_Rev.InnerText = reader["Doc_Rev"].ToString();

                                //Doc_Date.InnerText = reader["Doc_Date"].ToString();
                                // Format the Date to display only the date part without the time
                                DateTime docDate = Convert.ToDateTime(reader["Doc_Date"]);
                                Doc_Date.InnerText = docDate.ToString("dd/MM/yyyy"); // Change the format as needed


                                Doc_Pages.InnerText = reader["Doc_Pages"].ToString();
                                Doc_Remark.InnerText = reader["Doc_Remark"].ToString();

                                //txtvoid.InnerText = reader["void"].ToString();
                                // Check if the value of "สถานะเอกสาร" is 0
                                if (reader["void"].ToString() == "0")
                                {
                                    txtvoid.InnerText = "ปกติ: ใช้อ้างอิงในการทำงาน";
                                }
                                else
                                {
                                    txtvoid.InnerText = "ยกเลิกแล้ว";
                                }
                            }
                        }
                        else
                        {
                            // Handle case where no rows were returned
                        }
                    }
                }
            }
        }

    }
}