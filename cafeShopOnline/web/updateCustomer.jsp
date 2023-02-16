<%@page import="entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/updatePage.css">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <title>Edit Customer Page</title>
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <%@include file="checkLogin.jsp"%>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Edit Profile</span>
                </div>
            </div>
            <br>
            <div class="col-md-12">
                <%if (logedUser.equals("admin")) {%>
                <a href="ManageCustomerServlet?mode=view"><button class="btn btn-secondary">Back</button></a>
                <%} else {%>
                <a href="LoginServlet?mode=homeOnly"><button class="btn btn-secondary">Back</button></a>
                <%}%>
            </div>

        </div>

        <div class="updateCustomer-page">
            <div class="form">
                <form action="UpdateCustomerServlet" method="POST"
                      enctype="multipart/form-data">
                    <%if (logedUser.equals("admin")) {%>
                    <input type="hidden" name="mode" value="edit">
                    <%} else {%> 
                    <input type="hidden" name="mode" value="customerEdit">
                    <%
                        };
                        Customer editCustomer = (Customer) request.getAttribute("tempCustomer");
                    %>
                    <div class="container">
                        <div class="main-body">
                            <div class="row gutters-sm">
                                <div class="col-md-8">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <%if (logedUser.equals("admin")) {%>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">ID</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="customerId" value="<%=editCustomer.getCustomerId()%>" class="form-control validate" readonly/>
                                                </div>
                                            </div>
                                            <hr>
                                            <%} else {%>
                                            <input type="hidden" name="customerId" value="<%=editCustomer.getCustomerId()%>" class="form-control validate"/>
                                            <%}%>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Full Name</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="customerFullName" value="<%=editCustomer.getCustomerFullName()%>" class="form-control validate"/>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Username</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="customerUserName" value="<%=editCustomer.getCustomerUserName()%>" class="form-control validate"/> 
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Password</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="password" name="customerPassword" value="<%=editCustomer.getCustomerPassword()%>" class="form-control validate"/> 
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Address</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="customerAddress" value="<%=editCustomer.getCustomerAddress()%>" class="form-control validate"/>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Phone</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="customerPhone" value="0<%=editCustomer.getCustomerPhone()%>" class="form-control validate"/>
                                                    <input type="hidden" name="customerStatus" value="<%=editCustomer.getCustomerStatus()%>" /> 
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