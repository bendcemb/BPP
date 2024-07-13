<%@ Page Title="รายการกระบวนการ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="q0702.aspx.cs" Inherits="R01.qm.risks.q0702" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>ใบบันทึกรายการงานในกระบวนการ</h4>

    <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small" HeaderStyle-BackColor="#0066cc" HeaderStyle-CssClass=" text-white">
        <Columns>

            <asp:BoundField DataField="pprocedure" HeaderText="หมายเลขเอกสาร" />
            <asp:BoundField DataField="procedurename" HeaderText="ชื่อเอกสาร" />
            <asp:BoundField DataField="refno" HeaderText="อ้างอิงระเบียบปฏิบัติงาน" />

            <%--<asp:BoundField DataField="docstate" HeaderText="สถานะเอกสาร" />--%>
            <asp:TemplateField HeaderText="สถานะ">
                <ItemTemplate>
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# GetStatusText(Eval("docstate")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="approvedate" HeaderText="วันที่อนุมัติ" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="owner" HeaderText="เจ้าของเอกสาร" />
            <asp:BoundField DataField="possessor" HeaderText="ผู้ครอบครอง" />

        </Columns>
    </asp:GridView>

    <asp:GridView runat="server" ID="grv2" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small" HeaderStyle-BackColor="#0066cc" HeaderStyle-CssClass="text-white">
        <Columns>

            <%--<asp:TemplateField HeaderText="ลำดับ">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>--%>

            <asp:BoundField DataField="item" HeaderText="ลำดับ" />
            <asp:BoundField DataField="pinput" HeaderText="ข้อมูลนำเข้ากระบวนการ (INPUT)" />
            <asp:BoundField DataField="pprocess" HeaderText="กระบวนการ" />
            <asp:BoundField DataField="poutput" HeaderText="ข้อมูลที่ได้จากกระบวนการ (OUTPUT)" />
            <asp:BoundField DataField="pcontext" HeaderText="บริบท(4.1)" />
            <asp:BoundField DataField="pconcern" HeaderText="ผู้มีส่วนได้ส่วนเสีย(4.2)" />
            <asp:BoundField DataField="prequirement" HeaderText="สิ่งที่คาดหวัง/ข้อกำหนด/เป้าหมาย" />

            <%--<asp:BoundField DataField="count_row" HeaderText="R/O" />--%>
            <asp:TemplateField HeaderText="R/O">
                <ItemTemplate>
                    <asp:HyperLink ID="hplRO" Font-Underline="false" runat="server" Text='<%# Eval("count_row") %>'
                        NavigateUrl='<%# "q0701.aspx?&pid=" + Eval("pid") + "&key=" + Eval("pprocedure") %>' />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <div class="d-flex justify-content-between">
        <div>
            QM-F242
        </div>
        <div>
            02-16-02-65
        </div>
    </div>

</asp:Content>
