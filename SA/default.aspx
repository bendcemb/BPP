<%@ Page Title="ใบรับความต้องการลูกค้า (SA-F207)" Language="VB" MasterPageFile="~/ReportSAN.Master" AutoEventWireup="true"  %>
<%@ Import Namespace = "System.Data" %>
<%@ import Namespace="System.Data.Sqlclient" %>
<%@ import Namespace="System.Configuration.ConfigurationManager" %>
<%@ Import Namespace = "System.IO" %>

<script runat="server">
    Sub productsGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            'determine the value of the UnitsInStock field
            Dim unitsInStock As Integer = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "dur"))
            If unitsInStock <= 0 Then
                ' color the background of the row yellow
                e.Row.BackColor = Drawing.Color.Red
            ElseIf unitsInStock < 30 Then
                e.Row.BackColor = Drawing.Color.Yellow
            End If
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack() Then
        End If
    End Sub

    Protected Sub PostWebboard(sender As Object, e As EventArgs)
        If txtdocdate.Text = "" Then
            txtdocdate.Text = DateTime.Today
        End If
        Dim a01 As String = txtname.Text
        Dim a02 As String = txtdocdate.Text
        Dim a03 As String = txtdoccode.Text
        Dim a04 As String = txtissuer.Text
        Dim a05 As String = Request.ServerVariables("REMOTE_ADDR")
        Dim a06 As String = txtdocno.Text
        Dim a07 As Date = Now
        Dim a08 As String = ""
        Dim a09 As String = note_.Text
        Dim a10 As String = ""
        Dim a11 As String = Request.ServerVariables("REMOTE_ADDR")
        Dim a12 As String = UCase(txtdwg.Text)
        Dim a13 As String = UCase(txtpartcode.Text)
        Dim a14 As String = txtpartname.Text
        Dim a15 As String = txtothinfo.Text
        Dim a16 As Integer = IIf(chkdie.Checked, 1, 0)
        Dim a17 As Integer = IIf(chkpart.Checked, 1, 0)
        Dim a18 As String = optordmode.SelectedValue
        Dim a19 As String = txtqty.Text
        Dim a20 As String = optper.SelectedValue
        Dim a21 As String = UCase(txtcurrency.Text)
        Dim a22 As String = optdelcond.SelectedValue
        Dim a23 As String = txtdeldesc.Text
        Dim a24 As String = txtcontact.Text
        Dim a25 As String = txtsalesman.Text
        Dim a26 As String = txtpack.Text
        Dim FileFullName As String = FileUpload1.PostedFile.FileName
        Dim FileNameInfo As String = Path.GetFileName(FileFullName)
        Dim extension As String = Path.GetExtension(FileNameInfo)
        If FileNameInfo <> "" Then
            Dim g As Guid
            g = Guid.NewGuid()
            UploadFile(FileUpload1, g.ToString)
            a08 = FileNameInfo
            a10 = g.ToString & extension
        End If
        Dim strconn As String = ConnectionStrings("misdb").ConnectionString
        Dim myconn As New SqlConnection(strconn)
        Dim strsql As String
        strsql = "insert into [saf207] (username, docdate, doccode,docno, docdesc,issuer, createdate,filename,fileid,ip,dwgno, partcode, partname, othinfo, diereq, partreq, ordmode, ordqty, ordper,ordcurrency, delcond, deldesc, contactname, salesman, packdesc) values (@p01,@p02,@p03,@p06,@p09,@p04,@p07,@p08,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17,@p18,@p19,@p20,@p21,@p22,@p23,@p24,@p25,@p26)"
        Dim myCommand As New SqlCommand(strsql, myconn)
        myCommand.Parameters.Add("p01", Data.SqlDbType.VarChar).Value = a01
        myCommand.Parameters.Add("p02", Data.SqlDbType.VarChar).Value = a02
        myCommand.Parameters.Add("p03", Data.SqlDbType.VarChar).Value = a03
        myCommand.Parameters.Add("p04", Data.SqlDbType.VarChar).Value = a04
        myCommand.Parameters.Add("p05", Data.SqlDbType.VarChar).Value = a05
        myCommand.Parameters.Add("p06", Data.SqlDbType.VarChar).Value = a06
        myCommand.Parameters.Add("p07", Data.SqlDbType.DateTime).Value = a07
        myCommand.Parameters.Add("p08", Data.SqlDbType.VarChar).Value = a08
        myCommand.Parameters.Add("p09", Data.SqlDbType.VarChar).Value = a09
        myCommand.Parameters.Add("p10", Data.SqlDbType.VarChar).Value = a10
        myCommand.Parameters.Add("p11", Data.SqlDbType.VarChar).Value = a11
        myCommand.Parameters.Add("p12", Data.SqlDbType.VarChar).Value = a12
        myCommand.Parameters.Add("p13", Data.SqlDbType.VarChar).Value = a13
        myCommand.Parameters.Add("p14", Data.SqlDbType.VarChar).Value = a14
        myCommand.Parameters.Add("p15", Data.SqlDbType.VarChar).Value = a15
        myCommand.Parameters.Add("p16", Data.SqlDbType.Int).Value = a16
        myCommand.Parameters.Add("p17", Data.SqlDbType.Int).Value = a17
        myCommand.Parameters.Add("p18", Data.SqlDbType.VarChar).Value = a18
        myCommand.Parameters.Add("p19", Data.SqlDbType.VarChar).Value = a19
        myCommand.Parameters.Add("p20", Data.SqlDbType.VarChar).Value = a20
        myCommand.Parameters.Add("p21", Data.SqlDbType.VarChar).Value = a21
        myCommand.Parameters.Add("p22", Data.SqlDbType.VarChar).Value = a22
        myCommand.Parameters.Add("p23", Data.SqlDbType.VarChar).Value = a23
        myCommand.Parameters.Add("p24", Data.SqlDbType.VarChar).Value = a24
        myCommand.Parameters.Add("p25", Data.SqlDbType.VarChar).Value = a25
        myCommand.Parameters.Add("p26", Data.SqlDbType.VarChar).Value = a26
        myCommand.Connection.Open()
        myCommand.ExecuteNonQuery()
        myconn.Close()
        Response.Redirect("/sa/staff/sap201/")
    End Sub

    Sub UploadFile(Fileupload As Object, fid As String)
        Dim FileFullName As String = Fileupload.PostedFile.FileName
        Dim FileNameInfo As String = Path.GetFileName(FileFullName)
        Dim extension As String = Path.GetExtension(FileNameInfo)
        If FileNameInfo <> "" Then
            Dim d01 As String = Format(Today, "yyyyMMdd")
            Dim virpath As String = "attfiles/"
            Dim temppath As String = Server.MapPath(virpath)
            Dim dr As New DirectoryInfo(temppath)
            If dr.Exists = False Then
                dr.Create()
            End If
            Fileupload.PostedFile.SaveAs(temppath & "/" & fid & extension)
        End If
    End Sub



</script>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
    <div class="col-md-12">
    <h3>ใบรับความต้องการลูกค้า</h3>    
                <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo">เพิ่มใบรับความต้องการลูกค้า</button>
        <div id="demo" class="collapse">
    <div class="row bg-light">
        <div class="col-md-12 order-md-1">
           <div class="row">
                <div class="col-md-6 mb-3">
                   <asp:Label ID="Label9" runat="server" CssClass="control-label"  Text="ชื่อลูกค้า"></asp:Label>
                  <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtissuer" ForeColor="Red"></asp:RequiredFieldValidator>      
               <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="issuer" DataValueField="issuer" AppendDataBoundItems="true" onClick="chkissuer(document.getElementById('ctl00_MainContent_DropDownList1'))">
                   <asp:ListItem Value="">-</asp:ListItem>
               </asp:DropDownList>
               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:misdb %>" SelectCommand="SELECT DISTINCT [issuer] FROM [saf207] WHERE ([issuer] IS NOT NULL) ORDER BY [issuer]"></asp:SqlDataSource>
                </div>
                <div class="col-md-6 mb-3">
                   <asp:Label ID="Label1" runat="server" CssClass="control-label"  Text="ชื่อลูกค้า"></asp:Label>
                    <asp:TextBox id = "txtissuer" runat = "server" CssClass="form-control" required/>
                </div>
           </div>
           <div class="row">
                <div class="col-md-4 mb-3">
                   <asp:Label ID="Label6" runat="server" CssClass="control-label"  Text="เลขที่อ้างอิง"></asp:Label>
               <asp:TextBox id = "txtdoccode" runat = "server" CssClass="form-control" />
                    </div>
                <div class="col-md-4 mb-3">
                   <asp:Label ID="Label8" runat="server" CssClass="control-label"  Text="ใบเสนอราคา"></asp:Label>
               <asp:TextBox id = "txtdocno" runat = "server" CssClass="form-control" autocomplete="off"  />
                </div>
                <div class="col-md-4 mb-3">
                       <asp:Label ID="Label7" runat="server" CssClass="control-label"  Text="วันที่แจ้ง"></asp:Label>
                           <asp:TextBox id = "txtdocdate" runat = "server" CssClass="form-control" autocomplete="off"  /> 
                         <span style="font-size:0.8rem;color:red;">*รูปแบบ ด/ว/ปี ค.ศ.</span>
                         <script type="text/javascript" >
                             $(document).ready(function () {
                                 $('#<%=txtdocdate.Clientid %>').datepicker({
                                     //dateFormat: 'dd/mm/yy' ,
                                     firstDay: 0,
                                     minDate: -300, maxDate: "0D"
                                 });
                             });
                        </script>
                    </div>
               </div>
           <div class="row">
                <div class="col-md-4 mb-3">
                   <asp:Label ID="Label14" runat="server" CssClass="control-label"  Text="ชื่อผู้ติดต่อ(ลูกค้า)"></asp:Label>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtcontact" ForeColor="Red"></asp:RequiredFieldValidator>      
                    <asp:TextBox id = "txtcontact" runat = "server"  cssclass="form-control" required  />
                </div>
                <div class="col-md-4 mb-3">
                   <asp:Label ID="Label15" runat="server" CssClass="control-label"  Text="ผู้รับงาน (BPP)"></asp:Label>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtsalesman" ForeColor="Red"></asp:RequiredFieldValidator>      
                    <asp:TextBox id = "txtsalesman" runat = "server"  cssclass="form-control" required />
                </div>
                <div class="col-md-4 mb-3">
                   <asp:Label ID="Label16" runat="server" CssClass="control-label"  Text="Other info"></asp:Label>
                    <asp:TextBox id = "txtothinfo" runat = "server"  cssclass="form-control" />
                </div>
           </div>
           <div class="row">
                <div class="col-md-3 mb-3">
                   <asp:Label ID="Label10" runat="server" CssClass="control-label"  Text="DWG No."></asp:Label>
                    <asp:TextBox id = "txtdwg" runat = "server"  cssclass="form-control" style="text-transform: uppercase" />
                </div>
                <div class="col-md-3 mb-3">
                   <asp:Label ID="Label11" runat="server" CssClass="control-label"  Text="Part No."></asp:Label>
                    <asp:TextBox id = "txtpartcode" runat = "server"  cssclass="form-control"  style="text-transform: uppercase" />
                </div>
                <div class="col-md-6 mb-3">
                   <asp:Label ID="Label12" runat="server" CssClass="control-label"  Text="Part Name"></asp:Label>
                    <asp:TextBox id = "txtpartname" runat = "server"  cssclass="form-control"  />
                </div>
           </div>
           <div class="row">
                <div class="col-md-4 mb-3">
                   <asp:Label ID="Label13" runat="server" CssClass="control-label"  Text="ความต้องการ"></asp:Label>
                   <asp:CheckBox ID="chkdie" runat="server" Text="เสนอราคาแม่พิมพ์" CssClass="form-control" />
                   <asp:CheckBox ID="chkpart" runat="server" Text="เสนอราคาชิ้นงาน" CssClass="form-control" />
                </div>
                <div class="col-md-3 mb-3">
                   <asp:Label ID="Label19" runat="server" CssClass="control-label"  Text="คำสั่งซื้อ"></asp:Label>
                    <asp:RadioButtonList ID="optordmode" runat="server" >
                        <asp:ListItem Value="1">ต่อเนื่อง</asp:ListItem>
                        <asp:ListItem Value="2">ครั้งเดียว</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="col-md-3 mb-3">
                   <asp:Label ID="Label17" runat="server" CssClass="control-label"  Text="จำนวนสั่งซื้อ"></asp:Label>
                    <asp:TextBox id = "txtqty" runat = "server"  cssclass="form-control" />
                   <asp:Label ID="Label20" runat="server" CssClass="control-label text-right"  Text="เสนอราคาเป็นเงิน"></asp:Label>
                </div>
                <div class="col-md-2 mb-3">
                   <asp:Label ID="Label18" runat="server" CssClass="control-label"  Text="ชิ้นต่อ"></asp:Label>
                    <asp:DropDownList ID="optper" runat="server" CssClass="form-control" >
                        <asp:ListItem>เดือน</asp:ListItem>
                        <asp:ListItem>ปี</asp:ListItem>
                        <asp:ListItem>ครั้งเดียว</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox id = "txtcurrency" runat = "server" Text="THB" style="text-transform: uppercase" cssclass="form-control" />
                </div>
           </div>
           <div class="row">
                <div class="col-md-4 mb-3">
                   <asp:Label ID="Label21" runat="server" CssClass="control-label"  Text="การขนส่ง"></asp:Label>
                    <asp:DropDownList ID="optdelcond" runat="server" CssClass="form-control" >
                        <asp:ListItem>รวมค่าขนส่งในราคาชิ้นงาน</asp:ListItem>
                        <asp:ListItem>คิดค่าขนส่งเป็นเที่ยว</asp:ListItem>
                        <asp:ListItem>เงื่อนไขอื่นๆ</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-4 mb-3">
                   <asp:Label ID="Label22" runat="server" CssClass="control-label"  Text="รายละเอียดขนส่งเงื่อนไขอื่นๆ"></asp:Label>
                    <asp:TextBox id = "txtdeldesc" runat = "server" cssclass="form-control" />
                </div>
                <div class="col-md-4 mb-3">
                   <asp:Label ID="Label23" runat="server" CssClass="control-label"  Text="การบรรจุสินค้า"></asp:Label>
                    <asp:TextBox id = "txtpack" runat = "server" cssclass="form-control" />
                </div>
           </div>
           <div class="row">
                <div class="col-md-12 mb-3">
                   <asp:Label ID="Label4" runat="server" CssClass="control-label"  Text="รายละเอียดเพิ่มเติม"></asp:Label>
                    <asp:TextBox id = "note_" runat = "server" TextMode="MultiLine" cssclass="form-control" />
                </div>
           </div>
               <div class="row bg-light">
                     <div class="col-md-6 mb-3">
                      <asp:Label ID="Label3" runat="server" CssClass="control-label"  Text="แนบไฟล์"></asp:Label>
                       <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"/>
                     </div>
                     <div class="col-md-6 mb-3">
                      <asp:Label ID="Label5" runat="server" CssClass="control-label"  Text="ผู้บันทึก"></asp:Label>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtname" ForeColor="Red"></asp:RequiredFieldValidator>
               <asp:DropDownList ID="txtname" runat="server" CssClass="form-control" required AppendDataBoundItems="True" >
                   <asp:ListItem Value="">-</asp:ListItem>
                   <asp:ListItem>เพียงพิศ โพธิ์ทอง</asp:ListItem>
                   <asp:ListItem>มนต์ธิรา รอดอินทร์</asp:ListItem>
                   <asp:ListItem>ธนัญญา โพธิ์จันทร์</asp:ListItem>
               </asp:DropDownList>
                    </div>
               </div>
               <div class="row bg-light">
                <div class="col-md-12 mb-3">
                  <div style="text-align:center;"><span style="font-size:0.8em;color:blue;">กรณีระบบไม่บันทึกข้อมูลให้ ต้องตรวจสอบว่าป้อนข้อมูลที่จำเป็นครบหรือไม่ ดอกจัน(*)</span></div>
                  <asp:Button id="button2" class="btn btn-primary btn-block"  onclick="PostWebboard" runat="server" Text="บันทึกเพิ่มรายการ"></asp:Button>
                </div>
              </div>

            </div>
       

    </div>

        </div> 
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowSorting="True" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-sm" >
            <Columns>
                <asp:TemplateField HeaderText="เลขที่อ้างอิง" SortExpression="id">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("id", "editdet.aspx?id={0}") %>' Text='<%# Eval("id") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="docno" HeaderText="เลขที่ใบเสนอราคา" SortExpression="docno" />
                <asp:TemplateField HeaderText="วันที่เอกสาร" SortExpression="docdate">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("docdate", "{0:dd/MM/yyyy}")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="issuer" HeaderText="ลูกค้า" SortExpression="issuer" />
                <asp:BoundField DataField="contactname" HeaderText="ชื่อผู้ติดต่อ(ลูกค้า)" SortExpression="contactname" />
                <asp:BoundField DataField="dwgno" HeaderText="DWG No." SortExpression="dwgno" />
                <asp:BoundField DataField="partcode" HeaderText="Part No." SortExpression="partcode" />
                <asp:BoundField DataField="partname" HeaderText="Part Name" SortExpression="partname" />
                <asp:BoundField DataField="username" HeaderText="ผู้บันทึก" SortExpression="username" />
                <asp:TemplateField HeaderText="วันที่บันทึก" SortExpression="createdate">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("createdate", "{0:dd/MM/yyyy HH:mm}")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="#ไฟล์" >
                    <ItemTemplate>
                        <asp:Label ID="Label51" runat="server" Text='<%# Bind("cntdoc", "{0:n0}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="center" />
                </asp:TemplateField>
               <asp:TemplateField HeaderText="" SortExpression="id">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("id", "upldoc.aspx?sid={0}") %>' Text='แนบไฟล์'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="*" SortExpression="id">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl='<%# Eval("id", "editdoc.aspx?id={0}") %>' Text='แก้ไข'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    <br />
    
        <a href="http://bppnet/sa/">กลับไปหน้าหลัก</a> | <a href="schdoc.aspx">ค้นใบรับความต้องการลูกค้า</a><br /> <br />
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:misdb %>" SelectCommand="SELECT top 10 [id],docno, [doccode], [docdate], [contactname],[partcode],[partname],[dwgno], [docdesc], [issuer], [username], [createdate], [filename],[fileid], [void],datediff(day,getdate(),recdate) as dur,cntdoc FROM [qsaf207] WHERE ([void] = 0) ORDER BY [id] DESC" >
        </asp:SqlDataSource>
</div>
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="/css/form-validation.css" rel="stylesheet">
      <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/js/bootstrap.bundle.min.js"></script>
        <script src="/js/form-validation.js"></script>
    <script src="/Scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <link href="/Styles/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" >
        $(document).ready(function () {
            $('.dd').datepicker({
                //dateFormat: 'dd/mm/yy' ,
                showWeek: true,
                firstDay: 1
            });

        });

        function chkissuer(d) {
            if (d.value == '-') { return; }
            ctl00_MainContent_txtissuer.value = d.value;
        }

    </script>
</asp:content>