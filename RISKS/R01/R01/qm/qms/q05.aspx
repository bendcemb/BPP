<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="q05.aspx.cs" Inherits="R01.qm.qms.q05" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .checkboxlist {
            list-style: none;
            padding: 0;
        }

            .checkboxlist label {
                /*display: block;*/
                /*margin-bottom: 5px;*/
                margin-left: 5px;
            }

            .checkboxlist input[type="checkbox"] {
                margin-right: 5px;
            }

        #tbl1 tr th {
            width: 25%;
        }
    </style>
    <div class="d-flex justify-content-between">
        <h4>บริบทองค์กร (QM-Q215)</h4>
        <h5 class="text-warning">Test Q05</h5>
    </div>

    <table class="table table-bordered" style="font-size: small" id="tbl1">

        <tr>
            <th>รหัส</th>
            <td>
                <asp:Label runat="server" ID="lblctcode" CssClass="d-none"></asp:Label>
                <asp:HyperLink runat="server" ID="hlctcode" Font-Underline="false"></asp:HyperLink>
            </td>
        </tr>

        <tr>
            <th>ประเด็น</th>
            <td>
                <asp:Label runat="server" ID="lblctname"></asp:Label></td>
        </tr>

        <tr>
            <th>I/E</th>

            <td>
                <asp:Label runat="server" ID="lblIE"></asp:Label></td>
        </tr>

        <tr>
            <th>ปัจจัยที่มีผลต่อองค์กร</th>
            <td>
                <asp:Label runat="server" ID="lblissue"></asp:Label></td>
        </tr>
        <tr>
            <th>ลักษณะความเสี่ยง</th>
            <td>
                <asp:Label runat="server" ID="lblrisk"></asp:Label></td>
        </tr>
        <tr>
            <th>ลักษณะโอกาส</th>
            <td>
                <asp:Label runat="server" ID="lblOpp"></asp:Label></td>
        </tr>
        <tr>
            <th>ผู้เกี่ยวข้อง</th>
            <td>
                <asp:Label runat="server" ID="lblconc"></asp:Label></td>
        </tr>

    </table>


    <h4>ระบุผู้เกี่ยวข้องกับปัจจัยนี้</h4>
    <asp:CheckBoxList runat="server" ID="cblConcern" CssClass="checkboxlist table table-sm" RepeatColumns="5" Font-Size="Small">
    </asp:CheckBoxList>
</asp:Content>
