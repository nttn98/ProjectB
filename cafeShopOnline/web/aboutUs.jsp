<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="entity.Product"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Về chúng tôi</title>
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

        <header>
            <div class="topHeader">
                <div class="container">
                    <nav class="menu">
                        <div class="row">
                            <div class="col-12 col-xl-2 col-sm-12 col-md-12 col-lg-12">
                                <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png" alt="Vie-logo" class="logo"></a>
                            </div>
                            <div class="col col-lg-10">
                                <div class="desktopMenu d-none d-sm-none d-md-none d-lg-none d-xl-block">
                                    <ul class="list">
                                        <li class="item-desktop-menu"><a href="aboutUs.jsp">Giới thiệu</a></li>
                                        <li class="item-desktop-menu"><a href="LoginServlet?mode=product">Sản phẩm</a></li>
                                        <li class="item-desktop-menu"><a href="address.jsp">Điểm dịch vụ</a></li>
                                        <li class="item-desktop-menu"><a href="discount.jsp">Khuyến mãi</a></li>
                                        <li class="item-desktop-menu"><a href="news.jsp">Tin tức</a></li>
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
                                <h2 class="content">Về chúng tôi</h2>
                                <hr color="#898F4B" width="70px" align="center"
                                    style="height: 1px;">
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12">
                                <div class="reason">
                                    <div class="card-group">
                                        <div class="card" style="width: 18rem;">
                                            <div class="card-body">
                                                <h5 class="card-title">Khởi Nguồn</h5>
                                                <p class="card-text">Chúng tôi là một doanh nghiệp xuất phát từ niềm đam mê với cà phê và khao khát lớn nhất của chúng tôi là đem đến cho mọi người cà phê với chất lượng tốt nhất và giá thành phải chăng nhất, phù hợp với tiêu chí cà phê cho mọi nhà</p>                                                
                                            </div>                                           
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12">
                                <img src="images/khoinguon.jpg" alt="Khoinguon" class="aboutUsImg"/>
                            </div>
                            <div class="col-12">
                                <hr color="white" width="70px" align="center"
                                    style="height: 1px;">
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12">
                                <div class="reason">
                                    <div class="card-group">
                                        <div class="card" style="width: 18rem;">
                                            <div class="card-body">
                                                <h5 class="card-title">Dịch vụ khách hàng</h5>
                                                <p class="card-text">Hãy đến với chúng tôi để được trải nghiệm dịch vụ tốt nhất, với đội ngũ nhân viên được đào tạo bài bản và nhiệt huyết. Mang lại cho bạn trải nghiệm không thể quên khi dùng các dịch vụ của chúng tôi</p>                                                
                                            </div>                                           
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12">
                                <img src="images/dichvu.jpg" alt="Dichvu" class="aboutUsImg"/>
                            </div>
                            <div class="col-12">
                                <hr color="white" width="70px" align="center"
                                    style="height: 1px;">
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12">
                                <div class="reason">
                                    <div class="card-group">
                                        <div class="card" style="width: 18rem;">
                                            <div class="card-body">
                                                <h5 class="card-title">Đối tác kinh doanh</h5>
                                                <p class="card-text"> Hãy tham gia cùng chúng tôi để tạo nên một thị trường với các sản phẩm và dịch vụ tốt nhất, tỉ suất lợi nhuận cạnh tranh, thu hồi vốn nhanh. Tham gia cùng chúng tôi để cùng nhau đạt doanh thu 1 tỷ 1 tháng</p>                                                
                                            </div>                                           
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-4 col-lg-4 col-md- col-sm-12">
                                <img src="images/doitac.jpg" alt="Doitac" class="aboutUsImg"/>
                            </div>
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
                                        <h6 class="location-service">ĐIỂM PHỤC VỤ</h6>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                            elit, sed do eiusmod tempor incididunt ut labore et dolore
                                            magna aliqua. Ut enim ad minim veniam, quis nostrud
                                            exercitation ullamco nisi ut aliquip ex ea commodo consequat.
                                            Duis aute irure dolor in reprehenderit in voluptate velit esse
                                            cilium dolore eu fugiat nulla pariatur. Este natus error sit
                                            voluptatem accusantium doloremque laumagni dvdolore magnam
                                            aliquam quaerat voluptatem.</p>
                                        <!-- 									<span class="more-detail">XEM THÊM <i -->
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
                        <h2 class="content">TIN NỔI BẬT</h2>
                        <hr color="#898F4B" width="70px" align="center"
                            style="height: 1px;">
                        <div class="row">
                            <div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12">
                                <div class="new">
                                    <div class="card">
                                        <img src="images/new-thumbnail-1.jpg" class="card-img-top"
                                             alt="...">
                                        <div class="card-body">
                                            <p class="card-name">TIN NỔI BẬT</p>
                                            <p class="card-title">Viedeli -đại lý phân phối cafe Y5 đã
                                                có mặt tại thành phố Nha Trang</p>
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
                                            <p class="card-name">TIN NỔI BẬT</p>
                                            <p class="card-title">Viedeli -đại lý phân phối cafe Y5 đã
                                                có mặt tại thành phố Nha Trang</p>
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
                                            <p class="card-name">TIN NỔI BẬT</p>
                                            <p class="card-title">Viedeli -đại lý phân phối cafe Y5 đã
                                                có mặt tại thành phố Nha Trang</p>
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
                        <h3 class="partner">ĐỐI TÁC</h3>
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
                                                <p class="contact-to-buy">Liên hệ mua hàng</p>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <img src="images/user-icon.png" alt="user-icon"> <input
                                                            type="text" name="fullName" id="fullName" class="fullName"
                                                            placeholder="HỌ VÀ TÊN">
                                                    </div>
                                                    <div class="col-12">
                                                        <img src="images/email-icon.png" alt="email-icon"> <input
                                                            type="email" name="email-icon" id="email-icon"
                                                            class="email-icon" placeholder="EMAIL">
                                                    </div>
                                                    <div class="col-12">
                                                        <img src="images/phone-contact.png" alt="phone-contact">
                                                        <input type="text" name="phone-contact" id="phone-contact"
                                                               class="phone-contact" placeholder="SỐ ĐIỆN THOẠI">
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="subContact">
                                                            <button type="button" class="btn btn-dark">LIÊN
                                                                HỆ</button>
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
                                <p class="name-company">Công ty Vie Deli Việt Nam</p>
                                <p>Vie Deli Hanoi:</p>
                                <p class="phonenumber-footer">+84 (0)983 418 935</p>
                                <p>Vie Deli Saigon:</p>
                                <p class="phonenumber-footer">+84 (0)917 850 810</p>
                                <p>viedelicoffee@gmail.com</p>
                            </div>
                        </div>
                        <div class="col-12 col-xl-3 col-lg-3 col-md-12 col-sm-12">
                            <div class="address-footer">
                                <p>ĐỊA CHỈ</p>
                                <p>
                                    <b>Hà Nội:</b>
                                </p>
                                <p>Số 33 Ngõ 424 Trần Khát Chân, Phường Phố Huế, Q.Hai Bà
                                    Trưng</p>
                                <p>
                                    <b>Sài Gòn:</b>
                                </p>
                                <p>29/11 Nguyễn Bỉnh Khiêm, Phường Đa Kao, Q1</p>
                            </div>
                        </div>
                        <div class="col-12 col-xl-3 col-lg-3 col-md-12 col-sm-12">
                            <div class="register-footer">
                                <p>ĐĂNG KÝ NHẬN TIN KHUYẾN MÃI</p>
                                <p class="register-field">
                                    <span><img src="images/email-icon.png" alt="email-icon"></span>
                                    <input type="gmail" name="gmail" id="gmail" class="gmail"
                                           placeholder="Email của bạn">
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