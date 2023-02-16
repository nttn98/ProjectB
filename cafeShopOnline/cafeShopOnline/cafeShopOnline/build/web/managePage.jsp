<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Home</title>

        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/managePage.css">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        <script type="text/javascript" src="jquery-3.5.1.min.js"></script>
        <title>Manage Page</title>
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <%@include file="checkLogin.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Manage Page List</span>
                </div>
            </div>
            <br>
            <br>
            <div class="managePage-body">
                <div class="row">
                    <div class="col-3"><a href="ManageProductServlet?mode=view" style="margin-left: 40px" class="hover-underline-animation">Product Management</a></div>
                    <div class="col-3"><a href="ManageCustomerServlet?mode=view" class="hover-underline-animation">Customer Management</a></div>
                    <%                                            if (logedUser.equals("admin")) {
                    %>
                    <div class="col-2"><a href="ManageStaffServlet?mode=view" style="margin-left: -25px" class="hover-underline-animation">Staff Management</a></div>
                    <div class="col-3"><a href="OrderServlet?mode=manage" class="hover-underline-animation">Order Management</a></div>
                    <%
                        }
                        ;
                    %>
                    <div class="col-1"><button class="btn btn-success" style=" margin-left: -50px; margin-top: -6px;"}"><a href="LoginAdminServlet?mode=logout">Logout</a></button></div>
                </div>
            </div>
        </div>

    </body>

    <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
        integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
    crossorigin="anonymous"></script>
</body>
</html>