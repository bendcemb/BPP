<%@ Page Title="ใบรับความต้องการลูกค้า (SA-F207)" Language="VB" MasterPageFile="~/ReportSAN.master" %>
<%@Import Namespace = "System.Data" %>
<%@Import Namespace = "System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration.ConfigurationManager" %>
<%@ Import Namespace = "System.IO" %>

<script runat="server">
    Sub UploadFile(Fileupload As Object, fid As String)
        Dim FileFullName As String = Fileupload.PostedFile.FileName
        Dim FileNameInfo As String = Path.GetFileName(FileFullName)
        Dim extension As String = Path.GetExtension(FileNameInfo)
        If FileNameInfo <> "" Then
            Dim virpath As String = "attfiles/"
            Dim temppath As String = Server.MapPath(virpath)
            Dim dr As New DirectoryInfo(temppath)
            If dr.Exists = False Then
                dr.Create()
            End If
            Fileupload.PostedFile.SaveAs(temppath & "/" & fid & extension)
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim issave As Boolean = False
        issave = IIf(FileUpload2.PostedFile.FileName = "", False, True)
        If Not issave Then
            issave = IIf(note_.Text = "", False, True)
        End If
        If issave Then
            savedata()
        End If
    End Sub
    Sub savedata()
        Dim a01 As String = Request.QueryString("sid")
        Dim a05 As String = Request.ServerVariables("REMOTE_ADDR")
        Dim a07 As Date = Now
        Dim a08 As String = ""
        Dim a10 As String = ""
        Dim a11 As String = note_.Text
        Dim FileFullName As String = FileUpload2.PostedFile.FileName
        Dim FileNameInfo As String = Path.GetFileName(FileFullName)
        Dim extension As String = Path.GetExtension(FileNameInfo)
        If FileNameInfo <> "" Then
            Dim g As Guid
            g = Guid.NewGuid()
            UploadFile(FileUpload2, g.ToString)
            a08 = FileNameInfo
            a10 = g.ToString & extension
        End If
        Dim strconn As String = ConnectionStrings("misdb").ConnectionString
        Dim myconn As New SqlConnection(strconn)
        Dim strsql As String
        strsql = "insert into [saf207Doc] (saf207id,orgfilename,updfilename,filenote,username,createdate) values (@p01,@p08,@p10,@p11,@p05,@p07)"
        Dim myCommand As New SqlCommand(strsql, myconn)
        myCommand.Parameters.Add("p01", Data.SqlDbType.VarChar).Value = a01
        myCommand.Parameters.Add("p05", Data.SqlDbType.VarChar).Value = a05
        myCommand.Parameters.Add("p07", Data.SqlDbType.DateTime).Value = a07
        myCommand.Parameters.Add("p08", Data.SqlDbType.VarChar).Value = a08
        myCommand.Parameters.Add("p10", Data.SqlDbType.VarChar).Value = a10
        myCommand.Parameters.Add("p11", Data.SqlDbType.VarChar).Value = a11
        myCommand.Connection.Open()
        myCommand.ExecuteNonQuery()
        myconn.Close()
        Response.Redirect("upldoc.aspx?sid=" & a01)

    End Sub

    Dim TotalUnitPrice As Integer = 0
    Function GetUnitItem(ByVal Price As Integer) As Integer
        TotalUnitPrice += 1
        Return TotalUnitPrice
    End Function


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:misdb %>" SelectCommand="SELECT * FROM [saf207Doc] WHERE (([saf207id] = @cumactid) AND ([void] = @void)) ORDER BY [id] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="cumactid" QueryStringField="sid" Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="void" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:misdb %>" SelectCommand="SELECT *,DATEDIFF(d, createdate, GETDATE()) AS dur FROM [qsaf207] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="sid" Type="Int32" />
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

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-sm table-striped">
                  <Columns>
                <asp:TemplateField HeaderText="ลำดับ" FooterStyle-Font-Bold="True">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <FooterStyle HorizontalAlign="Center" />
                    <ItemTemplate>
<%# GetUnitItem(1)  %>
                    </ItemTemplate>
                </asp:TemplateField>
                      <asp:BoundField DataField="orgfilename" HeaderText="ชื่อไฟล์" SortExpression="orgfilename" />
                      <asp:BoundField DataField="filenote" HeaderText="รายละเอียดเพิ่มเติม" SortExpression="filenote" />
                <asp:TemplateField HeaderText="วันที่บันทึก" SortExpression="createdate">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("createdate", "{0:dd/MM/yyyy HH:mm}")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ไฟล์แนบ">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("updfilename", "attfiles/{0}") %>' Text='<%# iif(Eval("updfilename") = "", "", "เปิด") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                  </Columns>
                  <FooterStyle BackColor="White" ForeColor="#000066" />
                  <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                  <RowStyle ForeColor="#000066" />
                  <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F1F1F1" />
                  <SortedAscendingHeaderStyle BackColor="#007DBB" />
                  <SortedDescendingCellStyle BackColor="#CAC9C9" />
                  <SortedDescendingHeaderStyle BackColor="#00547E" />
              </asp:GridView>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo">แนบไฟล์</button>
                <div id="demo" class="collapse">
                   <div class="row bg-light">
                         <div class="col-md-6 mb-3">
                          <asp:Label ID="Label3" runat="server" CssClass="control-label"  Text="แนบไฟล์"></asp:Label>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FileUpload2" ForeColor="Red" runat="server" ErrorMessage="เลือกไฟล์"></asp:RequiredFieldValidator>
                           <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control"/>
                         </div>
                    </div>
                   <div class="row bg-light">
                        <div class="col-md-12 mb-3">
                           <asp:Label ID="Label7" runat="server" CssClass="control-label"  Text="หมายเหตุ"></asp:Label>
                            <asp:TextBox id = "note_" runat = "server" TextMode="MultiLine" cssclass="form-control" required />
                        </div>
                   </div>
                   <div class="row bg-light">
                       <div class="col-md-12 mb-3">
                            <asp:Button id="button2" class="btn btn-primary btn-block"  onclick="Button1_Click" runat="server" Text="บันทึกไฟล์"></asp:Button>
                       </div>
                 </div>
             </div>
            </div>
        </div>
        <a href="http://bppnet/sa/">กลับไปหน้าหลัก</a> | <a href="/sa/staff/sap201/">บันทึกใบรับความต้องการลูกค้า</a><br /> <br />

    </div>
</asp:Content>

