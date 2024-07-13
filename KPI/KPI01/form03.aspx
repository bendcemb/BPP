<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form03.aspx.cs" Inherits="KPI01.form03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Form-03</title>
    <link rel="stylesheet" href="form03.css" />
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
</head>
<body>
    <section class="top">
        <div class="open-close">
            <button onclick="toggleB()" class="tooltip">
                |||
                 <span class="tooltiptext">left Menu</span>
            </button>

        </div>
        <div class="user">
            <label>bendcemb</label>
        </div>
        <div class="menu">
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>6</button>
        </div>
    </section>

    <section class="mid">

        <div class="mid-left" id="mid-left">
           <a href="form01.aspx">form01</a>
            <br />
            <label>2-----------</label>
            <br />
            <label>3-----------</label>
            <br />
            <label>4-----------</label>
            <br />
            <label>5-----------</label>
            <br />
            <label>6-----------</label>
            <br />
        </div>

        <div class="mid-mid" id="mid-mid">
            <div>
            </div>
        </div>
        <div class="right" id="right">
            <form id="form1" runat="server">
                <p>Detail</p>
                <div class="input-container">
                    <asp:TextBox ID="txtyr" runat="server" CssClass="text-box" placeholder="Enter text here..."></asp:TextBox>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="text-box"></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="text-box"></asp:TextBox>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="text-box"></asp:TextBox>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="text-box"></asp:TextBox>
                    <button class="btn">Submit</button>
                </div>
            </form>
        </div>

    </section>

    <script src="form03.js"></script>
</body>
</html>
