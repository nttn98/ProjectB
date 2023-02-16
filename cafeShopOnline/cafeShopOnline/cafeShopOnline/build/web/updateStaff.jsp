<%@page import="entity.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/updatePage.css">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <title>Edit Staff Page</title>
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <%@include file="checkLogin.jsp"%>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Update Staff</span>
                </div>
            </div>
            <br>
            <div class="col-md-12">
                <a href="ManageStaffServlet?mode=view"><button class="btn btn-secondary">Back</button></a>
            </div>
        </div>

        <div class="updateStaff-page">
            <div class="form">
                <form action="UpdateStaffServlet" method="POST"
                      enctype="multipart/form-data">
                    <input type="hidden" name="mode" value="edit">
                    <%                                    Staff editStaff = (Staff) request.getAttribute("tempStaff");
                    %>
                    <div class="container">
                        <div class="main-body">
                            <div class="row gutters-sm">
                                <div class="col-md-8">
                                    <div class="card mb-3">
                                        <div class="card-body"> 
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">ID</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="staffId" value="<%=editStaff.getStaffId()%>" readonly="readonly" class="form-control validate"/> 
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Full Name</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="staffFullName" value="<%=editStaff.getStaffFullName()%>" class="form-control validate"/>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Username</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="staffUserName" value="<%=editStaff.getStaffUserName()%>" class="form-control validate"/> 
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Password</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="password" name="staffPassword" value="<%=editStaff.getStaffPassword()%>" class="form-control validate"/> 
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Address</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="staffAddress" value="<%=editStaff.getStaffAddress()%>" class="form-control validate"/> 
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Phone</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="staffPhone" value="0<%=editStaff.getStaffPhone()%>" class="form-control validate"/> 
                                                    <input type="hidden" name="staffStatus" value="<%=editStaff.getStaffStatus()%>" class="form-control validate"/> 
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <button type="submit" value="Submit" class="btn btn-success">Update</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
            integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>
    </body>
</html>