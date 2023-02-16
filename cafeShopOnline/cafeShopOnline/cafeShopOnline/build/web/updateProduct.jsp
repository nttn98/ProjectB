<%@page import="entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/addPage.css">
        <link rel="icon" href="images/logo.png" type="image/png" sizes="16x16">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <title>Edit Product Page</title>
    </head>
    <body style="background-image: url(images/product-bg.png);">
        <%@include file="checkLogin.jsp"%>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <a href="LoginServlet?mode=homeOnly"><img src="images/logo.png"></a><span class="text-logo">Update
                        Product</span>
                </div>
            </div>
            <br>
            <br>
            <div style="text-align: center; display: inline-block; margin-bottom: 15px">
                <a href="ManageProductServlet?mode=view" style="text-decoration: none"><button
                        class="btn btn-secondary">Back</button></a>
            </div>
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <form  action="UpdateProductServlet" method="POST"
                               enctype="multipart/form-data">
                            <%                                Product editProduct = (Product) request.getAttribute("tempProduct");
                            %>
                            <input type="hidden" name="mode" value="edit">
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">
                                    <div class="form-group mb-3">
                                        <label for="name">Product ID</label>
                                        <input type="text" name="productId" value="<%=editProduct.getProductId()%>" class="form-control validate" readonly /><br>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="name">Product Name</label>
                                        <input type="text" name="productName" value="<%=editProduct.getProductName()%>" class="form-control validate"/>
                                        <input type="hidden" name="productStatus" value="<%=editProduct.getProductStatus()%>"/>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="category">Category</label>
                                        <input type="text" name="productBrand" value="<%=editProduct.getproductBrand()%>" class="form-control validate"/>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="description">Description</label>
                                        <textarea rows="4" cols="45" name="productDescription" class="form-control validate"><%=editProduct.getProductDescription()%></textarea>
                                    </div>

                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="expire_date">Price</label>
                                            <input type="text" name="productPrice" value="<%=(int) editProduct.getProductPrice()%>" class="form-control validate"/>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="stock" >Quantity </label>
                                            <input type="text" name="productQuantity" value="<%=editProduct.getProductQuantity()%>" class="form-control validate"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                    <div class="tm-product-img-dummy mx-auto">
                                        <img src="productImage\<%=editProduct.getProductId()%>.jpg" style="width: 100%; max-width: 358px; max-height: 240px"> 
                                    </div>
                                    <div class="custom-file mt-3 mb-3">
                                        <input type="file" name="fileImg" id="fileInput" size="50"/>
                                        <!--<input id="fileInput" type="file" style="display:none;" />-->
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-success btn-block text-uppercase">Update Product</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
            integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>
    </body>
</html>