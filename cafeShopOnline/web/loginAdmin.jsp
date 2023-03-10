
<%@page import="configPkg.ConfigInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        <title>Login Page</title>
        <script>
            function validateForm() {
                let x = document.forms["myForm"]["userName"].value;
                if (x == "") {
                    alert("UserName must be filled out");
                    return false;
                }
                let y = document.forms["myForm"]["userPassword"].value;
                if (y == "") {
                    alert("Password must be filled out");
                    return false;
                }
            }
        </script>
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <!-- 	<h1>Login</h1> -->
        <!-- 	<form action="LoginServlet" method="POST"> -->
        <!-- 		<input type="hidden" name="mode" value="login"> <label>User -->
        <!-- 			Name</label><br> <input type="text" name="userName" /><br> <label>Password:</label><br> -->
        <!-- 		<input type="text" name="userPassword" /><br> <input -->
        <!-- 			type="submit" value="Submit"> -->
        <!-- 	</form> -->
        <!-- 	<a href="register.jsp">Register</a> -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Login For Admin</span>
                </div>
            </div>
        </div>    

        <div class="login-page">
            <div class="form">
                <form class="login-form" action="LoginAdminServlet" method="POST"
                      name="myForm" onsubmit="return validateForm()">
                    <input type="hidden" name="mode" value="login"><br> 
                    <input type="text" placeholder="username" name="userName" /> <br>
                    <input type="password" placeholder="password" name="userPassword" /> <br>
                    <br>
                    <button type="submit" value="Submit">Login</button>
                </form>
                <br> <a href="LoginServlet?mode=homeOnly"><button>Home</button></a>
            </div>
        </div>
    </body>
    <footer>
        <div class="bottomFooter">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-xl-3 col-lg-3 col-md-12 col-sm-12">
                        <div class="logo-footer">
                            <img src="images/logo.png" alt="logo">
                        </div>
                    </div>
                    <div class="col-12 col-xl-3 col-lg-3 col-md-12 col-sm-12">
                        <div class="hotline-footer">
                            <p class="name-company">C??ng ty Vie Deli Vi???t Nam</p>
                            <p>Vie Deli Hanoi:</p>
                            <p class="phonenumber-footer">+84 (0)983 418 935</p>
                            <p>Vie Deli Saigon:</p>
                            <p class="phonenumber-footer">+84 (0)917 850 810</p>
                            <p>viedelicoffee@gmail.com</p>
                        </div>
                    </div>
                    <div class="col-12 col-xl-3 col-lg-3 col-md-12 col-sm-12">
                        <div class="address-footer">
                            <p>?????A CH???</p>
                            <p>
                                <b>H?? N???i:</b>
                            </p>
                            <p>S??? 33 Ng?? 424 Tr???n Kh??t Ch??n, Ph?????ng Ph??? Hu???, Q.Hai B??
                                Tr??ng</p>
                            <p>
                                <b>S??i G??n:</b>
                            </p>
                            <p>29/11 Nguy???n B???nh Khi??m, Ph?????ng ??a Kao, Q1</p>
                        </div>
                    </div>
                    <div class="col-12 col-xl-3 col-lg-3 col-md-12 col-sm-12">
                        <div class="register-footer">
                            <p>????NG K?? NH???N TIN KHUY???N M??I</p>
                            <p class="register-field">
                                <span><img src="images/email-icon.png" alt="email-icon"></span>
                                <input type="gmail" name="gmail" id="gmail" class="gmail"
                                       placeholder="Email c???a b???n">
                            </p>
                            <p class="icon">
                                <i class="fa fa-facebook" aria-hidden="true"></i> <i
                                    class="fa fa-twitter" aria-hidden="true"></i> <i
                                    class="fa fa-google-plus" aria-hidden="true"></i> <i
                                    class="fa fa-pinterest-p" aria-hidden="true"></i>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</html>
