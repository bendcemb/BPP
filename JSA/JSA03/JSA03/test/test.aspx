<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/test/test.aspx.cs" Inherits="JSA03.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#myTab a').on('click', function (e) {
                e.preventDefault()
                $(this).tab('show')
            })
        });
    </script>


    <div class="card mt-2">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs" id="myTab">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#tab1">เอกสารฉบับอนุมัติ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#tab2">เอกสารฉบับร่าง</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#tab3">Option 3</a>
                </li>
            </ul>
        </div>

        <div class="tab-content">
            <div class="tab-pane fade show active" id="tab1">
                <h5 class="card-title">
                    <label></label>
                </h5>
                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos, soluta?</p>
                <div class="card">

                    <div class="card-header">
                        <h5>เลขที่เอกสาร</h5>
                        <label></label>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <span>ผู้จัดทำ</span>
                            <asp:TextBox runat="server" ID="txtCreateBy" CssClass="form-control"></asp:TextBox>
                            <span>หมายเหตุ</span>
                            <asp:TextBox runat="server" ID="txtNote" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-end">
                            <asp:Button runat="server" ID="btnCancle" Text="ยกเลิก" CssClass="btn btn-secondary" />
                            <asp:Button runat="server" ID="btnSave" Text="บันทึก" CssClass="btn btn-success ms-4" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="tab2">
                <h5 class="card-title">Lorem ipsum dolor sit amet consectetur2.</h5>
                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos, soluta?</p>
            </div>
            <div class="tab-pane fade" id="tab3">
                <h5 class="card-title">Lorem ipsum dolor sit amet consectetur3.</h5>
                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos, soluta?</p>
            </div>
        </div>
    </div>


</asp:Content>
