<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="docqmhist.aspx.cs" Inherits="R01.report.qm.docqmhist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .new-line {
            white-space: pre-line;
        }
    </style>

    <h4>ประวัติการแก้ไข</h4>
    <asp:Label runat="server" ID="lblCode"></asp:Label>
    <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small"
        AlternatingRowStyle-Wrap="false" HeaderStyle-Wrap="false" AlternatingRowStyle-CssClass="bg-opacity-10 bg-dark" HeaderStyle-BackColor="#99ccff"
        HeaderStyle-CssClass="text-center">
        <Columns>

            <%--<asp:BoundField DataField="doc_id" HeaderText="รหัสเอกสาร" />--%>
            <asp:TemplateField HeaderText="รหัสเอกสาร">
                <ItemTemplate>
                    <asp:HyperLink ID="hplDoc_Code" Font-Underline="false" runat="server" Text='<%# Eval("doc_id") %>'
                        NavigateUrl='<%# "qmdinfo.aspx?&doc_id=" + Eval("doc_id") %>' />

                </ItemTemplate>

            </asp:TemplateField>

            <asp:BoundField DataField="Doc_Rev" HeaderText="แก้ไข" ItemStyle-CssClass="text-center" />
            <asp:BoundField DataField="Doc_Date" HeaderText="วันที่อนุมัติ" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-CssClass="text-center" />
            <asp:BoundField DataField="Doc_Name" HeaderText="ชื่อเอกสาร" ItemStyle-CssClass="text-center" />
            <asp:BoundField DataField="Doc_Remark" HeaderText="บันทึกการเปลี่ยนแปลง" ItemStyle-CssClass="new-line" ItemStyle-Width="50%" />

            <%--<asp:BoundField DataField="reqid" HeaderText="เลขที่คำขอ" ItemStyle-CssClass="text-center" />--%>
            <asp:TemplateField HeaderText="รหัสเอกสาร">
                <ItemTemplate>
                    <asp:HyperLink ID="hplDoc_Code" Font-Underline="false" runat="server" Text='<%# Eval("reqid") %>'
                        NavigateUrl='<%# "../doccenter/answer.aspx?&id=" + Eval("reqid") %>' />

                </ItemTemplate>

            </asp:TemplateField>


        </Columns>
    </asp:GridView>

</asp:Content>
