<%@ Page Title="ใบรับความต้องการลูกค้า" Language="VB" MasterPageFile="~/ReportSAN.Master" AutoEventWireup="true"  %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration.ConfigurationManager" %>


<script runat="server">

    Sub dispdata(cwhere As String)
        Dim strconn As String = ConnectionStrings("misdb").ConnectionString
        Dim strsql As String
        Dim sqlwhere As String = " WHERE void=0 "
        If Not cwhere = "" Then
            sqlwhere = sqlwhere & " and " & cwhere
        End If
        strsql = "SELECT top 50 * FROM [qsaf207]  " & sqlwhere & " order by id desc"
        Dim myconn As New SqlConnection(strconn)
        Dim myda As New SqlDataAdapter(strsql, myconn)
        myconn.Open()
        Dim ds As New DataSet()
        myda.Fill(ds)
        GridView1.DataSource = ds.Tables(0)
        GridView1.DataBind()
        myconn.Close()

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim cwhere As String = ""
        If Not TextBox1.Text = "" Then
            cwhere = " dwgno Like '%" & TextBox1.Text & "%'"
        End If
        If Not TextBox2.Text = "" Then
            If cwhere = "" Then
                cwhere = " issuer Like '%" & TextBox2.Text & "%'"
            Else
                cwhere = cwhere & " and issuer Like '%" & TextBox2.Text & "%'"
            End If
        End If
        If Not TextBox3.Text = "" And Not TextBox4.Text = "" Then
            If cwhere = "" Then
                cwhere = " docdate between '" & TextBox3.Text & "' and '" & TextBox4.Text & "'"
            Else
                cwhere = cwhere & " and docdate between '" & TextBox3.Text & "' and '" & TextBox4.Text & "'"
            End If
        End If
        dispdata(cwhere)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack() Then
            dispdata(" datediff(day,recdate,getdate())=0 ")
        End If
    End Sub
</script>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
    <div class="col-md-12">

        <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo">ค้นใบรับความต้องการลูกค้า</button>
        <div id="demo" class="collapse">
                <div class="form-group row">
                    <label class="control-label col-md-2 text-right" >DWG No.:</label>
                    <div class="col-md-4">
                         <asp:TextBox ID="TextBox1" runat="server" class="form-control text-box single-line"></asp:TextBox>
                        </div>
                    <div class="col-md-6">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-2 text-right" >ลูกค้า:</label>
                    <div class="col-md-4">
                         <asp:TextBox ID="TextBox2" runat="server" class="form-control text-box single-line"></asp:TextBox>
                        </div>
                    <div class="col-md-6">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-2 text-right" >ระหว่างวันที่:</label>
                    <div class="col-md-2">
                        <asp:TextBox ID="TextBox3" width="150" class="form-control text-box single-line" autocomplete="off" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-8">
                       <asp:TextBox ID="TextBox4" class="form-control text-box single-line" width="150" runat="server" autocomplete="off"></asp:TextBox>
                    </div>
               </div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="ค้นเอกสาร" OnClick="Button1_Click" CssClass="btn btn-primary" />
           <input type="button" id="btnUpload" value="ล้างข้อมูล" class="btn btn-primary" />
</div>
<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" cssclass="table table-hover table-sm" >
            <Columns>
                <asp:TemplateField HeaderText="เลขที่อ้างอิง" SortExpression="id">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("id", "editdet.aspx?id={0}") %>' Text='<%# Eval("id") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="doccode" HeaderText="เลขเอกสาร" SortExpression="doccode" />
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
        <a href="http://bppnet/sa/">กลับไปหน้าหลัก</a> | <a href="/sa/staff/sap201/">บันทึกใบรับความต้องการลูกค้า</a><br /> <br />
        </div>
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
            $('#<%=textbox3.clientid %>').datepicker({
                //dateFormat: 'dd/mm/yy' ,
                firstDay: 1
            });

        });
        $(document).ready(function () {
            $('#<%=textbox4.clientid %>').datepicker({
                //dateFormat: 'dd/mm/yy' ,
                firstDay: 1
            });

        });

        $(function () {
            $('#btnUpload').click(function () {
                ctl00_MainContent_TextBox1.value = '';
                ctl00_MainContent_TextBox2.value = '';
                ctl00_MainContent_TextBox3.value = '';
                ctl00_MainContent_TextBox4.value = '';

            })
        })
    </script>
    
</asp:content>