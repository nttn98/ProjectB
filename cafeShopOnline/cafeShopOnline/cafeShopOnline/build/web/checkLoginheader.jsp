
<style>
    button{
        margin-left: 10px;
        background-color: green;
        color: white;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid green;
    }
    .buttonHistory > a{
        color: white;
        text-decoration: none;
    }
    .buttonHistory {

    }
    ul.login{
        margin-left: -15px;
        padding-left: 0;
        /*border: 1px solid;*/
    }
    li.login-item {
        list-style-type: none;
        position: absolute;
        display: none;
    }
    ul.login:hover > li.login-item {
        display: inline-grid;
        padding: 20px;
        text-decoration: underline;
        height: 20px;
        /*position: fixed;*/
    }
    .logedUser{
        padding-left:5px;
        color: #898E4B;
    }
    .loginUser{
        margin-left: -10px;
    }
</style>
<%
    String logedUsers = (String) session.getAttribute("logedUser");

    if (logedUsers != null) {
        if (!logedUsers.equalsIgnoreCase("admin")) {
            int userId = (int) session.getAttribute("loggedId");
//            out.print("<span>Hello: " + logedUser + "</span>"
//                    + "<a href='LoginServlet?mode=logout'><button>Logout</button></a>");
//            out.print("<button class=" + "buttonHistory" + "><a href='OrderServlet?mode=customerHistoryOrder&customerId=" + userId + "'>Order History</a></button>");
            out.print("<ul class =" + "login" + ">");
            out.print("<span class=" + "logedUser" + ">" + logedUsers + "</span>");
            out.print("<li class= " + "login-item " + "style=" + "margin-left:-87px" + "><a href='LoginServlet?mode=logout'>Logout</a></li>");
            out.print("</ul>");
            out.print("<li class= " + "item-desktop-menu " + "><a href='OrderServlet?mode=customerHistoryOrder&customerId=" + userId + "'>Order History</a></li>");
        } else {
            out.print("<ul class =" + "login" + ">");
            out.print("<span class=" + "logedUser" + ">" + logedUsers + "</span>");
            out.print("<li class= " + "login-item " + "style=" + "margin-left:-87px" + "><a href='LoginServlet?mode=logout'>Logout</a></li>");
            out.print("</ul>");
            out.print("<li class= " + "item-desktop-menu " + "><a href='managePage.jsp'>Manage Page</a></li>");
        }
    } else {
        out.println("<span class=" + "loginUser" + ">Login</span><br>");
    }
%>
