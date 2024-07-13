using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JSA03
{
    public partial class jsa_doc : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["jsacon"].ConnectionString;
        string con1 = "SELECT TOP (1000) " +
                        "[doc_id]," +
                        "[approval_date]," +
                        "[section_id]," +
                        "[create_by]," +
                        "[doc_status]," +
                        "[note]," +
                        "[create_date]," +
                        "[edit_date]" +
                        "FROM [jsa].[dbo].[doc]" +
                        "WHERE doc_status = @doc_status";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGrv1();

                // Check if the doc_id parameter is present in the query string
                if (Request.QueryString["doc_id"] != null)
                {
                    // Retrieve the doc_id value from the query string
                    string docId = Request.QueryString["doc_id"];

                    // Store the doc_id value in the session
                    Session["doc_id"] = docId;
                }
            }
        }

        private void BindingGrv1()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd0 = con.CreateCommand())
                {
                    cmd0.CommandText = con1.ToString();
                    cmd0.Parameters.AddWithValue("@doc_status", 0);

                    SqlDataAdapter da0 = new SqlDataAdapter(cmd0);
                    DataTable dt0 = new DataTable();
                    da0.Fill(dt0);
                    grv0.DataSource = dt0;
                    grv0.DataBind();
                }

                using (SqlCommand cmd1 = con.CreateCommand())
                {
                    cmd1.CommandText = con1.ToString();
                    cmd1.Parameters.AddWithValue("@doc_status", 1);

                    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    grv1.DataSource = dt1;
                    grv1.DataBind();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //SaveData();
        }

        //private void SaveData()
        //{
        //    using (SqlConnection con = new SqlConnection(conn))
        //    {
        //        con.Open();
        //        SqlCommand cmd = con.CreateCommand();
        //        cmd.CommandText = "EditJsaDoc";
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        // เพิ่มพารามิเตอร์สำหรับ stored procedure
        //        cmd.Parameters.AddWithValue("@doc_id", jsa_doc.);
        //        cmd.Parameters.AddWithValue("@approval_date", DateTime.Now); // ตั้งค่าเป็นวันที่ปัจจุบันหรือค่าที่ต้องการ
        //        cmd.Parameters.AddWithValue("@doc_status", 1); // ตั้งค่าเป็นสถานะเอกสารหรือค่าที่ต้องการ
        //        cmd.Parameters.AddWithValue("@note", txtNote);
        //        cmd.Parameters.AddWithValue("@create_by", txtCreateBy);

        //        SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        dataAdapter.Fill(dt);
        //    }
        //}

        protected void grv1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditDoc")
            {
                string doc_id = e.CommandArgument.ToString();
                // ต่อไปนี้คือการเรียกใช้ stored procedure EditJsaDoc โดยใช้ค่า doc_id
                using (SqlConnection con = new SqlConnection(conn))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("EditJsaDoc", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@doc_id", doc_id);
                    cmd.Parameters.AddWithValue("@approval_date", DateTime.Now); // ตั้งค่าเป็นวันที่ปัจจุบันหรือค่าที่ต้องการ
                    cmd.Parameters.AddWithValue("@doc_status", 1); // ตั้งค่าเป็นสถานะเอกสารหรือค่าที่ต้องการ
                    cmd.Parameters.AddWithValue("@note", txtNote);
                    cmd.Parameters.AddWithValue("@create_by", txtCreateBy);
                    // เพิ่มพารามิเตอร์อื่น ๆ ตามต้องการ
                    cmd.ExecuteNonQuery();
                }
                // หลังจากที่ดำเนินการบันทึกข้อมูลเรียบร้อย คุณสามารถทำอะไรต่อไปตามความต้องการ เช่น รีโหลดข้อมูลใน GridView
                BindingGrv1();
                Console.WriteLine("modalxxxxxxxxxxxxxxx");
            }
        }

        protected void grv0_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}