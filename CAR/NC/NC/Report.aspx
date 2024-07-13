<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="NC.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>รายงาน</h4>
<%--    <asp:HyperLink runat="server" ID="hplSumA" NavigateUrl="~/qm/report/ncstatus.aspx">สรุปสถานะเอกสารปัญหาและข้อบกพร่อง</asp:HyperLink>
    <br />
    <asp:HyperLink runat="server" ID="hplCarOpen" NavigateUrl="~/qm/report/carlst.aspx">รายงาน CAR</asp:HyperLink>--%>

     <ul>
        <li><a href="qm/report/ncstatus.aspx">สรุปสถานะเอกสารปัญหาและข้อบกพร่อง</a></li>
        <li><a href="qm/report/carlst.aspx">รายงาน CAR</a></li>
    </ul>
</asp:Content>
