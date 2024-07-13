<%@ Page Title="ใบรับความต้องการลูกค้า (SA-F207)" Language="VB" MasterPageFile="~/ReportSAN.Master" AutoEventWireup="true" ClientIDMode="Static"  %>
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
            '            intform1.Visible = "false"
            Label3.Text = "เอกสารถูกลบไปแล้ว"
            Return
        End If
        If dr("dur") > 90 Then
            '           intform1.Visible = "false"
            Label3.Text = "เอกสารบันทึกเกิน 90 วัน ไม่อนุญาตให้แก้ไข"
            Return
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack() Then
        End If
    End Sub

    Function chkordmode(ByVal mode As String) As String
        Dim cmode As String = ""
        Select Case mode
            Case 1
                cmode = "ซื้อต่อเนื่อง"
            Case 2
                cmode = "ซื้อครั้งเดียว"
        End Select
        Return cmode
    End Function

    Protected Sub PostWebboard(sender As Object, e As EventArgs)
        Dim a01 As String = Request.QueryString("id")
        Dim a02 As String = note_.Text
        Dim a03 As String = txtname.Text
        Dim a05 As String = Request.ServerVariables("REMOTE_ADDR")
        Dim a08 As String = ""
        Dim a10 As String = ""
        Dim FileFullName As String = ""
        Dim FileNameInfo As String = ""
        Dim extension As String = ""
        If FileNameInfo <> "" Then
            Dim g As Guid
            g = Guid.NewGuid()
            '            UploadFile(FileUpload1, g.ToString)
            a08 = FileNameInfo
            a10 = g.ToString & extension
        End If
        Dim strconn As String = ConnectionStrings("misdb").ConnectionString
        Dim myconn As New SqlConnection(strconn)
        Dim strsql As String
        strsql = "insert into [saf207det] (ID, NAME,NOTE_, IP) values (@p01,@p03,@p02,@p05)"
        Dim myCommand As New SqlCommand(strsql, myconn)
        myCommand.Parameters.Add("p01", Data.SqlDbType.VarChar).Value = a01
        myCommand.Parameters.Add("p02", Data.SqlDbType.VarChar).Value = a02
        myCommand.Parameters.Add("p03", Data.SqlDbType.VarChar).Value = a03
        myCommand.Parameters.Add("p05", Data.SqlDbType.VarChar).Value = a05
        myCommand.Parameters.Add("p08", Data.SqlDbType.VarChar).Value = a08
        myCommand.Parameters.Add("p10", Data.SqlDbType.VarChar).Value = a10
        myCommand.Connection.Open()
        myCommand.ExecuteNonQuery()
        myconn.Close()
        Response.Redirect("/sa/staff/sap201/editdet.aspx?id=" & a01)
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
    <div class="container">
        <div class="row">
            <div class="col-12">
    <h3>ใบรับความต้องการลูกค้า</h3>    
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:misdb %>" SelectCommand="SELECT *,DATEDIFF(d, createdate, GETDATE()) AS dur FROM [saf207] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" cssclass="table table-sm">
                <ItemTemplate>
<div class="row">
    <div class="col-3">
        <asp:Label ID="Label8" runat="server" Text="เลขที่อ้างอิง" CssClass="control-label"></asp:Label>
        <asp:Label ID="Label9" runat="server" Text='<%# Bind("id") %>' CssClass="form-control"></asp:Label>        
    </div>
    <div class="col-3">
        <asp:Label ID="Label12" runat="server" Text="วันที่" CssClass="control-label"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("docdate", "{0:dd/MM/yyyy}")%>' CssClass="form-control"></asp:Label>
    </div>
    <div class="col-6">
        <asp:Label ID="Label10" runat="server" Text="SAM"></asp:Label>
        <asp:Label ID="Label11" runat="server" Text="" CssClass="form-control"></asp:Label>
    </div>
</div>
<div class="row">
    <div class="col-6">
        <asp:Label ID="Label16" runat="server" Text="ลูกค้า" CssClass="control-label"></asp:Label>
        <asp:Label ID="Label17" runat="server" Text='<%# Bind("issuer") %>' CssClass="form-control"></asp:Label>        
    </div>
    <div class="col-3">
        <asp:Label ID="Label13" runat="server" Text="เลขที่ใบเสนอราคา" CssClass="control-label"></asp:Label>
        <asp:Label ID="Label14" runat="server" Text='<%# Bind("docno") %>' CssClass="form-control"></asp:Label>        
    </div>
    <div class="col-3">
        <asp:Label ID="Label7" runat="server" Text="ผู้ดูแลลูกค้า" CssClass="control-label"></asp:Label>
        <asp:Label ID="Label15" runat="server" Text='<%# Bind("salesman") %>' CssClass="form-control"></asp:Label>        
    </div>
</div>
<div class="row">
    <div class="col-6">
        <asp:Label ID="Label18" runat="server" Text="ชื่อผู้ติดต่อ(ลูกค้า)" CssClass="control-label"></asp:Label>
        <asp:Label ID="Label19" runat="server" Text='<%# Bind("contactname") %>' CssClass="form-control"></asp:Label>        
    </div>
</div>
                </ItemTemplate>
            </asp:FormView>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1" cssclass="table table-sm">
                <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <Fields>
                <asp:BoundField DataField="othinfo" HeaderText="Other info" SortExpression="othinfo" />
                <asp:BoundField DataField="dwgno" HeaderText="DWG No." SortExpression="dwgno" />
                <asp:BoundField DataField="partcode" HeaderText="Part No." SortExpression="partcode" />
                <asp:BoundField DataField="partname" HeaderText="Part Name" SortExpression="partname" />
                <asp:TemplateField HeaderText="ความต้องการ" SortExpression="diereq">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#IIf(Eval("diereq") = True, "เสนอราคาแม่พิมพ์", "")  %>'></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text='<%#IIf(Eval("partreq") = True, "เสนอราคาชิ้นงาน", "") %>'></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text='<%# chkordmode(Eval("ordmode")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="จำนวนสั่งซื้อ" SortExpression="ordqty">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ordqty", "{0:n0}")%>'></asp:Label>
                        ชิ้นต่อ<asp:Label ID="Label5" runat="server" Text='<%# Eval("ordper") %>'></asp:Label>
                        เสนอราคาเป็นเงิน: <asp:Label ID="Label6" runat="server" Text='<%# Eval("ordcurrency")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="การขนส่ง" SortExpression="delcond">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("delcond") %>'></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("deldesc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="การบรรจุสินค้า" SortExpression="packdesc">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("packdesc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="รายละเอียดเพิ่มเติม" SortExpression="docdesc">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("docdesc").ToString.Replace(vbLf, "<br/>")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
               <asp:TemplateField HeaderText="" SortExpression="id">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("id", "upldoc.aspx?sid={0}") %>' Text='แนบไฟล์'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
            </asp:DetailsView>
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>

            </div>
        </div>

<div class="row">
    <div class="col-12">
    <div id="formcomment">
                <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo">บันทึกรายละเอียดการดำเนินการ</button>
        <div id="demo" class="collapse">
    <div class="row bg-light">
        <div class="col-md-12 order-md-1">
           <div class="row">
                <div class="col-md-12 mb-3">
                   <asp:Label ID="Label4" runat="server" CssClass="control-label"  Text="รายละเอียดการดำเนินงาน"></asp:Label>
                    <asp:TextBox id = "note_" runat = "server" TextMode="MultiLine" cssclass="form-control" />
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

    </div>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:misdb %>" SelectCommand="SELECT * FROM [saf207det] WHERE void=0 and ([ID] = @ID) ORDER BY [NUMBER]">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="NUMBER" DataSourceID="SqlDataSource2" CssClass="table table-striped table-sm">
            <Columns>
                <asp:TemplateField HeaderText="วันที่บันทึก" SortExpression="date_">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("date_", "{0:dd/MM/yyyy HH:mm}")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="รายละเอียด" SortExpression="NOTE_">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("NOTE_").ToString.Replace(vbLf, "<br/>")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NAME" HeaderText="ผู้บันทึก" SortExpression="NAME" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        </asp:GridView>

    </div>
</div>
        <div class="row">
            <div class="col-6">
                SA-F207
            </div>
            <div class="col-6 text-right">
                04-20-05-65
            </div>
        </div>
        <div class="row">
            <div class="col-12">
    <br />
    
        <a href="http://bppnet/sa/">กลับไปหน้าหลัก</a> | <a href="/sa/staff/sap201/">บันทึกใบรับความต้องการลูกค้า</a><br /> <br />
            </div>
        </div>
</div>


    <script src="/Scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <link href="/Styles/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />

</asp:Content>