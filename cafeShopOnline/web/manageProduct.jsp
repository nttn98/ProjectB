<%@page
    import="org.apache.catalina.valves.rewrite.InternalRewriteMap.LowerCase" %>
    <%@page import="entity.Product"%>
    <%@page import="java.util.ArrayList"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

    <!doctype html>
    <html lang="en">
        <head>
            <title>Manage Product Page</title>
            <meta name="viewport"
                  content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link
                href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
                rel='stylesheet' type='text/css'>
            <link rel="stylesheet" 
                  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
                  integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" 
                  crossorigin="anonymous">


            <link rel="stylesheet"
                  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

            <link rel="stylesheet" href="css/manageProduct.css">
            <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        </head>
        <body style="background-image: url(images/product-bg.png);">
            <%@include file="checkLogin.jsp"%>
            <%            ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listProduct");
                int countProduct = listProduct.size();
            %>

            <section class="ftco-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Manage
                                Product</span>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div style="text-align: center; display: inline-block; margin-bottom: 15px">
                        <a href="newProduct.jsp" style="text-decoration: none">
                            <button class="btn btn-success">New</button>
                        </a> <a href="managePage.jsp" style="text-decoration: none"><button
                                class="btn btn-secondary">Back</button></a>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="h5 mb-4 text-center">
                                You have
                                <%=countProduct%>
                                products.
                            </h3>
                            <div>
                                <table class="table">
                                    <thead class="thead-primary">
                                        <tr>
                                            <th>Images</th>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Classify</th>
                                            <th style="width: 100px;">Price</th>
                                            <th style="width: 10px;">Quantity</th>
                                            <th style="width: 10px;">Status</th>
                                                
                                            <%if (logedUser.equals("admin")) {%>
                                                <th colspan="2" style="text-align: center">Function</th>
                                            <%}%>

                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            for (int i = 0; i < listProduct.size(); i++) {
//                                            listProduct.sort((l1,l2)->{
//                                            int compare = Integer.compare(l1.getProductId(), l2.getProductId());
//                                            return compare;
//                                            });
                                        %>
                                        <tr class="alert" role="alert">
                                            <td style="height: 100px;"><img
                                                    src="productImage\<%=listProduct.get(i).getProductId()%>.jpg"
                                                    style="width: 100%; height: 100px;"></td>
                                            <td>
                                                <div class="productId">
                                                    <span><%=listProduct.get(i).getProductId()%></span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="productName">
                                                    <span><%=listProduct.get(i).getProductName()%></span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="productDescription" style="text-align: left">
                                                    <span><%=listProduct.get(i).getProductDescription()%></span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="productBrand">
                                                    <span><%=listProduct.get(i).getproductBrand()%></span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="productPrice">
                                                    <span><%=(int) listProduct.get(i).getProductPrice()%>.000 đ</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="productQuantity">
                                                    <span><%=listProduct.get(i).getProductQuantity()%></span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="productStatus">
                                                    <span><%=listProduct.get(i).getProductStatus()%></span>
                                                </div>
                                            </td>
                                            <%if (logedUser.equals("admin")) {%>
                                            <td><a
                                                    href="UpdateProductServlet?mode=view&id=<%=listProduct.get(i).getProductId()%>"><button
                                                        class="btn btn-info">Update</button></a></td>
                                                    <%if (listProduct.get(i).getProductStatus() == 1) {%>
                                            <td><a
                                                    href="ManageProductServlet?mode=disable&id=<%=listProduct.get(i).getProductId()%>"><button
                                                        class="btn btn-danger">Disable</button></a></td>
                                        </tr>
                                        <%} else {%>
                                    <td><a
                                            href="ManageProductServlet?mode=enable&id=<%=listProduct.get(i).getProductId()%>"><button
                                                class="btn btn-success">Enable</button></a></td>
                                    </tr>
                                    <%}
                                            }
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="scroll-top">
                <div class="scroll-icon">
                    <a href="#" rel="nofollow" title=" "><i class="fa fa-angle-up" id="go-top-btn"></i></a>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

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

