<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="q02.aspx.cs" Inherits="R01.qm.qms.q02" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        a {
            text-decoration: none; /* ยกเลิกการขีดเส้นใต้ของลิงก์ */
        }
    </style>

    <h4>บริบทองค์กร (QM-Q215)</h4>

    <table class="table table-bordered" style="font-size: small" id="tbl1">
        <tr>
            <th class="w-25">รหัสหมวด</th>
            <td>
                <asp:Label runat="server" ID="lblitem"></asp:Label>             
            </td>
        </tr>
        <tr>
            <th>รายละเอียด</th>
            <td>
                <asp:Label runat="server" ID="lblctname"></asp:Label></td>
        </tr>


    </table>

    <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small" AlternatingRowStyle-CssClass="bg-dark bg-opacity-10"
        HeaderStyle-CssClass="bg-info">
        <Columns>
            <asp:BoundField DataField="ctitem" HeaderText="รหัส" />
            <asp:BoundField DataField="cttype" HeaderText="I/E" />
            <asp:BoundField DataField="ctissue" HeaderText="ปัจจัยที่มีผลต่อองค์กร" />
            <asp:BoundField DataField="ctrisk" HeaderText="ลักษณะความเสี่ยง" />
            <asp:BoundField DataField="ctopportunity" HeaderText="ลักษณะโอกาส" />
            <%--<asp:BoundField DataField="ctconcern" HeaderText="ผู้เกี่ยวข้อง" />--%>

            <asp:TemplateField HeaderText="ผู้เกี่ยวข้อง" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <a href='<%# "q05.aspx?code=" + Eval("ctitem") + "&key=" + Eval("ctconcern") %>'>
                        <%# Eval("ctconcern") %>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <a href='<%# "q03.aspx?item=" + Eval("ctitem") %>'>
                        <img src="../../img/icons-1.11.3/icons/file-earmark-text.svg" alt="link">
                    </a>
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>

</asp:Content>
