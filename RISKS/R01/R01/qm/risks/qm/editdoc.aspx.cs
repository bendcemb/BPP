using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.qm.risks.qm
{
    public partial class editdoc : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        string struser = WindowsIdentity.GetCurrent().Name;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGrv();
                BindingCheckboxlist();
                Getpcontext();
            }
        }

        //แสดงข้อมูลลงในตาราง
        private void BindingGrv()
        {
            string strQuery = "SELECT TOP (1000) [pinput] ,[pprocess] ,[poutput] ,[pcontext] ,[pconcern] ,[prequirement] ,[pprocedure] ,[item] ,[id]" +
                              "FROM [qmdocsql].[dbo].[Q601process] " +
                              "WHERE id = @id";

            string query = Request.QueryString["id"];

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = strQuery;
                    cmd.Parameters.AddWithValue("@id", query);
                    cmd.ExecuteNonQuery();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        grv1.DataSource = dt;
                        grv1.DataBind();


                    }
                }
            }
        }

        //แสดงข้อมูลของ checkboxlist
        private void BindingCheckboxlist()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("R01_GetContext", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        cblContext.DataSource = dt;
                        cblContext.DataValueField = "ctitem";
                        cblContext.DataTextField = "issue_item";
                        cblContext.DataBind();


                    }
                }

                string strid = Request.QueryString["id"];
                string strcontext = "SELECT TOP (1000) [id] ,[pid] ,[ctitem] FROM [qmdocsql].[dbo].[Q601processIssue] WHERE pid = @pid";

                using (SqlCommand cmd = new SqlCommand(strcontext, con))
                {
                    cmd.CommandText = strcontext;
                    cmd.Parameters.AddWithValue("@pid", strid);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        foreach (DataRow dr in dt.Rows)
                        {
                            string ctitemValue = dr["ctitem"].ToString();
                            string idValue = dr["id"].ToString();

                            //ListItem item = new ListItem(ctitemValue, idValue);
                            //cblContext.Items.Add(item);

                            // Check the item if it matches the value obtained from the database
                            foreach (ListItem checkboxItem in cblContext.Items)
                            {
                                if (checkboxItem.Value == ctitemValue)
                                {
                                    checkboxItem.Selected = true;
                                    break; // Exit the loop after selecting the item
                                }
                            }
                        }

                    }
                }
            }
        }

        //กดปุ่มบันทึก บริบท
        protected void btnsavecontext_Click(object sender, EventArgs e)
        {
            // สร้างตัวแปร StringBuilder เพื่อเก็บข้อความที่เลือกทั้งหมด
            StringBuilder selectedText = new StringBuilder();
            StringBuilder selectedText2 = new StringBuilder();

            // ลูปผ่านทุกตัวเลือกใน CheckBoxList
            foreach (ListItem item in cblContext.Items)
            {
                // ตรวจสอบว่ารายการนั้นถูกเลือกหรือไม่
                if (item.Selected)
                {
                    // เพิ่มข้อความของรายการที่ถูกเลือกใน StringBuilder
                    selectedText.AppendLine(item.Text);
                    selectedText2.AppendLine(item.Value);
                }


            }

            // กำหนดค่าของ TextBox เป็นข้อความที่เลือกทั้งหมด
            txtContext.Text = selectedText.ToString();
            txtContext2.Text = selectedText2.ToString();

        }


        //แสดงข้อมูลใน textbox
        protected void grv1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Check if the current row is a data row
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Assuming "citem" is a column name in your data source
                // You need to cast DataItem to the correct data type first
                DataRowView rowView = (DataRowView)e.Row.DataItem;

                // Access the value of the "citem" column from the data item
                // and set it to the TextBox txtitem
                txtitem.Text = rowView["item"].ToString();
                txtpprocess.Text = rowView["pprocess"].ToString();
                txtInput.Text = rowView["pinput"].ToString();
                txtOutput.Text = rowView["poutput"].ToString();
                txtContext.Text = rowView["pcontext"].ToString();
                txtConcern.Text = rowView["pconcern"].ToString();
                txtprequirement.Text = rowView["prequirement"].ToString();

            }
        }

        //ดึง pcontext ด้วย id จาก database
        private string strPcontext;

        // Constructor
        public editdoc()
        {
            string strid = HttpContext.Current.Request.QueryString["id"]; // เพิ่ม HttpContext.Current ในการเข้าถึง Request
            strPcontext = GetPcontextFromDatabase(strid); // ส่ง strid ไปเป็นพารามิเตอร์ให้กับเมทอด GetPcontextFromDatabase()
        }

        //ดึงข้อมูลจาก database
        private string GetPcontextFromDatabase(string id)
        {
            string queryPcontext = "SELECT [pcontext] FROM [qmdocsql].[dbo].[Q601process] WHERE id = @id";

            string result = null; // สร้างตัวแปรเพื่อเก็บค่าที่คืนกลับจากฐานข้อมูล
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(queryPcontext, con))
                {
                    cmd.Parameters.AddWithValue("@id", id); // ใช้ id ที่ส่งเข้ามา
                    result = (string)cmd.ExecuteScalar();
                }
            }
            return result;
        }


        //กด save ข้อมูล
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //ถ้าข้อมูลใน textbox ตรงกับ database ให้แก้ไขเฉพาะ ตาราง process
            if (txtContext.Text == strPcontext)
            {
                EditPid();
            }
            else //ถ้าข้อมูลใน textbox ไม่ตรงกับ database ให้ลบข้อมูลใน processissue ก่อน แล้วค่อยเพิ่มเข้าไปใหม่ 
            {
                DeletePid();
                SaveProcessIssue();
                EditPid();
                BindingGrv();
                BindingCheckboxlist();
            }
            
        }

        //ดึงข้อมูล pcontext
        private void Getpcontext()
        {
            string strSelect = "SELECT id ,[pcontext] FROM [qmdocsql].[dbo].[Q601process] WHERE id = @pid";
            string strQuery = Request.QueryString["id"];

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(strSelect, con))
                {
                    cmd.CommandText = strSelect;
                    cmd.Parameters.AddWithValue("@pid", strQuery);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void EditPid()
        {
            string strPid = Request.QueryString["id"];
            string queryUpadate = "R01_UpdateProcess";

            string strpinput = txtInput.Text;
            string strpprocess = txtpprocess.Text;
            string strpoutput = txtOutput.Text;
            string strpcontext = txtContext.Text;
            string strpconcern = txtConcern.Text;
            string strprequirement = txtprequirement.Text;
            string strpprocedure = Request.QueryString["key"];
            string stritem = txtitem.Text;
            string streditname = struser;
            int strswitchvoid = 0;

            // เมื่อมีการส่งข้อมูลกลับมาจากเซิร์ฟเวอร์
            if (Request.Form["darkmode"] == "1")
            {
                // ทำตามการทำงานเมื่อ checkbox ถูกเลือก
                // เช่น บันทึกค่า, ปรับการแสดงผล, ฯลฯ
                strswitchvoid = 1;
            }
            else
            {
                // ทำตามการทำงานเมื่อ checkbox ไม่ถูกเลือก
                // เช่น บันทึกค่า, ปรับการแสดงผล, ฯลฯ
                strswitchvoid = 0;
            }

            //,@pinput
            //,@pprocess
            //,@poutput
            //,@pcontext
            //,@pconcern
            //,@prequirement
            //,@pprocedure
            //,@item
            //,@editname
            //,@fromid
            //,@void


            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(queryUpadate, con))
                {
                    cmd.Parameters.AddWithValue("@id", strPid);
                    cmd.Parameters.AddWithValue("pinput", strpinput);
                    cmd.Parameters.AddWithValue("pprocess", strpprocess);
                    cmd.Parameters.AddWithValue("poutput", strpoutput);
                    cmd.Parameters.AddWithValue("pcontext", strpcontext);
                    cmd.Parameters.AddWithValue("pconcern", strpconcern);
                    cmd.Parameters.AddWithValue("prequirement", strprequirement);
                    cmd.Parameters.AddWithValue("pprocedure", strpprocedure);
                    cmd.Parameters.AddWithValue("item", stritem);

                    cmd.Parameters.AddWithValue("editname", streditname);
                    cmd.Parameters.AddWithValue("@void", strswitchvoid);
                    cmd.Parameters.AddWithValue("@fromid", 0);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                }

            }
        }

        //ลบ id ที่เลือกทั้งหมดออกก่อนแก้ไข
        private void DeletePid()
        {
            string strPid = Request.QueryString["id"];
            string strquery = "DELETE FROM [qmdocsql].[dbo].[Q601processIssue] WHERE pid = @pid";

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(strquery, con))
                {
                    cmd.Parameters.AddWithValue("@pid", strPid);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        //ดึง id ล่าสุด
        private int GetLatestId()
        {
            int latestId = 0;
            string query = "SELECT TOP (1) [id] FROM [qmdocsql].[dbo].[Q601process] ORDER BY id DESC";

            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        latestId = Convert.ToInt32(result);
                    }
                }
            }

            return latestId;
        }

        private void SaveProcessIssue()
        {
            int latestId = GetLatestId();
            using (SqlConnection con = new SqlConnection(conn))
            {
                // เปิดการเชื่อมต่อ
                con.Open();

                // ลูปผ่านทุก selected item ใน CheckBoxList
                foreach (ListItem item in cblContext.Items)
                {
                    // ตรวจสอบว่ารายการนั้นถูกเลือกหรือไม่
                    if (item.Selected)
                    {
                        // เรียกใช้ stored procedure และส่งค่าของ selected item นั้น ๆ ไป
                        using (SqlCommand cmd = new SqlCommand("R01_InsertProcessIssue", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@pid", latestId);
                            cmd.Parameters.AddWithValue("@ctitem", item.Value);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                // ปิดการเชื่อมต่อ
                con.Close();
            }
        }

    }
}