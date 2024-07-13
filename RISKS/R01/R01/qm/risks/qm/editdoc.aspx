<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editdoc.aspx.cs" Inherits="R01.qm.risks.qm.editdoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* ลบแถบเลื่อนใน TextBox */
        .no-scroll {
            overflow-y: hidden !important;
        }

        /* ปรับแต่ง checkboxlist */
        .custom-checkboxlist {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* ระยะห่างระหว่างรายการ */
        }

            /* ลักษณะของ Checkbox และ Label */
            .custom-checkboxlist label {
                align-items: center;
                cursor: pointer;
                margin-left: 5px;
                margin-right: 10px;
            }

                /* ปรับสีตัวอักษรของ CheckBoxList */
                .custom-checkboxlist label span {
                    color: #333333;
                    font-weight: bold;
                }

            /* เลือก checkbox แล้ว */
            .custom-checkboxlist input[type="checkbox"]:checked + label {
                color: #0026ff; /* สีข้อความเมื่อ checkbox ถูกเลือก */
            }



        .custom-checkbox {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

            .custom-checkbox label {
                display: flex;
                flex-wrap: wrap;
            }
    </style>



    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <h4>แก้ไขข้อมูลกระบวนการ</h4>

    <asp:GridView runat="server" ID="grv1" CssClass="table table-bordered" HeaderStyle-BackColor="#0099cc" AutoGenerateColumns="false"
        Font-Size="Small" OnRowDataBound="grv1_RowDataBound">
        <Columns>

            <asp:BoundField DataField="item" HeaderText="ลำดับ" />
            <asp:BoundField DataField="pinput" HeaderText="ข้อมูลนำเข้ากระบวนการ (INPUT)" />
            <asp:BoundField DataField="pprocess" HeaderText="กระบวนการ" />
            <asp:BoundField DataField="poutput" HeaderText="ข้อมูลที่ได้จากกระบวนการ (OUTPUT)" />
            <asp:BoundField DataField="pcontext" HeaderText="บริบท(4.1)" />
            <asp:BoundField DataField="pconcern" HeaderText="ผู้มีส่วนได้ส่วนเสีย(4.2)" />
            <asp:BoundField DataField="prequirement" HeaderText="สิ่งที่คาดหวัง/ข้อกำหนด/เป้าหมาย" />

        </Columns>
    </asp:GridView>

    <%--form control--%>
    <div class="card mb-3 bg-warning bg-opacity-10">

        <div class="card-header d-flex justify-content-between">

            <div class="d-flex justify-content-start">
                <div style="display: flex; align-items: center;">
                    <label class="" style="margin-right: 10px;">ลำดับ</label>
                    <div style="width: 50px;">
                        <asp:TextBox runat="server" ID="txtitem" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div>
                <h4>แก้ไขกระบวนการ</h4>
            </div>

<%--            <div class=" d-flex justify-content-center">
                <asp:CheckBox runat="server" ID="cbxvoid" Text="แจ้งลบ" CssClass="custom-checkbox" />
                <label for="cbxvoid"></label>
            </div>--%>

            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="switchvoid" name="darkmode" value="1" runat="server">
                <label class="form-check-label" for="switchvoid">แจ้งลบ</label>
            </div>



        </div>

        <div class="card-body">

            <div class="row d-flex justify-content-around gap-2 m-1 p-2">

                <div class="row">
                    <label>กระบวนการ</label>
                    <asp:TextBox runat="server" ID="txtpprocess" CssClass="form-control" placeholder="กระบวนการ" TextMode="MultiLine"></asp:TextBox>
                </div>

                <div class="row col-6">
                    <label for="txtInput">INPUT</label>
                    <asp:TextBox runat="server" ID="txtInput" CssClass="form-control" placeholder="ข้อมูลนำเข้ากระบวนการ (INPUT)" TextMode="MultiLine"></asp:TextBox>
                </div>

                <div class="row col-6">
                    <label for="txtOutput">OUTPUT</label>
                    <asp:TextBox runat="server" ID="txtOutput" CssClass="form-control" placeholder="ข้อมูลที่ได้จากกระบวนการ (OUTPUT)" TextMode="MultiLine"></asp:TextBox>
                </div>

                <div class="row col-6">
                    <label>บริบท</label>



                    <%--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--%>
                    <asp:TextBox runat="server" ID="txtContext" CssClass="form-control" placeholder="บริบท(4.1)" TextMode="MultiLine"></asp:TextBox>




                    <asp:TextBox runat="server" ID="txtContext2" CssClass="form-control" placeholder="บริบท(4.1)" TextMode="MultiLine" Visible="false"></asp:TextBox>

                    <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-secondary">เลือก บริบท</button>

                </div>

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <div></div>
                                    <h4 class="modal-title text-center">บริบท</h4>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">&times;</button>


                                </div>
                            </div>

                            <div class="modal-body">

                                <%--checkboxlist--%>

                                <asp:CheckBoxList runat="server" ID="cblContext" RepeatColumns="5" Font-Size="Small" CssClass="custom-checkboxlist d-flex justify-content-around"></asp:CheckBoxList>
                                <asp:CheckBoxList runat="server" ID="cblContext2" RepeatColumns="5" Font-Size="Small" Visible="false"></asp:CheckBoxList>



                            </div>
                            <div class="modal-footer">
                                <%--<button type="button" class="btn btn-default" data-dismiss="modal" onclick="xChoose">Close</button>--%>
                                <asp:Button runat="server" ID="btnsavecontext" CssClass="btn btn-primary" Text="save" OnClick="btnsavecontext_Click" OnClientClick="xsave" />
                                <asp:Button runat="server" ID="btnclose" CssClass="btn btn-default" data-dismiss="modal" Text="Close" />
                            </div>
                        </div>

                    </div>
                </div>

                <div class="row col-6">
                    <label>ผู้มีส่วนได้ส่วนเสีย</label>

                    <asp:TextBox runat="server" ID="txtConcern" CssClass="form-control" placeholder="ผู้มีส่วนได้ส่วนเสีย(4.2)" TextMode="MultiLine"></asp:TextBox>
                    <asp:Button runat="server" ID="btnOpenConcern" Text="เลือก ผู้มีส่วนได้ส่วนเสีย" CssClass="btn btn-secondary" />

                </div>

                <div class="row">
                    <label>สิ่งที่คาดหวัง/ข้อกำหนด/เป้าหมาย</label>
                    <asp:TextBox runat="server" ID="txtprequirement" CssClass="form-control" placeholder="สิ่งที่คาดหวัง/ข้อกำหนด/เป้าหมาย" TextMode="MultiLine"></asp:TextBox>

                </div>

            </div>

        </div>

        <div class="card-footer d-flex justify-content-end">
            <asp:Button runat="server" ID="btnSave" CssClass="btn btn-warning" Width="200" Text="บันทึก" OnClick="btnSave_Click" />
        </div>

    </div>







</asp:Content>
