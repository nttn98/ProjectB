<%@page import="entity.Order"%>
<%@page import="entity.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order Detail Page</title>
        <link rel="stylesheet" href="css/viewCart.css">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <%
            Order selectedOrder = (Order) request.getAttribute("selectedOrder");
            int orderId = selectedOrder.getOrderId();
            ArrayList<OrderDetail> listOrderDetails = selectedOrder.getListItems();
        %>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    
                    <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo"> <%=selectedOrder.getOrderDate()%> - Ordered by: <%=selectedOrder.getCustomerName()%></span>
                </div>
            </div>
        </div>
        <div class="wrap cf">
            <div class="cart">
                <ul class="cartWrap">
                    <%
                        float sum = 0, total = 0;
                        for (int i = 0; i < listOrderDetails.size(); i++) {
                            sum += listOrderDetails.get(i).getSubTotal();
                            total = sum;
                    %>
                    <li class="items odd">
                        <div class="infoWrap"> 
                            <div class="cartSection" style= "width: 700px">
                                <h3><%=listOrderDetails.get(i).getProductId()%> - <%=listOrderDetails.get(i).getProductName()%></h3>
                                <p style="font-weight: 600; font-size: 15px;"> <input type="text"  class="qty" placeholder="<%=listOrderDetails.get(i).getQuantity()%>"/> x <%=(int) listOrderDetails.get(i).getPrice()%>.000 đ </p>   
                            </div> 
                            <div class="prodTotal cartSection">
                                <p><%=(int) (listOrderDetails.get(i).getSubTotal())%>.000 đ</p>
                            </div>
                        </div>
                    </li>
                    <% }%> 
                </ul>
            </div>
            <div class="subtotal cf">
                <ul>
                    <li class="totalRow"><span class="label">Tổng tiền hàng</span><span class="value"><%=(int) sum%>.000 đ</span></li>
                    <li class="totalRow final"><span class="label">Tổng cộng</span><span class="value"><%=(int) total%>.000 đ</span></li>
                    <li class="totalRow"><a href="OrderServlet?mode=customerHistoryOrder&customerId=<%=selectedOrder.getCustomerId()%>" class="btn continue">Back</a></li>
                </ul>
            </div>
        </div>
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
