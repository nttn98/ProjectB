<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="entity.Product"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="css/detailOfProduct.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap"
            rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>

        <%
            Product selectedProduct = (Product) session.getAttribute("selectedProduct");
        %>
        <title><%=selectedProduct.getProductName()%></title>
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <div class="topHeader">
            <div class="container">
                <nav class="menu">
                    <div class="row">
                        <div class="col-12 col-xl-2 col-sm-12 col-md-12 col-lg-12">
                            <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a>
                        </div>
                        <div class="col col-lg-10">
                            <div class="desktopMenu">
                                <ul class="list">
                                    <li class="item-desktop-menu"><a href="aboutUs.jsp">Gi???i thi???u</a></li>
                                    <li class="item-desktop-menu"><a href="LoginServlet?mode=product">S???n ph???m</a></li>
                                    <li class="item-desktop-menu"><a href="address.jsp">??i???m d???ch v???</a></li>
                                    <li class="item-desktop-menu"><a href="discount.jsp">Khuy???n m??i</a></li>
                                    <li class="item-desktop-menu"><a href="news.jsp">Tin t???c</a></li>
                                    <li class="item-desktop-menu">
                                        <%@include file="checkLogin.jsp"%>
                                        <%if (logedUser == null) {%>
                                        <a href="login.jsp"><i class="fa fa-user-o" aria-hidden="true"></i></a>
                                            <%} else {%>
                                        <a href="UpdateCustomerServlet?mode=customerView"><i class="fa fa-user-o" aria-hidden="true"></i></a>
                                            <%}%>
                                    </li>
                                    <li class="item-desktop-menu">
                                        <%@include file="checkLoginheader.jsp"%>
                                    </li>
                                    <li class="item-desktop-menu">
                                        <!--<div class="viewCart">-->
                                        <%@include file="CartHeader.jsp"%>
                                        <!--</div>-->
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <hr>
        <div class="detail-body">
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <div class="imageProduct">
                            <h1><%=selectedProduct.getProductName()%></h1>
                            <img
                                src="productImage\<%=selectedProduct.getProductId()%>.jpg"
                                style="width: 90%"> 
                        </div>
                    </div> 
                    <div class="col-6">
                        <div class="information-Product">
                            <p class="descriptionProduct"><%=selectedProduct.getProductDescription()%></p>
                            Gi??: <strong><%=(int) selectedProduct.getProductPrice()%>.000 ??</strong>
                            <br>
                            <a href= "CartServlet?mode=addCartItem&productId=<%=selectedProduct.getProductId()%>" style="text-decoration: none; color: white"><button class="btn btn-outline-success">Order</button></a>
                            <a href="LoginServlet?mode=homeOnly"><button class="btn btn-outline-success">Back</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <hr>
        <footer>
            <div class="topFooter">
                <div class="list-partners">
                    <div class="container">
                        <h3 class="partner">?????I T??C</h3>
                        <hr color="#898F4B" width="70px" align="center"
                            style="height: 1px;">
                        <div class="row">
                            <div class="col-12 col-xl-3 col-lg-3 col-md-6 col-sm-6">
                                <div class="company">
                                    <img src="images/partner-1.png" alt="partner-1">
                                </div>
                            </div>
                            <div class="col-12 col-xl-3 col-lg-3 col-md-6 col-sm-6">
                                <div class="company">
                                    <img src="images/partner-2.png" alt="partner-2">
                                </div>
                            </div>
                            <div class="col-12 col-xl-3 col-lg-3 col-md-6 col-sm-6">
                                <div class="company">
                                    <img src="images/partner-3.png" alt="partner-3">
                                </div>
                            </div>
                            <div class="col-12 col-xl-3 col-lg-3 col-md-6 col-sm-6">
                                <div class="company">
                                    <img src="images/partner-4.png" alt="partner-4">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="midFooter">
                <div class="contact">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 col-xl-4 col-lg-12 col-md-12 col-sm-12 ">
                                <div class="contact-left"></div>
                            </div>
                            <div class="col-12 col-xl-4 col-lg-12 col-md-12 col-sm-12 ">
                                <form action="">
                                    <div class="form-contact">
                                        <div class="container">
                                            <div class="contact-fix">
                                                <p class="contact-to-buy">Li??n h??? mua h??ng</p>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <img src="images/user-icon.png" alt="user-icon"> <input
                                                            type="text" name="fullName" id="fullName" class="fullName"
                                                            placeholder="H??? V?? T??N">
                                                    </div>
                                                    <div class="col-12">
                                                        <img src="images/email-icon.png" alt="email-icon"> <input
                                                            type="email" name="email-icon" id="email-icon"
                                                            class="email-icon" placeholder="EMAIL">
                                                    </div>
                                                    <div class="col-12">
                                                        <img src="images/phone-contact.png" alt="phone-contact">
                                                        <input type="text" name="phone-contact" id="phone-contact"
                                                               class="phone-contact" placeholder="S??? ??I???N THO???I">
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="subContact">
                                                            <button type="button" class="btn btn-dark">LI??N
                                                                H???</button>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="subHotline">
                                                            <div class="media">
                                                                <img src="images/phone-icon.png" alt="phone-icon">
                                                                <div class="media-body">
                                                                    <p>HOTLINE 24/7</p>
                                                                    <p class="phone-number">090.154.8866</p>
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
                            <div class="col-12 col-xl-4 col-lg-12 col-md-12 col-sm12 ">
                                <div class="contact-right"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
            <div class="scroll-top">
                <div class="scroll-icon">
                    <a href="#" rel="nofollow" title=" "><i class="fa fa-angle-up"
                                                            id="go-top-btn"></i></a>
                </div>
            </div>
        </footer>
        <script type="text/javascript">
            $(window).scroll(function () {
                if ($(this).scrollTop() > 50) {
                    $(".scroll-top").fadeIn();
                } else {
                    $(".scroll-top").fadeOut();
                }
            });

            $(".scroll-top").on("click", function () {
                $("html, body").animate({
                    scrollTop: 0
                },
                        400
                        );
            });
        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
            integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>
    </body>
</html>