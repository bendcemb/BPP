<%@ Page Title="บริบทองค์กร" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="R01.qm.qms.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h4>บริบทองค์กร (QM-Q215)</h4>

    <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small" AlternatingRowStyle-CssClass="bg-dark bg-opacity-10"
        HeaderStyle-CssClass="bg-info text-center">
        <Columns>
            <asp:BoundField DataField="ctcode" HeaderText="รหัสหมวด" ItemStyle-CssClass="text-center" />
            <asp:BoundField DataField="ctname" HeaderText="รายละเอียด" />

            <asp:TemplateField ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <a href='<%# "q02.aspx?item=" + Eval("ctcode") %>'>
                        <img src="../../img/icons-1.11.3/icons/file-earmark-text.svg" alt="link">
                    </a>
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>

</asp:Content>
