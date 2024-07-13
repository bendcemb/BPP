<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="p01.aspx.cs" Inherits="R01.qm.proc.p01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        function showDateTime() {
            var now = new Date();

            var options = {
                hour12: false,
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            };
            //var dateTimeString = now.toLocaleString('en-US', options);
            var dateTimeString = now.toLocaleString('en-US'); now.toLocaleString('th-TH', options);
            document.getElementById("datetime").innerHTML = dateTimeString;
        }

        // เรียกใช้ฟังก์ชันทุกๆ 1 วินาที (1000 มิลลิวินาที)
        setInterval(showDateTime, 1000);
    </script>


    <h4>ระเบียบปฏิบัติงาน</h4>

    <asp:GridView runat="server" ID="grv1" CssClass="table table-striped" AutoGenerateColumns="false" Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="refno" HeaderText="เลขที่เอกสาร" />
            <asp:BoundField DataField="editdate" HeaderText="วันที่อนุมัติเอกสาร" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Doc_Code" HeaderText="ระเบียบปฏิบัติงาน" />
            <asp:BoundField DataField="Doc_Name" HeaderText="ชื่อเอกสาร" />
            <%--<asp:BoundField DataField="" HeaderText="ประวัติการแก้ไข" />--%>

            <asp:TemplateField HeaderText="ประวัติการแก้ไข">
                <ItemTemplate>
                    <asp:HyperLink ID="proccodeLink" Font-Underline="false" runat="server" Text="ดูข้อมูล"
                        NavigateUrl='<%# "../../report/qm/docqmhist.aspx?&code=" + Eval("Doc_Code") %>' />
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="วันที่พิมพ์">
                <ItemTemplate>
                    <label id="datetime"></label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <table class="table table-sm table-striped" runat="server" id="tbl1">
        <tr>
            <th>วัตถุประสงค์</th>

        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblpurpose" Font-Size="Small"></asp:Label>
            </td>
        </tr>
    </table>




    <asp:GridView runat="server" ID="grv2" CssClass="table table-bordered" AlternatingRowStyle-CssClass="bg-dark bg-opacity-10" Font-Size="Small" HeaderStyle-BackColor="LightCyan"
        AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="item" HeaderText="ลำดับ" />
            <asp:BoundField DataField="itemdesc" HeaderText="ขอบเขตความรับผิดชอบ" />
            <asp:BoundField DataField="docdesc" HeaderText="รายละเอียดขอบเขต" ItemStyle-CssClass="text-wrap" />



            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="hplprocess" Font-Underline="false" runat="server"  
                        NavigateUrl='<%# "p02.aspx?&refno=" + Eval("refno") + "&id=" + Eval("id") %>'>ขั้นตอน</asp:HyperLink>
                       
               </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>


</asp:Content>
