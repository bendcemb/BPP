<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TEST.aspx.cs" Inherits="JSA01.TEST" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="TEST.css" rel="stylesheet" />
    
    <!-- Trigger/Open The Modal -->
   <%-- <button id="myBtn">Open Modal</button>--%>

    <button type="button" id="myBtn" class="btn btn-info" data-toggle="modal" data-target="#BootstrapModal" >Show Modal</button>


    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>Some text in the Modal..</p>
        </div>

    </div>

    <script src="TEST.js"></script>
</asp:Content>
