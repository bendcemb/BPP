using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Microsoft.Ajax.Utilities;
using System.Text;
using System.Diagnostics;
using System.Runtime.Remoting.Contexts;
using System.Security.Principal;
using System.Collections;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Drawing;

namespace R01.qm.risks.qm
{
    public partial class r01 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;
        string struser = WindowsIdentity.GetCurrent().Name;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGridview();
                //เรียกใช้ JavaScript เพื่อเปิดแท็บ Tab1 เมื่อหน้าเว็บโหลด
                //string script = "<script>openTab(event, 'Tab2');</script>";
                //ScriptManager.RegisterStartupScript(this, GetType(), "OpenTabScript", script, false);
                BindingCheckboxlist();
            }
        }

        private void BindingGridview()
        {

            string strpprocedure = Request.QueryString["key"];
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("R01_GetProcedureByPprocedure", con))
                {
                    cmd.Parameters.AddWithValue("@pprocedure", strpprocedure);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv1.DataSource = dt;
                    grv1.DataBind();

                }

                using (SqlCommand cmd = new SqlCommand("R01_GetProcess", con))
                {
                    cmd.Parameters.AddWithValue("@pprocedure", strpprocedure);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    grv2.DataSource = dt;
                    grv2.DataBind();

                }

            }
        }

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
            }
        }

        //สร้างลำดับใหม่ อัตโนมัติ
        protected void grv2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // ตรวจสอบว่ากำลังผูกข้อมูลกับแถวข้อมูลหรือไม่
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // หากเป็นแถวข้อมูล
                // ให้แสดงลำดับของแถวล่าสุดที่ถูกแสดง
                int lastRowIndex = e.Row.RowIndex + 2; // เพิ่ม 1 เนื่องจากลำดับเริ่มต้นจาก 0
                                                       // ทำอะไรกับลำดับล่าสุดตามที่ต้องการ
                                                       // เช่น กำหนดค่าให้กับ TextBox หรือ Label
                                                       // ในกรณีนี้เราจะแสดงข้อความบน Console
                txtitem.Text = lastRowIndex.ToString();
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


        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveProcess();
            SaveProcessIssue();
            ClearControl();
            BindingGridview();
            BindingCheckboxlist();
        }

        private void SaveProcess()
        {
            string strpinput = txtInput.Text;
            string strpprocess = txtpprocess.Text;
            string strpoutput = txtOutput.Text;
            string strpcontext = txtContext.Text;
            string strpconcern = txtConcern.Text;
            string strprequirement = txtprequirement.Text;
            string strpprocedure = Request.QueryString["key"];
            string stritem = txtitem.Text;
            string strusername = struser;
            string streditname = struser;
            int strvoid = 0;

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("R01_InsertProcess", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("pinput", strpinput);
                    cmd.Parameters.AddWithValue("pprocess", strpprocess);
                    cmd.Parameters.AddWithValue("poutput", strpoutput);
                    cmd.Parameters.AddWithValue("pcontext", strpcontext);
                    cmd.Parameters.AddWithValue("pconcern", strpconcern);
                    cmd.Parameters.AddWithValue("prequirement", strprequirement);
                    cmd.Parameters.AddWithValue("pprocedure", strpprocedure);
                    cmd.Parameters.AddWithValue("item", stritem);
                    cmd.Parameters.AddWithValue("username", strusername);
                    cmd.Parameters.AddWithValue("editname", streditname);
                    cmd.Parameters.AddWithValue("void", strvoid);
                    cmd.Parameters.AddWithValue("fromid", strvoid);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void ClearSelectedItemsInCheckBoxList(CheckBoxList checkBoxList)
        {
            foreach (ListItem item in checkBoxList.Items)
            {
                item.Selected = false;
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

   
        private void ClearControl()
        {

            txtpprocess.Text = string.Empty;
            txtInput.Text = string.Empty;
            txtOutput.Text = string.Empty;
            txtContext.Text = string.Empty;
            txtConcern.Text = string.Empty;
            txtprequirement.Text = string.Empty;
        }
    }
}