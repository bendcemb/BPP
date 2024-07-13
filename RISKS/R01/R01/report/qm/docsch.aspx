<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="docsch.aspx.cs" Inherits="R01.report.qm.docsch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="btn-group">
        <asp:TextBox runat="server" ID="txtSearch"></asp:TextBox>
        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-warning" Text="ค้นหา" />
    </div>

    <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered mt-3" Font-Size="Small" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
        OnPageIndexChanging="grv1_PageIndexChanging" RowStyle-Wrap="false" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle CssClass="custom-pager" />
        <Columns>
            <asp:BoundField DataField="Job_Name" HeaderText="กิจกรรม" />
            <%--<asp:BoundField DataField="Doc_Code" HeaderText="รหัสเอกสาร"/>--%>

            <asp:TemplateField HeaderText="รหัสเอกสาร">
                <ItemTemplate>
                    <asp:HyperLink ID="hplDoc_Code" Font-Underline="false" runat="server" Text='<%# Eval("Doc_Code") %>'
                        NavigateUrl='<%# "../../qm/proc/p01.aspx?&Doc_Code=" + Eval("Doc_Code") %>' />
                </ItemTemplate>

            </asp:TemplateField>

            <asp:BoundField DataField="Doc_Name" HeaderText="ชื่อเอกสาร" />
            <asp:BoundField DataField="Doc_Rev" HeaderText="ทบทวน" DataFormatString="{0:00}" ItemStyle-CssClass="text-center" />
            <asp:BoundField DataField="Doc_Date" HeaderText="วันที่มีผล" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Dept" HeaderText="หน่วยงาน" />
            <asp:BoundField DataField="Doc_Remark" HeaderText="บันทึกการเปลี่ยนแปลง" ItemStyle-CssClass="text-wrap" />

            <%--<asp:BoundField DataField="" HeaderText="..." />--%>
         <%--   <asp:TemplateField HeaderText="...">
                <ItemTemplate>
                    <a id="hplCode" href="#" onclick="changePage('<%# Eval("Doc_Code") %>'); return false;">
                        <img src="/../../img/icons-1.11.3/icons/file-earmark-text.svg" alt="Icon" />
                    </a>
                </ItemTemplate>
            </asp:TemplateField>--%>


            <%--<asp:BoundField DataField="" HeaderText="ประวัติการแก้ไข" />--%>
            <asp:TemplateField HeaderText="ประวัติการแก้ไข">
                <ItemTemplate>
                    <asp:HyperLink ID="hplHist" Font-Underline="false" runat="server" Text="ดูข้อมูล"
                        NavigateUrl='<%# "docqmhist.aspx?code=" + Eval("Doc_Code") %>' />
                </ItemTemplate>

            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <script>
    function changePage(docCode) {
        window.location.href = "qmdoccode.aspx?Doc_Code=" + docCode;
    }
    </script>

</asp:Content>
