<%@Import Namespace = "System.Data" %>
<%@Import Namespace = "System.Data.SqlClient" %>
<%@ import Namespace="System.Configuration.ConfigurationManager" %>
<%@ Import Namespace = "System.IO" %>
<script language = "VB" runat = "server">
    Public topicclosed As Integer = 1
    Private Sub Page_Load(Sender As Object, E As EventArgs)
        If Not IsPostBack() Then
            dispdata()
        End If
    End Sub
    Sub dispdata()
        Dim strconn As String = ConnectionStrings("misdb").ConnectionString
        Dim strsql As String
        Dim id_ As String = Request.QueryString("id")
        strsql = "SELECT * FROM [saf207] WHERE [id] =" & id_
        Dim myconn As New SqlConnection(strconn)
        Dim myda As New SqlCommand(strsql, myconn)
        myconn.Open()
        Dim ds As SqlDataReader = myda.ExecuteReader()
        If ds.HasRows Then
            While ds.Read()
                txtdoccode.Text = ds.Item("doccode").ToString
                txtdocno.Text = ds.Item("docno").ToString
                txtdocdate.Text = ds.Item("docdate")
                note_.Text = ds.Item("docdesc").ToString
                txtissuer.Text = ds.Item("issuer").ToString
                txtdwg.Text = ds.Item("dwgno").ToString
                txtpartcode.Text = ds.Item("partcode").ToString
                txtpartname.Text = ds.Item("partname").ToString
                txtothinfo.Text = ds.Item("othinfo").ToString
                chkdie.Checked = IIf(ds.Item("diereq") = True, 1, 0)
                chkpart.Checked = IIf(ds.Item("partreq") = True, 1, 0)
                optordmode.SelectedValue = ds.Item("ordmode")
                txtqty.Text = ds.Item("ordqty")
                optper.SelectedValue = ds.Item("ordper").ToString
                txtcurrency.Text = ds.Item("ordcurrency").ToString
                optdelcond.SelectedValue = ds.Item("delcond").ToString
                txtdeldesc.Text = ds.Item("deldesc").ToString
                txtcontact.Text = ds.Item("contactname").ToString
                txtsalesman.Text = ds.Item("salesman").ToString
                txtpack.Text = ds.Item("packdesc").ToString
            End While
        End If
        ds.Close()
        myconn.Close()

    End Sub
    Protected Sub PostWebboard(sender As Object, e As EventArgs)
        If txtdocdate.Text = "" Then
            txtdocdate.Text = DateTime.Today
        End If
        Dim a00 As String = Request.QueryString("id")
        Dim a01 As String = txtname.Text
        Dim a02 As String = txtdocdate.Text
        Dim a03 As String = txtdoccode.Text
        Dim a04 As String = ""
        If DropDownList1.SelectedValue <> "" Then
            a04 = DropDownList1.SelectedValue
        Else
            a04 = txtissuer.Text
        End If
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
        Dim FileFullName As String = ""
        Dim FileNameInfo As String = ""
        Dim extension As String = ""
        If FileNameInfo <> "" Then
            Dim g As Guid
            g = Guid.NewGuid()
            'UploadFile(FileUpload1, g.ToString)
            a08 = FileNameInfo
            a10 = g.ToString & extension
        End If
        Dim strconn As String = ConnectionStrings("misdb").ConnectionString
        Dim myconn As New SqlConnection(strconn)
        Dim strsql As String
        If CheckBox1.Checked Then
            strsql = "update [saf207] set editname=@p01,editdate=@p07,editip=@p11,void=1,voiddate=@p07 where id=@p00"
        Else
            strsql = "update [saf207] set editname=@p01, docdate=@p02, doccode=@p03,docno=@p06, docdesc=@p09,issuer=@p04,editdate=@p07,editip=@p11,dwgno=@p12, partcode=@p13, partname=@p14, othinfo=@p15, diereq=@p16, partreq=@p17, ordmode=@p18, ordqty=@p19, ordper=@p20,ordcurrency=@p21, delcond=@p22, deldesc=@p23, contactname=@p24, salesman=@p25, packdesc=@p26 where id=@p00"
        End If
        Dim myCommand As New SqlCommand(strsql, myconn)
        myCommand.Parameters.Add("p00", Data.SqlDbType.VarChar).Value = a00
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

    <div class="row bg-light">
        <div class="col-md-12 order-md-1">
<h3>แก้ไขเอกสาร</h3>   
            <div class="row">
                <div class="col-md-6">
                   <asp:Label ID="lbidcard" runat="server" CssClass="control-label"  Text="ลบเอกสาร"></asp:Label>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="ยกเลิกเอกสารนี้" CssClass="form-control"/>
                 </div>
            </div>
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
           <div class="row">
                <div class="col-md-12 mb-3">
                  <div style="text-align:center;"><span style="font-size:0.8em;color:blue;">กรณีระบบไม่บันทึกข้อมูลให้ ต้องตรวจสอบว่าป้อนข้อมูลที่จำเป็นครบหรือไม่ ดอกจัน(*)</span></div>
                  <asp:Button id="button2" class="btn btn-primary btn-block"  onclick="PostWebboard" runat="server" Text="บันทึกแก้ไขรายการ"></asp:Button>
                </div>
           </div>
      </div>
    </div>


    <script type="text/javascript" >
        function chkissuer(d) {
            if (d.value == '-') { return; }
            intform1_txtissuer.value = d.value;
        }
        </script>