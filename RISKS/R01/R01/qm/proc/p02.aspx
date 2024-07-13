<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="p02.aspx.cs" Inherits="R01.qm.proc.p02" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .x-newline {
            white-space: pre-line;
        }
    </style>

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

    <div>
        <h4>บันทึกกระบวนการตามระเบียบปฏิบัติงาน</h4>
    </div>

    <asp:GridView runat="server" ID="GridView1" CssClass="table table-striped" AutoGenerateColumns="false" Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="refno" HeaderText="เลขที่เอกสาร" />
            <asp:BoundField DataField="editdate" HeaderText="วันที่อนุมัติเอกสาร" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Doc_Code" HeaderText="ระเบียบปฏิบัติงาน" />
            <asp:BoundField DataField="Doc_Name" HeaderText="ชื่อเอกสาร" />
            <asp:BoundField DataField="" HeaderText="ผู้อนุมัติ" />
            <asp:BoundField DataField="" HeaderText="QMM" />


            <asp:TemplateField HeaderText="วันที่พิมพ์">
                <ItemTemplate>
                    <label id="datetime"></label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered" AlternatingRowStyle-CssClass="bg-dark bg-opacity-10" Font-Size="Small" HeaderStyle-BackColor="LightCyan"
        AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="item" HeaderText="ลำดับ" />
            <asp:BoundField DataField="itemdesc" HeaderText="ขอบเขตความรับผิดชอบ" />
            <asp:BoundField DataField="docdesc" HeaderText="รายละเอียดขอบเขต" ItemStyle-CssClass="text-wrap" />

        </Columns>
    </asp:GridView>




    <asp:GridView runat="server" ID="grv2" CssClass="table table-striped" AutoGenerateColumns="false" Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="item" HeaderText="ลำดับ" />
            <asp:BoundField DataField="powner" HeaderText="ผุ้รับผิดชอบ" />
            <asp:BoundField DataField="pinput" HeaderText="INPUT" />
            <asp:BoundField DataField="pprocess" HeaderText="ขั้นตอน" ItemStyle-CssClass="x-newline" />
            <asp:BoundField DataField="poutput" HeaderText="OUTPUT" />
            <asp:BoundField DataField="pcontext" HeaderText="บริบท(4.1)" ItemStyle-CssClass="x-newline" />
            <asp:BoundField DataField="pconcern" HeaderText="ผู้ที่เกี่ยวข้อง(ผู้มีส่วนได้ส่วนเสีย(4.2))" ItemStyle-CssClass="x-newline" />
            <asp:BoundField DataField="prequirement" HeaderText=" สิ่งที่คาดหวัง/ข้อกำหนด/เป้าหมาย" ItemStyle-CssClass="x-newline" />

        </Columns>
    </asp:GridView>

</asp:Content>
