using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.test
{
    public partial class test : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindChackbox();
                PhoneNumberX();
            }
        }

        private void bindChackbox()
        {
            using(SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using(SqlCommand cmd = new SqlCommand("R01_GetContext", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        cblx.DataSource = dt;
                        cblx.DataValueField = "issue_item";
                        cblx.DataTextField = "issue_item";
                        cblx.DataBind();

                    }
          
                }

                
            }
        }

        protected void cblx_SelectedIndexChanged(object sender, EventArgs e)
        {
            // สร้างตัวแปร StringBuilder เพื่อเก็บข้อความที่เลือกทั้งหมด
            StringBuilder selectedText = new StringBuilder();

            // ลูปผ่านทุกตัวเลือกใน CheckBoxList
            foreach (ListItem item in cblx.Items)
            {
                // ตรวจสอบว่ารายการนั้นถูกเลือกหรือไม่
                if (item.Selected)
                {
                    // เพิ่มข้อความของรายการที่ถูกเลือกใน StringBuilder
                    selectedText.AppendLine(item.Text);
                }
            }

            // กำหนดค่าของ TextBox เป็นข้อความที่เลือกทั้งหมด
            txtContext.Text = selectedText.ToString();
        }

        private void PhoneNumberX()
        {
            
         }

    }
}