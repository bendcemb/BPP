<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="jsa_doc.aspx.cs" Inherits="JSA03.jsa_doc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="jsa.css" rel="stylesheet" />

    <h4>เอกสารวิเคราะห์ความเสี่ยงในพื้นที่ทำงาน</h4>
    <br />

    <div class="card mt-2">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item">
                    <a class="nav-link active" data-target="#tab1" href="#">รายการฉบับอนุมัติ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-target="#tab2" href="#">รายการฉบับร่าง</a>
                </li>
            </ul>
        </div>
        <div class="card-body">

            <div id="tab1" class="tab-content" style="display: block;">
                <asp:GridView runat="server" ID="grv0" CssClass="table table-sm" AlternatingRowStyle-CssClass="bg-dark bg-opacity-10"
                    HeaderStyle-BackColor="#00cc00" AutoGenerateColumns="false" OnRowCommand="grv0_RowCommand" DataKeyNames="doc_id">
                    <Columns>
                        <asp:BoundField DataField="doc_id" HeaderText="เลขที่เอกสาร" />
                        <asp:BoundField DataField="approval_date" HeaderText="วันที่อนุมัติ	" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="section_id" HeaderText="ชื่อหน่วยงาน" />
                        <asp:BoundField DataField="create_by" HeaderText="ผู้จัดทำ" />
                        <asp:BoundField DataField="doc_status" HeaderText="สถานะเอกสาร" DataFormatString="ฉบับอนุมัติ" />
                        <asp:BoundField DataField="note" HeaderText="หมายเหตุ" />
                        <asp:BoundField DataField="create_date" HeaderText="วันที่สร้าง" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="edit_date" HeaderText="แก้ไขล่าสุด" DataFormatString="{0:dd/MM/yyyy}" />

                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Edit" CssClass="btn btn-warning edit-button" ToolTip="แก้ไข"
                                    OnClientClick='<%# "openModal(\"" + Eval("doc_id") + "\"); return false;" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink runat="server" Text="Hazard" CssClass="btn btn-info hazard-button" ToolTip="Hazard"
                                    NavigateUrl='<%# "~/hazard.aspx?doc_id=" + Eval("doc_id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>

            <div id="tab2" class="tab-content" style="display: none;">
                <asp:GridView runat="server" ID="grv1" CssClass="table table-sm" AlternatingRowStyle-CssClass="bg-dark bg-opacity-10"
                    HeaderStyle-BackColor="#99ccff" AutoGenerateColumns="false" OnRowCommand="grv1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="doc_id" HeaderText="เลขที่เอกสาร" />
                        <asp:BoundField DataField="approval_date" HeaderText="วันที่อนุมัติ	" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="section_id" HeaderText="ชื่อหน่วยงาน" />
                        <asp:BoundField DataField="create_by" HeaderText="ผู้จัดทำ" />
                        <asp:BoundField DataField="doc_status" HeaderText="สถานะเอกสาร" DataFormatString="ฉบับร่าง" />
                        <asp:BoundField DataField="note" HeaderText="หมายเหตุ" />
                        <asp:BoundField DataField="create_date" HeaderText="วันที่สร้าง" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="edit_date" HeaderText="แก้ไขล่าสุด" DataFormatString="{0:dd/MM/yyyy}" />

                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Edit" CssClass="btn btn-warning edit-button" ToolTip="แก้ไข"
                                   
                                OnClientClick='<%# "openModal(\"" + Eval("doc_id") + "\", \"" + Eval("create_by") + "\"); return false;" %>' />

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink runat="server" Text="Hazard" CssClass="btn btn-info hazard-button" ToolTip="Hazard"
                                    NavigateUrl='<%# "~/hazard.aspx?doc_id=" + Eval("doc_id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>


            <div class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">แก้ไข เอกสาร</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">


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
                            <asp:Button runat="server" ID="btnSave" CssClass="btn btn-success" Text="บันทึก" OnClick="btnSave_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script src="jsa.js"></script>
</asp:Content>
