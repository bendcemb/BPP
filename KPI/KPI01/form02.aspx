<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form02.aspx.cs" Inherits="KPI01.form02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>form2</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="form02.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="top-menu">
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>6</button>
            </section>

            <section class="detail">


                <div>
                    <button type="button" onclick="toggleMenu()">|||</button>
                </div>
                <div class="left-menu" id="leftMenu">

                    <div class="lmenu ms-1" id="lmenu">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-1-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M9.283 4.002H7.971L6.072 5.385v1.271l1.834-1.318h.065V12h1.312z" />
                        </svg>
                        left-menu 1
       
                        <br />
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-2-square" viewBox="0 0 16 16">
                            <path d="M6.646 6.24v.07H5.375v-.064c0-1.213.879-2.402 2.637-2.402 1.582 0 2.613.949 2.613 2.215 0 1.002-.6 1.667-1.287 2.43l-.096.107-1.974 2.22v.077h3.498V12H5.422v-.832l2.97-3.293c.434-.475.903-1.008.903-1.705 0-.744-.557-1.236-1.313-1.236-.843 0-1.336.615-1.336 1.306" />
                            <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z" />
                        </svg>
                        left-menu 2
       
                        <br />
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-3-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M9.283 4.002H7.971L6.072 5.385v1.271l1.834-1.318h.065V12h1.312z" />
                        </svg>
                        left-menu 3
       
                        <br />
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-3-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M9.283 4.002H7.971L6.072 5.385v1.271l1.834-1.318h.065V12h1.312z" />
                        </svg>
                        left-menu 4
       
                        <br />
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-3-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M9.283 4.002H7.971L6.072 5.385v1.271l1.834-1.318h.065V12h1.312z" />
                        </svg>
                        left-menu 5
       
                        <br />
                    </div>

                    <div class="smenu ms-1" id="smenu">
                        <!-- Small menu items with tooltips -->
                        <div class="tooltip-container">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-1-circle-fill" viewBox="0 0 16 16">
                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M9.283 4.002H7.971L6.072 5.385v1.271l1.834-1.318h.065V12h1.312z" />
                            </svg>
                            <span class="tooltip-text">Tooltip 1</span>
                        </div>
                        <br />
                        <div class="tooltip-container">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-2-square" viewBox="0 0 16 16">
                                <path d="M6.646 6.24v.07H5.375v-.064c0-1.213.879-2.402 2.637-2.402 1.582 0 2.613.949 2.613 2.215 0 1.002-.6 1.667-1.287 2.43l-.096.107-1.974 2.22v.077h3.498V12H5.422v-.832l2.97-3.293c.434-.475.903-1.008.903-1.705 0-.744-.557-1.236-1.313-1.236-.843 0-1.336.615-1.336 1.306" />
                                <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z" />
                            </svg>
                            <span class="tooltip-text">Tooltip 2</span>
                        </div>
                        <br />
                        <div class="tooltip-container">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-3-circle-fill" viewBox="0 0 16 16">
                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M9.283 4.002H7.971L6.072 5.385v1.271l1.834-1.318h.065V12h1.312z" />
                            </svg>
                            <span class="tooltip-text">Tooltip 3</span>
                        </div>
                        <br />
                    </div>

                </div>

                <div class="mid-detail">
                    mid-detail
                </div>

                <div class="right-detail">
                    right-detail
                </div>

            </section>
            <section class="foot">

                <div>dcdfdfd</div>
            </section>




        </div>
    </form>

    <script>
        function toggleMenu() {
            var leftMenu = document.getElementById('leftMenu');
            if (leftMenu.style.flexBasis !== '3%') {
                leftMenu.style.flexBasis = '3%';
            } else {
                leftMenu.style.flexBasis = '15%';
            }

            var sMenu = document.getElementById('smenu');
            var lMenu = document.getElementById('lmenu');

            if (leftMenu.style.flexBasis === '3%') {
                sMenu.style.display = 'block'; // Show the small menu
                lMenu.style.display = 'none';
            } else {
                sMenu.style.display = 'none'; // Hide the small menu
                lMenu.style.display = 'block';  // Set flex basis to 3%
            }
        }

    </script>

</body>
</html>
