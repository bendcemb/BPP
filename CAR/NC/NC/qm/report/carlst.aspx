<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="carlst.aspx.cs" Inherits="NC.qm.report.carlst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../MyStyle.css" rel="stylesheet" />
    <div class="input-group">
        <div>
            <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="ระบุเลขเอกสาร"></asp:TextBox>
        </div>
        <div class="">
            <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-secondary" Text="ค้นเอกสาร" OnClick="btnSearch_Click" />
        </div>
    </div>

    <ul>
        <li><a href="ncovd.aspx">CAR Overdue</a></li>
        <li><a href="carlst.aspx">การแจ้งให้ออก CAR</a></li>
        <li><a href="carlst.aspx">ดูข้อมูลรายละเอียด ความคืบหน้าการตอบ CAR ในระบบ</a></li>
        <li><a href="carlst.aspx">ระบบงาน CAR</a></li>
    </ul>

    <div>
        <asp:GridView runat="server" ID="grv1" AutoGenerateColumns="false" AlternatingRowStyle-CssClass="bg-secondary bg-opacity-10" HeaderStyle-CssClass="text-bg-info"
            CssClass="table table-bordered" Font-Size="Smaller">

            <Columns>
                <asp:BoundField DataField="car_no" HeaderText="CAR No." HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="eff_date" HeaderText="วันที่เอกสาร" DataFormatString="{0: dd/MM/yyyy}" />
                <asp:BoundField DataField="customer" HeaderText="Customer/Supplier" />
                <asp:BoundField DataField="prod_name" HeaderText="ชื่อเรื่อง/ชื่อสินค้า" />
                <asp:BoundField DataField="p_code" HeaderText="ชื่อเรื่อง/รหัสสินค้า" />
                <asp:BoundField DataField="part_code" HeaderText="ชื่อชิ้นงาน" />
                <asp:BoundField DataField="process_err" HeaderText="ขั้นตอนที่พบปัญหา" />
                <asp:BoundField DataField="cause_date" HeaderText="ตอบสาเหตุ" DataFormatString="{0: dd/MM/yyyy}" />
                <asp:BoundField DataField="" HeaderText="QMR" />
                <asp:BoundField DataField="ncsubject" HeaderText="หมวด" />
                <asp:BoundField DataField="" HeaderText="Why" />
                <asp:TemplateField HeaderText="WD">
                    <ItemTemplate>
                        <asp:Label ID="lblWorkDone" runat="server" Text='<%# Convert.ToInt32(Eval("workdone")) == 0 ? "ok" : Eval("workdone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%-- <asp:BoundField DataField="workdone" HeaderText="WD"/> --%>
                <asp:BoundField DataField="Detail" HeaderText="status" />
                <asp:BoundField DataField="DateDifference" HeaderText="เปิดมาแล้ว (วัน)" />
                <asp:BoundField DataField="" HeaderText="QM-F218" />
            </Columns>

        </asp:GridView>
        <div class="text-center text-warning bg-dark" style="border-radius:20px 20px;">
            <asp:Label Font-Size="Medium" runat="server" ID="lblNoData"></asp:Label>
        </div>
    </div>
</asp:Content>
