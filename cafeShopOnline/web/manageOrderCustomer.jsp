<%@page import="java.util.Date"%>
<%@page
    import="org.apache.catalina.valves.rewrite.InternalRewriteMap.LowerCase" %>
    <%@page import="entity.Order"%>
    <%@page import="java.util.ArrayList"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

    <!doctype html>
    <html lang="en">
        <head>
            <title>Manage Order Page</title>
            <meta name="viewport"
                  content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link
                href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
                rel='stylesheet' type='text/css'>

            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

            <link rel="stylesheet"
                  href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

            <link rel="stylesheet" href="css/manageProduct.css">
            <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        </head>
        <body style="background-image: url(images/product-bg.png);">
            <%@include file="checkLogin.jsp"%>
            <%                ArrayList<Order> listOrder = (ArrayList<Order>) request.getAttribute("listOrder");
                int countOrder = listOrder.size();
            %>

            <section class="ftco-section">
                <div class="container">
                   <div class="row justify-content-center">
                        <div class="col-12">
                            <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Order History</span>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div
                        style="text-align: center; display: inline-block; margin-bottom: 15px">
                        <a href="LoginServlet?mode=homeOnly" style="text-decoration: none">
                            <button class="btn btn-success">Home</button>
                        </a>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="h5 mb-4 text-center">
                                You have
                                <%=countOrder%>
                                orders.
                            </h3>
                            <div>
                                <table class="table" style="text-align: center">
                                    <thead class="thead-primary">
                                        <tr>
                                            <th>Order Id</th>
                                            <th>Customer Id - Name</th>
                                            <th>Order Total</th>
                                            <th>Order Date</th>
                                            <th>Order Status</th>
                                            <th>Function</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            for (int i = 0; i < listOrder.size(); i++) {
                                        %>
                                        <tr class="alert" role="alert">
                                            <td>
                                                <div class="orderId">
                                                    <span><%=listOrder.get(i).getOrderId()%></span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="customerId">
                                                    <span><%=listOrder.get(i).getCustomerId()%> - <%=listOrder.get(i).getCustomerName()%></span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="orderTotal">
                                                    <span><%=(int) listOrder.get(i).getTotal()%>.000 đ</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="orderDate">
                                                    <span><%=listOrder.get(i).getOrderDate()%></span>
                                                </div>
                                            </td>
                                            <td>
                                                <%if (listOrder.get(i).getOrderStatus() == 0) {%>
                                                <div class="orderStatus">
                                                    <span>Pending</span>
                                                </div>

                                                <%} else {%>
                                                <div class="orderStatus">
                                                    <span>Completed</span>
                                                </div>
                                                <%}%>
                                            </td>
                                            <td>
                                                <a href="OrderServlet?mode=viewOrderDetailCustomer&orderId=<%=listOrder.get(i).getOrderId()%>">
                                                    <button class="btn btn-info">View detail</button>
                                                </a>
                                            </td> 
                                            <%}%>
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

