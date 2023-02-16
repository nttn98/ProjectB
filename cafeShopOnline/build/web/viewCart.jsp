<%@page import="entity.CartItem"%>
<%@page import="entity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        <title>View cart Page</title>
        <link rel="stylesheet" href="css/viewCart.css">
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <%@include file="checkLogin.jsp" %>
        <%            Cart myCart = (Cart) session.getAttribute("myCart");
        %>

        <%            ArrayList<CartItem> listItem = myCart.getListItem();
            float sum = 0;
            float total = 0;
        %>
        <div class="wrap cf">
            <h1 class="projTitle">Viedeli<span>-Coffee</span> Shopping Cart</h1>
            <div class="heading cf">
                <h1>Giỏ hàng : <%= myCart.getListItem().size()%> sản phẩm </h1>
                <a href="LoginServlet?mode=homeOnly" class="continue">Tiếp tục mua sắm</a>
            </div>
            <div class="cart">
                <ul class="cartWrap">
                    <%for (int i = 0; i < listItem.size(); i++) {
                            sum += listItem.get(i).getSubtotal();
                            total = sum;
                    %>
                    <li class="items odd">
                        <div class="infoWrap"> 
                            <div class="cartSection" style= "width: 700px">
                                <h3><%=listItem.get(i).getProduct().getProductName()%></h3>
                                <%if (listItem.get(i).getProduct().getProductQuantity() == 0) {%>
                                <p> <input type="text"  class="qty" placeholder="0"/> x <%=(int) listItem.get(i).getProduct().getProductPrice()%>.000 đ </p>
                                    <% } else {%>
                                <p style="font-weight: 600; font-size: 15px;"> <input type="text"  class="qty" placeholder="<%=listItem.get(i).getQuantity()%>"/> x <%=(int) listItem.get(i).getProduct().getProductPrice()%>.000 đ </p>
                                    <% }%>
                                    <%if (listItem.get(i).getProduct().getProductQuantity() == 0) { %>
                                <p class="stockStatus" style = "color: #F69679"> Hết hàng</p>
                                <% } else {%>
                                <p class="stockStatus" style = "color: blue"> Còn hàng</p>
                                <% }%>
                            </div>  
                            <div class="prodTotal cartSection">
                                <%if (listItem.get(i).getProduct().getProductQuantity() == 0) {%>
                                <p>0.000 đ</p>
                                <%} else {%>
                                <p><%=(int) (listItem.get(i).getSubtotal())%>.000 đ</p>
                                <% }%>
                            </div>
                            <div class="cartSection removeWrap">
                                <a href="CartServlet?mode=removeCartItem&productId=<%=listItem.get(i).getProduct().getProductId()%>" class="remove">x</a>
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
                        <%if (logedUser != null) {
                                if (myCart.getListItem().size() != 0) {%>
                    <li class="totalRow"><a href="OrderServlet?mode=addOrder" class="btn continue">Đặt hàng</a></li>
                        <% }
                        %>
                    <!--                    <li class="totalRow"><a href="OrderServlet?mode=addOrder" class="btn continue">Đặt hàng</a></li>-->
                    <%
                    } else {
                    %>
                    <li class="totalRow"><a href="login.jsp" class="btn continue">Đăng nhập</a></li>
                        <%
                            }
                        %>

                </ul>
            </div>
        </div>

    </body>
</html>
