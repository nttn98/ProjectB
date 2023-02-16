<%@page import="entity.Staff"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<!doctype html>
<html lang="en">
    <head>
        <title>Manage Staff Page</title>
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link
            href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
            rel='stylesheet' type='text/css'>

        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/manageProduct.css">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <%
            ArrayList<Staff> listStaffs = (ArrayList<Staff>) request.getAttribute("listStaffs");
        %>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Manage Staff</span>
                    </div>
                </div>
                <br>
                <br> 
                <a href="registerStaff.jsp"><button class="btn btn-success">New
                        Staff</button></a> <a href="managePage.jsp"><button class="btn btn-secondary">Back</button></a>
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="h5 mb-4 text-center">
                            You have
                            <%=listStaffs.size()%>
                            staffs.
                        </h3>
                        <div>
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr>
                                        <th>ID</th>
                                        <th style="width: 460px; text-align: center;">Full Name</th>
                                        <th>User Name</th>
                                        <th>Password</th>
                                        <th style="width: 460px; text-align: center;">Address</th>
                                        <th style="width: 160px; text-align: center;">Phone number</th>
                                        <th>Status</th>
                                        <th colspan="2" style="text-align: center">Function</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (int i = 0; i < listStaffs.size(); i++) {
                                    %>
                                    <tr class="alert" role="alert">
                                        <td>
                                            <div class="staffId">
                                                <span><%=listStaffs.get(i).getStaffId()%></span>
                                            </div>
                                        </td>

                                        <td>
                                            <div class="staffFullName">
                                                <span><%=listStaffs.get(i).getStaffFullName()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="staffUserName">
                                                <span><%=listStaffs.get(i).getStaffUserName()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="staffPassword">
                                                <span><%=listStaffs.get(i).getStaffPassword()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="staffAddress">
                                                <span><%=listStaffs.get(i).getStaffAddress()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="staffPhone">
                                                <span>0<%=listStaffs.get(i).getStaffPhone()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="staffStatus">
                                                <span><%=listStaffs.get(i).getStaffStatus()%></span>
                                            </div>
                                        </td>

                                        <td><a
                                                href="UpdateStaffServlet?mode=view&id=<%=listStaffs.get(i).getStaffId()%>"><button
                                                    class="btn btn-info">Update</button></a></td>
                                                <%if (listStaffs.get(i).getStaffStatus() == 1) {%>
                                        <td><a
                                                href="ManageStaffServlet?mode=disable&id=<%=listStaffs.get(i).getStaffId()%>"><button
                                                    class="btn btn-danger">Disable</button></a></td> </tr>
                                                <%} else {%>
                                <td><a
                                        href="ManageStaffServlet?mode=enable&id=<%=listStaffs.get(i).getStaffId()%>"><button
                                            class="btn btn-success">Enable</button></a></td>
                                </tr>

                                <%
                                        }
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="scroll-top">
            <div class="scroll-icon">
                <a href="#" rel="nofollow" title=" "><i class="fa fa-angle-up"
                                                        id="go-top-btn"></i></a>
            </div>
        </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 50) {
                        $(".scroll-top").fadeIn();
                    } else {
                        $(".scroll-top").fadeOut();
                    }
                });

                $(".scroll-top").on("click", function () {
                    $("html, body").animate({scrollTop: 0}, 400);
                });
            });

        </script>
    </body>
</html>

