using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace R01.report.doccenter
{

    public partial class answer : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        string strSp = "GetDocCenter_Answer";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingTable();
            }
        }

        private void BindingTable()
        {
            string strId = Request.QueryString["id"];

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(strSp, con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", strId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {

                                lblsec_rqt.Text = reader["sec_rqt"].ToString();

                                lblreqtype.Text = reader["reqtype"].ToString();
                                lbldoctype.Text = reader["doctype"].ToString();
                                lbldocno.Text = reader["docno"].ToString();
                                lbldocname.Text = reader["docname"].ToString();
                                lblNOTE_.Text = reader["NOTE_"].ToString();

                                //lblattfile.Text = reader["attfile"].ToString();
                                
                                string attFileFromDatabase = reader["attfile"].ToString();
                                string trimmedText = "";
                                if (!string.IsNullOrEmpty(attFileFromDatabase) && attFileFromDatabase.Length > 15)
                                {
                                    trimmedText = attFileFromDatabase.Substring(15); // ตัดข้อความออกจากตำแหน่งเริ่มต้นถึงตำแหน่งที่ 15
                                    lblattfile.Text = "<br /><a href='http://bppnet" + trimmedText;
                                }
                                else
                                {
                                    lblattfile.Text = "";
                                }

                                

                                lblid.Text = reader["id"].ToString();
                                lbldocholder.Text = reader["docholder"].ToString();
                                lblacknowledge.Text = reader["acknowledge"].ToString();
                                hdfreqfile.Value = reader["reqfile"].ToString();
                                //        Doc_Job.InnerText = reader["Doc_Job"].ToString();
                                //        Doc_Name.InnerText = reader["Doc_Name"].ToString();
                                //        Doc_Type.InnerText = reader["Doc_Type"].ToString();
                                //        doc_obj.InnerText = reader["doc_obj"].ToString();
                                //        Doc_Rev.InnerText = reader["Doc_Rev"].ToString();

                                //        //Doc_Date.InnerText = reader["Doc_Date"].ToString();
                                //        // Format the Date to display only the date part without the time
                                //        DateTime docDate = Convert.ToDateTime(reader["Doc_Date"]);
                                //        Doc_Date.InnerText = docDate.ToString("dd/MM/yyyy"); // Change the format as needed


                                //        Doc_Pages.InnerText = reader["Doc_Pages"].ToString();
                                //        Doc_Remark.InnerText = reader["Doc_Remark"].ToString();

                                //        //txtvoid.InnerText = reader["void"].ToString();
                                //        // Check if the value of "สถานะเอกสาร" is 0
                                //        if (reader["void"].ToString() == "0")
                                //        {
                                //            txtvoid.InnerText = "ปกติ: ใช้อ้างอิงในการทำงาน";
                                //        }
                                //        else
                                //        {
                                //            txtvoid.InnerText = "ยกเลิกแล้ว";
                                //        }
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