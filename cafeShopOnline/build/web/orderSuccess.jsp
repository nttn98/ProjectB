<%-- 
    Document   : check
    Created on : Aug 10, 2022, 10:20:20 AM
    Author     : Nhân
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        <title>Check login page</title>
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <script type="text/javascript">
            var count = 3;
            var redirect = "LoginServlet?mode=homeOnly";
            function countDown() {
//		var timer = document.getElementById("timer");
                if (count > 0) {
                    count--;
                    timer.innerHTML = "Đặt hàng thành công sẽ tự động chuyển về trang Home <b>" + count + "</b> giây.";
                    setTimeout("countDown()", 1000);
                } else {
                    window.location.href = redirect;
                }
            }
        </script>
        <style>
            .wrap {
                width: 600px;
                margin: 250px auto;
                padding: 20px;
                border-radius: 10px;
                border: 1px solid #ddd;
                font-size: 20px;
                line-height: 1.3em;
                text-align: center;
            }
        </style>
        <div class="wrap">
            <p id="timer"><script type="text/javascript">countDown();</script></p>
        </div>
    </body>
</html>
