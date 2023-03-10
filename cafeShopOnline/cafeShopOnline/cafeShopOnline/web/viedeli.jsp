<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="entity.Product"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Vie DELI</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link rel="stylesheet" href="css/viedeli.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap"
            rel="stylesheet">
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
    </head>
    <body>
        <%
            ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listProduct");
        %>
        <header>
            <div class="topHeader">
                <div class="container">
                    <nav class="menu">
                        <div class="row">
                            <div class="col-12 col-xl-2 col-sm-12 col-md-12 col-lg-12">
                                <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png" alt="Vie-logo" class="logo"></a>
                            </div>
                            <div class="col col-lg-10">
                                <div class="desktopMenu">
                                    <ul class="list">
                                        <li class="item-desktop-menu"><a href="aboutUs.jsp">Gi???i thi???u</a></li>
                                        <li class="item-desktop-menu"><a href="product.jsp">S???n ph???m</a></li>
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
            <div class="bottomHeader">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-xl-12 col-lg-12">
                            <div class="slidebar-banner">
                                <div id="carouselExampleControls" class="carousel slide"
                                     data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="images/banner.png" class="d-block w-150"
                                                 alt="banner">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="images/banner-2.png" class="d-block w-150"
                                                 alt="banner-2">
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button"
                                            data-target="#carouselExampleControls" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button"
                                            data-target="#carouselExampleControls" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <main>
            <div class="topMain">
                <div class="container">
                    <div class="list-reasons">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="content">T???I SAO CH???N VEHIDELI</h2>
                                <hr color="#898F4B" width="70px" align="center"
                                    style="height: 1px;">
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-4 col-sm-12">
                                <div class="reason">
                                    <div class="card-group">
                                        <div class="card" style="width: 18rem;">
                                            <img src="images/service-icon.png" class="card-img-top"
                                                 alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">CH???T L?????NG CAO</h5>
                                                <p class="card-text">Lorem ipsum, dolor sit amet
                                                    consectetur, adipisicing elit. Quam quasi quo adipisci eum
                                                    blanditiis mollitia repellat tempore natus id quod
                                                    repllendus aliquid placeat cumque, sunt ab provident et
                                                    consequuntur harum.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-4 col-sm-12">
                                <div class="reason">
                                    <div class="card-group">
                                        <div class="card" style="width: 18rem;">
                                            <img src="images/service-icon.png" class="card-img-top"
                                                 alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">??A CH???NG LO???I</h5>
                                                <p class="card-text">Lorem ipsum, dolor sit amet
                                                    consectetur, adipisicing elit. Quam quasi quo adipisci eum
                                                    blanditiis mollitia repellat tempore natus id quod
                                                    repllendus aliquid placeat cumque, sunt ab provident et
                                                    consequuntur harum.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-4 col-sm-12">
                                <div class="reason">
                                    <div class="card-group">
                                        <div class="card" style="width: 18rem;">
                                            <img src="images/service-icon.png" class="card-img-top"
                                                 alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">S???N PH???M T??? NHI??N</h5>
                                                <p class="card-text">Lorem ipsum, dolor sit amet
                                                    consectetur, adipisicing elit. Quam quasi quo adipisci eum
                                                    blanditiis mollitia repellat tempore natus id quod
                                                    repllendus aliquid placeat cumque, sunt ab provident et
                                                    consequuntur harum.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 					<button class="btn-more-reasons">Xem th??m</button> -->
                    </div>
                </div>
            </div>
            <div class="midMain">
                <div class="list-products">
                    <div class="container">
                        <h4>
                            S???n ph???m<span class="dancingScript"> n???i b???t </span>Vie Deli
                            Coffee
                        </h4>
                        <div class="row">
                            <%for (int i = 0; i < listProduct.size(); i++) {
                                    if (listProduct.get(i).getProductStatus() == 1) {%>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-6">
                                <div class="product">
                                    <div class="card" style="width: 18rem;">
                                        <img
                                            src="productImage\<%=listProduct.get(i).getProductId()%>.jpg"
                                            style="max-width: 70%; height: 160px;">
                                        <div class="card-body">
                                            <h5 class="card-name"><%=listProduct.get(i).getProductName()%></h5>
                                            <p class="card-title"><%=listProduct.get(i).getproductBrand()%></p>
                                            <p class="card-price"><%=(int) listProduct.get(i).getProductPrice()%>.000 ??
                                            </p>
                                            <a
                                                href="ProductDetailServlet?productId=<%=listProduct.get(i).getProductId()%>"
                                                style="text-decoration: none; color: white">
                                                <button type="button" class="btn btn-success">
                                                    Detail</button>
                                            </a>

                                            <a href= "CartServlet?mode=addCartItem&productId=<%=listProduct.get(i).getProductId()%>" style="text-decoration: none; color: white">
                                                <button type="button" class="btn btn-success">Add to Cart</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                };
                            %>

                        </div>
                    </div>
                </div>
            </div>
            <div class="anotherMidMain">
                <div class="location">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 col-xl-6 col-lg-12 col-sm-12 col-md-12">
                                <div class="background"></div>
                            </div>
                            <div class="col-12 col-xl-6 col-lg-12 col-sm-12 col-md-12">
                                <div class="detail-service">
                                    <div class="content-service">
                                        <h6 class="location-service">??I???M PH???C V???</h6>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                            elit, sed do eiusmod tempor incididunt ut labore et dolore
                                            magna aliqua. Ut enim ad minim veniam, quis nostrud
                                            exercitation ullamco nisi ut aliquip ex ea commodo consequat.
                                            Duis aute irure dolor in reprehenderit in voluptate velit esse
                                            cilium dolore eu fugiat nulla pariatur. Este natus error sit
                                            voluptatem accusantium doloremque laumagni dvdolore magnam
                                            aliquam quaerat voluptatem.</p>
                                        <!-- 									<span class="more-detail">XEM TH??M <i -->
                                        <!-- 										class="fa fa-chevron-right"></i></span> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottomMain">
                <div class="hot-news">
                    <div class="container">
                        <h2 class="content">TIN N???I B???T</h2>
                        <hr color="#898F4B" width="70px" align="center"
                            style="height: 1px;">
                        <div class="row">
                            <div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12">
                                <div class="new">
                                    <div class="card">
                                        <img src="images/new-thumbnail-1.jpg" class="card-img-top"
                                             alt="...">
                                        <div class="card-body">
                                            <p class="card-name">TIN N???I B???T</p>
                                            <p class="card-title">Viedeli -?????i l?? ph??n ph???i cafe Y5 ????
                                                c?? m???t t???i th??nh ph??? Nha Trang</p>
                                            <p class="card-text">Some quick example text to build on
                                                the card title and make up the bulk of the card's content.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12">
                                <div class="new">
                                    <div class="card">
                                        <img src="images/new-thumbnail-1.jpg" class="card-img-top"
                                             alt="...">
                                        <div class="card-body">
                                            <p class="card-name">TIN N???I B???T</p>
                                            <p class="card-title">Viedeli -?????i l?? ph??n ph???i cafe Y5 ????
                                                c?? m???t t???i th??nh ph??? Nha Trang</p>
                                            <p class="card-text">Some quick example text to build on
                                                the card title and make up the bulk of the card's content.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12">
                                <div class="new">
                                    <div class="card">
                                        <img src="images/new-thumbnail-1.jpg" class="card-img-top"
                                             alt="...">
                                        <div class="card-body">
                                            <p class="card-name">TIN N???I B???T</p>
                                            <p class="card-title">Viedeli -?????i l?? ph??n ph???i cafe Y5 ????
                                                c?? m???t t???i th??nh ph??? Nha Trang</p>
                                            <p class="card-text">Some quick example text to build on
                                                the card title and make up the bulk of the card's content.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
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