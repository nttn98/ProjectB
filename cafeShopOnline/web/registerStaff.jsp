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
        <title>Register Page</title>
    </head>
    <script language="javascript">
        function validateForm() {
            let staffFullName = document.forms["myForm"]["staffFullName"].value;
            if (staffFullName === "") {
                alert("Name must be filled out");
                return false;
            }

            // 	name.match("^[A-Za-z]{1,20}, [A-Za-z]{1,20}, [A-Za-z]{1,20}")
            let staffUserName = document.forms["myForm"]["staffUserName"].value;
            if (staffUserName === "") {
                alert("Username must be filled out");
                return false;
            }
            let staffPassword = document.forms["myForm"]["staffPassword"].value;
            if (staffPassword === "") {
                alert("Password must be filled out");
                return false;
            }
            let staffAddress = document.forms["myForm"]["staffAddress"].value;
            if (staffAddress === "") {
                alert("Address must be filled out");
                return false;
            }
            let staffPhone = document.forms["myForm"]["staffPhone"].value;
            if (staffPhone === "") {
                alert("Phone must be filled out");
                return false;
            }
        }
    </script>
    <body style="background-image: url(images/product-bg.png);">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Register Staff</span>
                </div>
            </div>
            <br>
            <div class="col-md-12">
                <a href="ManageStaffServlet?mode=view"><button class="btn btn-secondary">Back</button></a>
            </div>
        </div>
        <div class="register-page">
            <div class="form">
                <form class="form-register" action="RegisterStaffServlet"
                      method="POST" onsubmit="return validateForm()" name="myForm">
                    <input type="hidden" name="mode" value="edit">
                    <div class="container">
                        <div class="main-body">
                            <div class="row gutters-sm">
                                <div class="col-md-8">
                                    <div class="card mb-3">
                                        <div class="card-body"> 
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Full Name</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="staffFullName" class="form-control validate"/>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Username</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="staffUserName" class="form-control validate"/>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Password</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="password" name="staffPassword" class="form-control validate"/>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Address</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="text" name="staffAddress" class="form-control validate"/>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Phone</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <input type="tel" name="staffPhone" class="form-control validate"/>
                                                    <input type="hidden" name="staffStatus" value=1 class="form-control validate"/>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <button type="submit" value="Submit" class="btn btn-success">Register</button>
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