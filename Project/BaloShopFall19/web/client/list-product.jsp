<%-- 
    Document   : list-product.jsp
    Created on : Oct 2, 2019, 8:56:56 PM
    Author     : Shado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Front Awesome -->
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/main.css" rel="stylesheet" type="text/css"/>

        <title>Sản phẩm</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container">

            <div class="row">
                <!-- Show list category -->
                <div class="col-md-3">
                    <h5 class="mt-5">Danh mục</h5>
                    <div class="category mt-2">
                        <a href="filter?id=0">Tất cả</a>
                        <c:forEach items="${requestScope.listCategory}" var="category">
                            <a href="filter?id=${category.id}">${category.category}</a>
                        </c:forEach>
                    </div>
                    <div class="category mt-5">
                        <a href="#">Hàng mới về<sup><span class="badge badge-info ml-2">NEW</span></sup></a>
                        <a href="#">Hàng hot<sup><span class="badge badge-danger ml-2">HOT</span></sup></a>
                        <a href="#">Hàng đang giảm giá<sup><span class="badge badge-success ml-2">SALE</span></sup></a>
                    </div>
                </div>
                <!-- end -->
                <!-- Show list product -->
                <div class="col-md-9">
                    <h5 class="mt-5">Danh sách sản phẩm</h5>
                    <div class="row mb-5">
                        <c:choose>
                            <c:when test="${requestScope.listProduct.size() == 0}">
                                <div class="col-md-12 mt-2">
                                    <h5>Không tìm thấy sản phẩm nào.</h5>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${requestScope.listProduct}" var="product">
                                    <!-- Show product -->
                                    <div class="col-md-4 mb-3 mt-2">
                                        <div class="card">                          
                                            <img src="assets/images/products/${product.image}" class="card-img-top pt-2" alt="...">
                                            <div class="card-body pt-0 pb-3">
                                                <a href="detail?id=${product.id}" class="card-title text-center mb-1">${product.name}
                                                    <c:if test="${product.status == 2}">
                                                        <sup><span class="badge badge-success ml-1">SALE</span></sup>
                                                    </c:if>
                                                </a>
                                                <p class="text-center my-0">${product.displayPrice}<sup>đ</sup></p>
                                                <p class="text-center my-0">
                                                    <a href=""><i class="fas fa-cart-plus mt-2"></i></a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end -->
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <!--end -->
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
    </body>
</html>