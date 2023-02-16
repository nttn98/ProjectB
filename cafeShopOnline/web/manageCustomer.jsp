<%@page import="entity.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<!doctype html>
<html lang="en">
    <head>
        <title>Manage Customer Page</title>
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link
            href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
            rel='stylesheet' type='text/css'>

        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/manageProduct.css">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <%@include file="checkLogin.jsp"%>
        <%            ArrayList<Customer> listCustomers = (ArrayList<Customer>) request.getAttribute("listCustomers");
        %>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Manage Customer</span>
                    </div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div class="col-12">
                        <a href="managePage.jsp"><button class="btn btn-secondary">Back</button></a>

                        <h3 class="h5 mb-4 text-center">
                            You have
                            <%=listCustomers.size()%>
                            customers.
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
                                        
                                        <%if (logedUser.equals("admin")) {%>
                                            <th colspan="2" style="text-align: center">Function</th>
                                        <%}%>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (int i = 0; i < listCustomers.size(); i++) {
                                    %>
                                    <tr class="alert" role="alert">
                                        <td>
                                            <div class="customerId">
                                                <span><%=listCustomers.get(i).getCustomerId()%></span>
                                            </div>
                                        </td>

                                        <td>
                                            <div class="customerFullName">
                                                <span><%=listCustomers.get(i).getCustomerFullName()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="customerUserName">
                                                <span><%=listCustomers.get(i).getCustomerUserName()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="customerPassword">
                                                <span><%=listCustomers.get(i).getCustomerPassword()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="customerAddress">
                                                <span><%=listCustomers.get(i).getCustomerAddress()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="customerPhone">
                                                <span>0<%=listCustomers.get(i).getCustomerPhone()%></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="customerStatus">
                                                <span><%=listCustomers.get(i).getCustomerStatus()%></span>
                                            </div>
                                        </td>
                                        <%if (logedUser.equals("admin")) {%>
                                        <td><a
                                                href="UpdateCustomerServlet?mode=view&id=<%=listCustomers.get(i).getCustomerId()%>">
                                                <button class="btn btn-info">Update</button>
                                            </a>
                                        </td>
                                        <%if (listCustomers.get(i).getCustomerStatus() == 1) {%>
                                        <td><a
                                                href="ManageCustomerServlet?mode=disable&id=<%=listCustomers.get(i).getCustomerId()%>">
                                                <button class="btn btn-danger">Disable</button>
                                            </a>
                                        </td>
                                    </tr>
                                    <%} else {%>
                                <td><a
                                        href="ManageCustomerServlet?mode=enable&id=<%=listCustomers.get(i).getCustomerId()%>">
                                        <button class="btn btn-success">Enable</button>
                                    </a>
                                </td> 
                                </tr>
                                <%
                                            }
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
                <a href="#" rel="nofollow" title=" "><i class="fa fa-angle-up" id="go-top-btn"></i></a>
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

