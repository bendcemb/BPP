<%@ Page Title="ความเสี่ยงในกระบวนการ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="R01.qm.risks.qm.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="../../../MyStyle.css" rel="stylesheet" />


    <div class="d-flex justify-content-between">


        <h1 class="text-warning">TEST</h1>
    </div>

    <div class="tab-menu">

        <button class="tablinks" onclick="openTab(event, 'Tab1'); return false;">สถานะเอกสาร : อนุมัติแล้ว</button>

        <button class="tablinks" onclick="openTab(event, 'Tab2'); return false;">จัดการ ฉบับร่าง</button>

    </div>

    <div id="Tab1" class="tabcontent">
        <h4 id="lblApprove" class="text-white">บันทึกกระบวนการ วิเคราะห์ความเสี่ยงและโอกาส</h4>
        <%--gridview 1--%>
        <div class="bg-white">
            <asp:GridView runat="server" ID="grv1" AutoGenerateColumns="false" CssClass=" table table-bordered" Font-Size="Small"
                AlternatingRowStyle-CssClass=" bg-opacity-10 bg-dark" HeaderStyle-BackColor="#99ccff">
                <Columns>

                    <asp:BoundField DataField="pprocedure" HeaderText="หมายเลขเอกสาร" />
                    <asp:BoundField DataField="procedurename" HeaderText="ชื่อเอกสาร" />

                    <asp:TemplateField HeaderText="อ้างอิงระเบียบปฏิบัติงาน">
                        <ItemTemplate>
                            <asp:HyperLink ID="proccodeLink" Font-Underline="false" runat="server" Text='<%# Eval("proccode") %>'
                                NavigateUrl='<%# "../../../report/qm/docqm.aspx?&proccode=" + Eval("proccode") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="รายการกระบวนการ">
                        <ItemTemplate>
                            <asp:HyperLink ID="uidprocLink" Font-Underline="false" runat="server" Text='<%# GetLinkText(Eval("uidproc")) %>'
                                NavigateUrl='<%# GetNavigateUrl(Eval("uidrisk")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>





                    <asp:TemplateField HeaderText="รายการวิเคราะห์ความเสี่ยงและโอกาส">
                        <ItemTemplate>
                            <asp:HyperLink ID="uidriskLink" Font-Underline="false" runat="server" Text='<%# GetLinkText2(Eval("uidrisk")) %>'
                                NavigateUrl='<%# GetNavigateUrl2(Eval("uidrisk")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="docstate" HeaderText="สถานะเอกสาร" DataFormatString="อนุมัติแล้ว" />
                    <asp:BoundField DataField="approvedate" HeaderText="วันที่อนุมัติ" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="owner" HeaderText="เจ้าของเอกสาร	" />
                    <asp:BoundField DataField="possessor" HeaderText="ผู้ครอบครอง" />

                 
                </Columns>

            </asp:GridView>
        </div>
    </div>

    <div id="Tab2" class="tabcontent">
        <h4 id="lblDraft" class="text-white">การจัดการข้อมูลความเสี่ยงและโอกาส</h4>
        <div class="bg-white">
            <asp:GridView runat="server" ID="grv2" CssClass="table table-bordered" Font-Size="Small" AutoGenerateColumns="false" HeaderStyle-CssClass="text-center"
                AlternatingRowStyle-CssClass=" bg-opacity-10 bg-dark" HeaderStyle-BackColor="#99ccff">
                <Columns>

                    <asp:TemplateField HeaderText="รหัสกระบวนการ" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hplpproceduregrp" Font-Underline="false" runat="server" Text='<%# Eval("pproceduregrp") %>'
                                NavigateUrl='<%# "/qm/risks/act/p01.aspx?&key=" + Eval("pproceduregrp") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField DataField="proceduregrpname" HeaderText="ชื่อกระบวนการ" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <script src="../../../MyScript.js"></script>


</asp:Content>
