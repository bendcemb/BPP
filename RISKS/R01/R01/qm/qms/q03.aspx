<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="q03.aspx.cs" Inherits="R01.qm.qms.q03" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <h4>บริบทองค์กร (QM-Q215)</h4>

    <table class="table table-bordered" style="font-size: small" id="tbl1">
        <tr>
            <th class="w-25">รหัสหมวด</th>
            <td>
                <asp:Label runat="server" ID="lblitem"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>รายละเอียด</th>
            <td>
                <asp:Label runat="server" ID="lblctname"></asp:Label></td>
        </tr>

    </table>

    <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered" AutoGenerateColumns="false" Font-Size="Small" AlternatingRowStyle-CssClass="bg-dark bg-opacity-10"
        HeaderStyle-CssClass="bg-info">
        <Columns>
            <asp:BoundField DataField="ctitem" HeaderText="รหัส" />
            <asp:BoundField DataField="cttype" HeaderText="I/E" />
            <asp:BoundField DataField="ctissue" HeaderText="ปัจจัยที่มีผลต่อองค์กร" />
            <asp:BoundField DataField="ctrisk" HeaderText="ลักษณะความเสี่ยง" />
            <asp:BoundField DataField="ctopportunity" HeaderText="ลักษณะโอกาส" />

            <asp:TemplateField HeaderText="ผู้เกี่ยวข้อง" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <a href='<%# "q05.aspx?code=" + Eval("ctitem") + "&key=" + Eval("ctconcern") %>'>
                        <%# Eval("ctconcern") %>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <%-- <div>

        <button class="btn btn-primary" type="button">เพิ่มความเห็น</button>

    </div>--%>


    <div class="card">
        <div class="card-header">
            <h5>เพิ่มความเห็น</h5>
        </div>
        <div class="card-body">


            <div class="row m-2">
                <div class="row">
                    <label>ผู้บันทึก</label>
                    <asp:TextBox runat="server" ID="txtCreateName" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="row">
                    <label>รายละเอียด</label>
                    <asp:TextBox runat="server" ID="txtNote" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>


            <div class="d-flex justify-content-start m-2">

                <section>
                    <div class="">
                        <label>แนบไฟล์ 1</label>
                        <asp:CheckBox runat="server" ID="cbimg1" Text="ไฟล์รูปภาพ" />
                        <input type="file" class="form-control" />
                    </div>

                    <div class="">
                        <label>แนบไฟล์ 2</label>
                        <asp:CheckBox runat="server" ID="cbimg2" Text="ไฟล์รูปภาพ" />
                        <input type="file" class="form-control" />
                    </div>

                    <div class="">
                        <label>แนบไฟล์ 3</label>
                        <asp:CheckBox runat="server" ID="cbimg3" Text="ไฟล์รูปภาพ" />
                        <input type="file" class="form-control" />

                    </div>
                </section>
                <section class="row ms-3">
                    <div class="row">
                        <label>แนบไฟล์ 1</label>
                        <asp:TextBox runat="server" ID="txtlink1" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="row">
                        <label>แนบไฟล์ 2</label>
                        <asp:TextBox runat="server" ID="txtlink2" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="row">
                        <label>แนบไฟล์ 3</label>
                        <asp:TextBox runat="server" ID="txtlink3" CssClass="form-control"></asp:TextBox>
                    </div>
                </section>

            </div>
        </div>
        <div class="row m-2">
            <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="บันทึกข้อมูล ความเห็น" />
        </div>
    </div>

</asp:Content>
