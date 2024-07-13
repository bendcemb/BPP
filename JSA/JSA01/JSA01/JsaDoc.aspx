<%@ Page Title="JSA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JsaDoc.aspx.cs" Inherits="JSA01.JsaDoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h4>เอกสารวิเคราะห์ความเสี่ยงในพื้นที่ทำงาน</h4>


    
    <asp:GridView runat="server" ID="grv1" AutoGenerateColumns="false" CssClass="table table-bordered" Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="jsa_doc_id" HeaderText="เลขที่เอกสาร" />
            <asp:BoundField DataField="approval_date" HeaderText="วันที่อนุมัติ" />
            <asp:BoundField DataField="section_id" HeaderText="ชื่อหน่วยงาน" />
            <asp:BoundField DataField="create_by" HeaderText="ผู้จัดทำ" />
            <asp:BoundField DataField="status" HeaderText="สถานะเอกสาร" />
            <asp:BoundField DataField="note" HeaderText="หมายเหตุ" />
            <asp:BoundField DataField="create_date" HeaderText="วันที่สร้าง" />
            <asp:BoundField DataField="edit_date" HeaderText="แก้ไขล่าสุด" />

            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:Button runat="server" ID="btnEdit" Text="Edit" CssClass="btn btn-warning"
                        OnClientClick='<%# "openModal(\"" + Eval("jsa_doc_id") + "\"); return false;" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView runat="server" ID="grv2" AutoGenerateColumns="false" CssClass="table table-bordered"  Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="jsa_doc_id" HeaderText="เลขที่เอกสาร" />
            <asp:BoundField DataField="approval_date" HeaderText="วันที่อนุมัติ" />
            <asp:BoundField DataField="section_id" HeaderText="ชื่อหน่วยงาน" />
            <asp:BoundField DataField="create_by" HeaderText="ผู้จัดทำ" />
            <asp:BoundField DataField="status" HeaderText="สถานะเอกสาร" />
            <asp:BoundField DataField="note" HeaderText="หมายเหตุ" />
            <asp:BoundField DataField="create_date" HeaderText="วันที่สร้าง" />
            <asp:BoundField DataField="edit_date" HeaderText="แก้ไขล่าสุด" />

            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:Button runat="server" ID="btnEdit" Text="Edit" CssClass="btn btn-warning" 
                        OnClientClick='<%# "openModal(\"" + Eval("jsa_doc_id") + "\"); return false;" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">แก้ไข เอกสาร</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%--<p>Modal body text goes here.</p>--%>

                    <p>เลขที่เอกสาร : <span id="JsaDocIDDisplay"></span></p>
                    <div>
                        ผู้จัดทำ
                        <asp:TextBox runat="server" ID="txtCreateBy" CssClass="form-control"></asp:TextBox>
                        หมายเหตุ
                        <asp:TextBox runat="server" ID="txtNote" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">บันทึก</button>
                </div>
            </div>
        </div>
    </div>

    <script src="JsaDoc.js"></script>



</asp:Content>
