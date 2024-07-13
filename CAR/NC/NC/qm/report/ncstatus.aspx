<%@ Page Title="สรุปสถานะเอกสารปัญหาและข้อบกพร่อง" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ncstatus.aspx.cs" Inherits="NC.qm.report.ncstatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h4>สรุปสถานะเอกสารปัญหาและข้อบกพร่อง</h4>

    <%--Year Dropdown--%>
    <div class=" input-group">
        <div class="input-group-text">
            <label>เลือกปี</label>
        </div>

        <div>
            <asp:DropDownList runat="server" ID="ddlYear" CssClass="form-control" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
        </div>
    </div>
    วันที่รายงาน:
    <asp:Label runat="server" ID="lblToday"></asp:Label>


    <%--/Year Dropdown--%>

    <%--gridview--%>
    <asp:GridView runat="server" ID="grv1" CssClass=" table table-sm" Font-Size="Smaller" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#d5eaff" 
        HeaderStyle-BackColor="#3399ff" HeaderStyle-ForeColor="White">
        <Columns>

            <asp:BoundField DataField="subjectid" HeaderText="ลำดับ" NullDisplayText="0" />
            <asp:BoundField DataField="xaction" HeaderText="กิจกรรม" NullDisplayText="0" />
            <asp:BoundField DataField="prvOpen" HeaderText="เปิดปีที่แล้ว" NullDisplayText="0" />
            <asp:BoundField DataField="prvClose" HeaderText="ปิดของปีที่แล้ว" NullDisplayText="0" />
            <asp:BoundField DataField="TYOpen" HeaderText="เปิดปีนี้" NullDisplayText="0" />
            <asp:BoundField DataField="TYClose" HeaderText="ปิดของปีนี้" NullDisplayText="0" />
            <asp:BoundField DataField="NowOpen" HeaderText="เปิดอยู่" NullDisplayText="0" />
            <asp:BoundField DataField="Jan" HeaderText="ม.ค." NullDisplayText="0" />
            <asp:BoundField DataField="Feb" HeaderText="ก.พ." NullDisplayText="0" />
            <asp:BoundField DataField="Mar" HeaderText="มี.ค." NullDisplayText="0" />
            <asp:BoundField DataField="Apr" HeaderText="เม.ย." NullDisplayText="0" />
            <asp:BoundField DataField="May" HeaderText="พ.ค." NullDisplayText="0" />
            <asp:BoundField DataField="Jun" HeaderText="มิ.ย." NullDisplayText="0" />
            <asp:BoundField DataField="Jul" HeaderText="ก.ค." NullDisplayText="0" />
            <asp:BoundField DataField="Aug" HeaderText="ส.ค." NullDisplayText="0" />
            <asp:BoundField DataField="Sep" HeaderText="ก.ย." NullDisplayText="0" />
            <asp:BoundField DataField="Oct" HeaderText="ต.ค." NullDisplayText="0" />
            <asp:BoundField DataField="Nov" HeaderText="พ.ย." NullDisplayText="0" />
            <asp:BoundField DataField="Dec" HeaderText="ธ.ค." NullDisplayText="0" />
            <asp:BoundField DataField="" HeaderText="ยังไม่ตอบสาเหตุ" NullDisplayText="0" />
        </Columns>

    </asp:GridView>
    <%--/gridview--%>
</asp:Content>
