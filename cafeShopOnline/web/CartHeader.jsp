<style>
    div.viewCart{
        margin-top: 10px;
    }
    div.viewCart > span{
        margin-top:10px;
        margin-left: 660px
    }
</style>


<%@page import="entity.Cart"%>
<%
    Cart myCart = (Cart) session.getAttribute("myCart");
    out.print("<a href=" + "CartServlet?mode=viewCart" + "><img src=" + "images/cartIcon.png" + " style=" + "width:35px" + ">" + myCart.getListItem().size() + " items" + "</a>");

//    out.println("<span>" + myCart.getListItem().size() + " items</span>");

%>
<!--<a href="CartServlet?mode=viewCart">ViewCart</a>-->

