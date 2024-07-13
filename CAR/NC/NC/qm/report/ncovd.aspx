<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ncovd.aspx.cs" Inherits="NC.qm.report.ncovd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../MyStyle.css" rel="stylesheet" />

    <h4>CAR OVERDUE</h4>

    <div>
        <asp:GridView runat="server" ID="grv1" AutoGenerateColumns="false" AlternatingRowStyle-CssClass="bg-secondary bg-opacity-10" HeaderStyle-CssClass="text-bg-info"
            CssClass="table table-bordered" Font-Size="Smaller">
            <Columns>

                <asp:BoundField DataField="car_no" HeaderText="CAR No." />
                <asp:BoundField DataField="item" HeaderText="ลำดับ" />
                <asp:BoundField DataField="prod_name" HeaderText="เรื่อง" />
                <asp:BoundField DataField="detail" HeaderText="รายละเอียด" />
                <asp:BoundField DataField="resp_by" HeaderText="ผู้รับผิดชอบ" />
                <asp:BoundField DataField="due_date" HeaderText="วันที่ครบกำหนด" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="CountDateOVER" HeaderText="เกินกำหนด (วัน)" />
                <asp:BoundField DataField="qm_note" HeaderText="เพิ่มเติม" />
                <asp:BoundField DataField="" HeaderText="เมล์แจ้ง" />

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
