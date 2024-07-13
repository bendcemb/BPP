<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="p01.aspx.cs" Inherits="R01.qm.risks.act.p01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #xmargin div {
            margin-left: 4px;
        }
    </style>

    <h4>การจัดการข้อมูล</h4>

    <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered" Font-Size="Small" AutoGenerateColumns="false" HeaderStyle-CssClass="text-center"
        AlternatingRowStyle-CssClass=" bg-opacity-10 bg-dark" HeaderStyle-BackColor="#99ccff" RowStyle-CssClass="text-center">
        <Columns>

            <asp:BoundField DataField="pproceduregrp" HeaderText="รหัสกระบวนการ" />
            <asp:BoundField DataField="proceduregrpname" HeaderText="ชื่อกระบวนการ" />
        </Columns>
    </asp:GridView>


    <asp:GridView runat="server" ID="grv2" CssClass="table table-bordered" Font-Size="Smaller" AutoGenerateColumns="false" HeaderStyle-CssClass="text-center"
        AlternatingRowStyle-CssClass="" HeaderStyle-BackColor="#99ccff" OnRowDataBound="grv2_RowDataBound" AlternatingRowStyle-Wrap="false">
        <Columns>

            <asp:BoundField DataField="pprocedure" HeaderText="หมายเลขเอกสาร" />
            <asp:BoundField DataField="procedurename" HeaderText="ชื่อเอกสาร" ItemStyle-CssClass="text-wrap" />
            <%--<asp:BoundField DataField="refno" HeaderText="อ้างอิงระเบียบปฏิบัติงาน" ItemStyle-CssClass="text-wrap" />--%>

            <asp:TemplateField HeaderText="อ้างอิงระเบียบปฏิบัติงาน" ItemStyle-CssClass="text-center text-wrap">
                <ItemTemplate>
                    <asp:HyperLink ID="hplref" Font-Underline="false" runat="server" Text='<%# Eval("refno")%>'
                        NavigateUrl='<%# "../../../report/qm/docsch.aspx?&key=" + Eval("proccode") %>' />
                     
                </ItemTemplate>
            </asp:TemplateField>


            <%--<asp:BoundField DataField="" HeaderText="รายการกระบวนการ" />--%>
            <asp:TemplateField HeaderText="รายการกระบวนการ" ItemStyle-CssClass="text-center text-wrap">
                <ItemTemplate>
                    <asp:HyperLink ID="hplEdit" Font-Underline="false" runat="server" Text="Link"
                        NavigateUrl='<%# "/qm/risks/q0702.aspx?&key=" + Eval("pprocedure") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <%--<asp:BoundField DataField="" HeaderText="รายการวิเคราะห์ความเสี่ยงและโอกาส" />--%>
            <asp:TemplateField HeaderText="รายการวิเคราะห์ความเสี่ยงและโอกาส" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <asp:HyperLink ID="hplEdit" Font-Underline="false" runat="server" Text="Link"
                        NavigateUrl='<%# "/qm/risks/q0701.aspx?&key=" + Eval("pprocedure") %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <%--<asp:BoundField DataField="docstate" HeaderText="สถานะเอกสาร" />--%>

            <asp:TemplateField HeaderText="สถานะเอกสาร" ItemStyle-CssClass="text-wrap">
                <ItemTemplate>
                    <%# Eval("docstate").ToString() == "0" ? "ฉบับร่าง" : "ขึ้นทะเบียนแล้ว" %>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:BoundField DataField="proccode" HeaderText="" Visible="false" />
            <asp:BoundField DataField="approvedate" HeaderText="วันที่อนุมัติ" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="owner" HeaderText="เจ้าของเอกสาร" />
            <asp:BoundField DataField="possessor" HeaderText="ผู้ครอบครอง" />
            <asp:BoundField DataField="" HeaderText="หมายเหตุ" />
            <asp:BoundField DataField="createdate" HeaderText="Create Date" DataFormatString="{0:dd/MM/yyyy}" Visible="false" ItemStyle-CssClass="text-wrap" />
            <asp:BoundField DataField="editdate" HeaderText="บันทึกล่าสุด" DataFormatString="{0:dd/MM/yyyy HH:mm}" ItemStyle-CssClass="text-wrap" />

            <asp:TemplateField HeaderText="" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <asp:HyperLink ID="hplEdit" Font-Underline="false" runat="server" Text="แก้ไข"
                        NavigateUrl='<%# GetEditUrl(Eval("pprocedure"), Eval("docstate")) %>'
                        Visible='<%# Eval("docstate").ToString() == "0" %>' />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>



    <div class="card">
      

        <div class="card-header bg-dark text-white text-center">
            <p>Admin Menu</p>
        </div>
        <div class="card-body d-flex justify-content-start flex-wrap bg-dark text-white" id="xmargin">

            <div>
                <label>หมายเลขเอกสาร</label>
                <asp:TextBox runat="server" ID="pprocedure" CssClass="form-control"></asp:TextBox>
            </div>

            <div>

                <label>ชื่อเอกสาร</label>
                <asp:TextBox runat="server" ID="procedurename" CssClass="form-control"></asp:TextBox>
            </div>

            <div>
                <label>รหัส pproceduregrp</label>
                <asp:TextBox runat="server" ID="pproceduregrp" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <label>สถานะเอกสาร</label>
                <asp:TextBox runat="server" ID="docstate" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <label>รหัส proccode</label>
                <asp:TextBox runat="server" ID="proccode" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <label>procrev</label>
                <asp:TextBox runat="server" ID="procrev" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <label>วันที่อนุมัติ</label>
                <asp:TextBox runat="server" ID="approvedate" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <%--   <div>
                <label>uidproc</label>
                <asp:TextBox runat="server" ID="uidproc" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <label>uidrisk</label>
                <asp:TextBox runat="server" ID="uidrisk" CssClass="form-control"></asp:TextBox>
            </div>--%>
            <div>
                <label>เจ้าของเอกสาร</label>
                <%--<asp:TextBox runat="server" ID="owner" CssClass="form-control"></asp:TextBox>--%>
                <asp:DropDownList runat="server" ID="ddlowner" CssClass="form-control"></asp:DropDownList>
            </div>
            <div>
                <label>ผู้ครอบครอง</label>
                <%--<asp:TextBox runat="server" ID="possessor" CssClass="form-control"></asp:TextBox>--%>
                <asp:DropDownList runat="server" ID="ddlpossessor" CssClass="form-control"></asp:DropDownList>
            </div>
            <div>
                <label>หมายเหตุ</label>
                <asp:TextBox runat="server" ID="premark" CssClass="form-control" Width="100%"></asp:TextBox>
            </div>
        </div>
        <div class="card-footer bg-dark text-white">
            <div class="row">
                <asp:Button runat="server" ID="btnSave" CssClass="btn btn-warning" Text="เพิ่มเอกสารใหม่" OnClick="btnSave_Click" />
            </div>
        </div>

    </div>


</asp:Content>
