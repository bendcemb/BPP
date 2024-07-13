using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.qm.qms
{
    public partial class q05 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingCheckboxlist();
                BindingTable();
                // กำหนด URL และค่าของ HyperLink
                hlctcode.NavigateUrl = "q03.aspx?item=" + lblctcode.Text;
                hlctcode.Text = lblctcode.Text;
            }
        }

        private void BindingCheckboxlist()
        {

            string ctconcernData = Request.QueryString["key"];
            List<string> ctconcernParts = new List<string>();

            foreach (char c in ctconcernData)
            {
                if (c != '_')
                {
                    ctconcernParts.Add(c.ToString());
                }
            }


            // โหลดข้อมูลจากฐานข้อมูล
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT ccode, cdesc FROM [qmdocsql].[dbo].[Q216]";
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            // วนลูปเพื่อเพิ่มรายการใน CheckBoxList และตรวจสอบเพื่อเลือกเช็ครายการที่ตรงกับข้อมูล
            foreach (DataRow row in dt.Rows)
            {
                string ccode = row["ccode"].ToString();
                string cdesc = row["cdesc"].ToString();

                ListItem item = new ListItem(cdesc, ccode);

                // ตรวจสอบว่า ccode มีใน ctconcernParts หรือไม่ แล้วกำหนดให้ Checked
                if (ctconcernParts.Contains(ccode))
                {
                    item.Selected = true;
                }

                cblConcern.Items.Add(item);
            }
        }

        private void BindingTable()
        {
            string strqury = Request.QueryString["code"];
            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT TOP (100) A.[ctcode] ,[ctitem] ,[cttype] ,[ctissue] ,[ctrisk] ,[ctopportunity] ,[ctconcern] ,B.[ctcode] ,B.[ctname] " +
                                      "FROM [qmdocsql].[dbo].[Q21502] A " +
                                      "JOIN [qmdocsql].[dbo].[Q21501] B " +
                                      "ON A.ctcode = B.ctcode " +
                                      "WHERE ctitem = @ctcode";
                    cmd.Parameters.AddWithValue("@ctcode", strqury);
                    cmd.ExecuteNonQuery();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);



                        string strctname = "";
                        string strcttype = "";
                        string strctissue = "";
                        string strctrisk = "";
                        string strctopportunity = "";
                        string strctconcern = "";

                        foreach (DataRow row in dt.Rows)
                        {
                            strctname += row["ctname"].ToString() + " "; // แทน "columnName" ด้วยชื่อคอลัมน์ที่ต้องการแสดง
                            strcttype += row["cttype"].ToString() + " ";
                            strctissue += row["ctissue"].ToString() + " ";
                            strctrisk += row["ctrisk"].ToString() + " ";
                            strctopportunity += row["ctopportunity"].ToString() + " ";
                            strctconcern += row["ctconcern"].ToString() + " ";
                        }

                        lblctcode.Text = strqury;
                        lblctname.Text = strctname;                     
                        lblIE.Text = strcttype;
                        lblissue.Text = strctissue;
                        lblrisk.Text = strctrisk;
                        lblOpp.Text = strctopportunity;
                        lblconc.Text = strctconcern;


                    }

                }
            }
        }

        protected void YourListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblctcode = (Label)e.Item.FindControl("lblctcode");
                lblctcode.DataBind();
            }
        }
    }
}