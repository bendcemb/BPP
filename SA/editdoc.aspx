<%@ Page Title="ใบรับความต้องการลูกค้า (SA-F207)" Language="VB" MasterPageFile="~/ReportSAN.Master" AutoEventWireup="true" ClientIDMode="Static"  %>
<%@ Register src="form.ascx" tagname="intform" tagprefix="uc2" %>
<%@ Import Namespace = "System.IO" %>
<%@ Import Namespace = "System.Data" %>
<%@ import Namespace="System.Data.Sqlclient" %>
<%@ import Namespace="System.Configuration.ConfigurationManager" %>
<%@ import Namespace="System.Globalization" %>

<script runat="server">

    Protected Sub Page_init(sender As Object, e As System.EventArgs)
        Dim dv As DataView = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        Dim dr As DataRow
        dr = dv.Table.Rows(0)
        If dr("void") = 1 Then
            intform1.Visible = "false"
            Label3.Text = "เอกสารถูกลบไปแล้ว"
            Return
        End If
        If dr("dur") > 90 Then
            intform1.Visible = "false"
            Label3.Text = "เอกสารบันทึกเกิน 90 วัน ไม่อนุญาตให้แก้ไข"
            Return
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack() Then
        End If
    End Sub
</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="one_c">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:misdb %>" SelectCommand="SELECT *,DATEDIFF(d, createdate, GETDATE()) AS dur FROM [saf207] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" cssclass="table table-sm">
                <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="เลขที่อ้างอิง" InsertVisible="False" ReadOnly="True" SortExpression="id" >
                    <HeaderStyle Width="20%" />
                    </asp:BoundField>
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
                <asp:BoundField DataField="editname" HeaderText="ผู้แก้ไข" SortExpression="editname" />
                <asp:TemplateField HeaderText="แก้ไขล่าสุด" SortExpression="editdate">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("editdate", "{0:dd/MM/yyyy HH:mm}")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:DetailsView>
<br />
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    <div id="formcomment">
        <uc2:intform ID="intform1" runat="server" />
    </div>
        </div>
    <br />
    
        <a href="http://bppnet/sa/">กลับไปหน้าหลัก</a> | <a href="/sa/staff/sap201/">บันทึกใบรับความต้องการลูกค้า</a><br /> <br />
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

</asp:Content>