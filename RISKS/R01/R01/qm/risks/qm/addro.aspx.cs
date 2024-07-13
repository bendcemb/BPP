using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R01.qm.risks.qm
{
    public partial class addro : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["connrisk"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingGrv();
                DropdownContext();
            }
        }


        private void BindingGrv()
        {
            string queryProcess = "SELECT TOP (1000) [pinput]\r\n      ,[pprocess]\r\n      ,[poutput]\r\n      ,[pcontext]\r\n      ,[pconcern]\r\n      ,[prequirement]\r\n      ,[pprocedure]\r\n      ,[item]\r\n      ,[id]\r\n      ,[username]\r\n      ,[createdate]\r\n      ,[editname]\r\n      ,[editdate]\r\n      ,[fromid]\r\n      ,[void]\r\n  FROM [qmdocsql].[dbo].[Q601process]\r\n  WHERE id = @id";

            string queryContext = "SELECT TOP (1000) \r\n       A.[id]\r\n      ,A.[pid]\r\n      ,A.[ctitem]\r\n\t  ,B.[ctcode]\r\n      ,B.[ctitem]\r\n      ,B.[cttype]\r\n      ,B.[ctissue]\r\n      ,B.[ctrisk]\r\n      ,B.[ctopportunity]\r\n      ,B.[ctconcern]\r\n  FROM [qmdocsql].[dbo].[Q601processIssue] A\r\n  LEFT JOIN [qmdocsql].[dbo].[Q21502] B\r\n  ON A.ctitem = B.ctitem\r\n  WHERE pid = @id\r\n  ORDER BY A.ctitem";

            string queryRisk = "SELECT TOP (1000) [id]\r\n      ,[pid]\r\n      ,[ro]\r\n      ,[roitem]\r\n      ,[rocontext]\r\n      ,[rodesc]\r\n      ,[roimpact]\r\n      ,[roimpactvalue]\r\n      ,[rocause]\r\n      ,[rooppvalue]\r\n      ,[rocorrection]\r\n      ,[rodetect]\r\n      ,[rodetectvalue]\r\n      ,[ropriorityitem]\r\n      ,[romanage]\r\n      ,[roincharge]\r\n      ,[roaction]\r\n      ,[actimpactvalue]\r\n      ,[actoppvalue]\r\n      ,[actdetecvalue]\r\n      ,[username]\r\n      ,[createdate]\r\n      ,[editname]\r\n      ,[editdate]\r\n      ,[void]\r\n      ,[fromid]\r\n  " +
                ",roimpactvalue * rooppvalue * rodetectvalue AS score ,actimpactvalue * actoppvalue *  actdetecvalue AS R  FROM [qmdocsql].[dbo].[Q601Risk] WHERE pid = @id ORDER BY roitem";

            string qrstid = Request.QueryString["id"];

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(queryProcess, con))
                {
                    cmd.Parameters.AddWithValue("@id", qrstid);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        grv1.DataSource = dt;
                        grv1.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand(queryContext, con))
                {
                    cmd.Parameters.AddWithValue("@id", qrstid);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        grv2.DataSource = dt;
                        grv2.DataBind();
                    }
                }

                using (SqlCommand cmd = new SqlCommand(queryRisk, con))
                {
                    cmd.Parameters.AddWithValue("@id", qrstid);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        grv3.DataSource = dt;
                        grv3.DataBind();
                    }
                }
            }


        }

        private void DropdownContext()
        {
            string qrstid = Request.QueryString["id"];
            string strcontext = "SELECT TOP(1000) \r\n       A.[id]\r\n      ,A.[pid]\r\n      ,A.[ctitem]\r\n\t  ,B.[ctcode]\r\n      ,B.[ctitem]\r\n      ,B.[cttype]\r\n      ,B.[ctissue]\r\n      ,B.[ctrisk]\r\n      ,B.[ctopportunity]\r\n      ,B.[ctconcern]\r\n  FROM[qmdocsql].[dbo].[Q601processIssue] A\r\n  LEFT JOIN[qmdocsql].[dbo].[Q21502] B\r\n  ON A.ctitem = B.ctitem\r\n  WHERE pid = @pid";

            using (SqlConnection con = new SqlConnection(conn))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(strcontext, con))
                {
                    cmd.Parameters.AddWithValue("@pid", qrstid);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        ddlContext.DataSource = dt;
                        ddlContext.DataValueField = "id";
                        ddlContext.DataTextField = "ctissue";
                        ddlContext.DataBind();
                    }
                }
            }
        }

    }
}