<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="q0701.aspx.cs" Inherits="R01.qm.risks.q0701" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .verticalHeaderText {
            writing-mode: vertical-rl; /* การเขียนแนวตั้งทางขวาไปทางซ้าย */
            transform: rotate(360deg); /* หมุนแนวตั้ง 180 องศา (ทำให้หัวข้อเรียงกลับด้าน) */
            text-align: left; /* จัดตำแหน่งข้อความใน Header ให้ชิดซ้าย */
            white-space: nowrap; /* ไม่ตัดข้อความเมื่อเกินขอบคอลัมน์ */
        }

    </style>


    <h4>ใบวิเคราะห์ความเสี่ยง โอกาสและผลกระทบ</h4>

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

    <div style="overflow-x: auto"">
        <asp:GridView runat="server" ID="grv2" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small" 
            HeaderStyle-BackColor="#0066cc" HeaderStyle-CssClass="text-white" HeaderStyle-Wrap="true">
            <Columns>
                <asp:BoundField DataField="pprocess" HeaderText="กระบวนการ" />
                <asp:BoundField DataField="rocontext" HeaderText="บริบท(4.1)" />
                <asp:BoundField DataField="ro" HeaderText="" />
                <asp:BoundField DataField="rodesc" HeaderText="ความเสี่ยง/โอกาส" />
                <asp:BoundField DataField="roimpact" HeaderText="ผลกระทบ" />
                <asp:BoundField DataField="roimpactvalue" HeaderText="S" />
                <asp:BoundField DataField="rocause" HeaderText="สาเหตุ" />
                <asp:BoundField DataField="rooppvalue" HeaderText="O" />
                <asp:BoundField DataField="rocorrection" HeaderText="มาตรการป้องกัน" />
                <asp:BoundField DataField="rodetect" HeaderText="มาตรการตรวจสอบ" />
                <asp:BoundField DataField="rodetectvalue" HeaderText="D" />
                <%--<asp:BoundField DataField="" HeaderText="Score" HeaderStyle-CssClass="verticalHeaderText" />--%>
                <asp:BoundField DataField="score" HeaderText="S c o r e" HeaderStyle-CssClass="verticalHeaderText" />
                <asp:BoundField DataField="ropriorityitem" HeaderText="R A N K" />
                <asp:BoundField DataField="romanage" HeaderText="ข้อเสนอแนะในการจัดการ" />
                <asp:BoundField DataField="roincharge" HeaderText="ผู้รับผิดชอบ/กำหนดเสร็จ" />
                <asp:BoundField DataField="roaction" HeaderText="การดำเนินการที่ได้ทำไปแล้ว" />
                <asp:BoundField DataField="actimpactvalue" HeaderText="S" />
                <asp:BoundField DataField="actoppvalue" HeaderText="O" />
                <asp:BoundField DataField="actdetecvalue" HeaderText="D" />
                <asp:BoundField DataField="r" HeaderText="R" />
                <asp:BoundField DataField="" HeaderText="M" />

            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
