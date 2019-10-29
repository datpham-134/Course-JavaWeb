<%-- 
    Document   : detail
    Created on : Oct 10, 2019, 9:27:28 PM
    Author     : Shado
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/main.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
        <title>Chi tiết</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-6 mt-4">
                    <!-- Full-width images with number text -->
                    <c:forEach items="${requestScope.listImage}" var="image" varStatus="track">
                        <div class="mySlides">
                            <div class="numbertext">${track.count} / ${listImage.size()}</div>
                            <img src="assets/images/products/${image.imageName}" class="w-100">
                        </div>
                    </c:forEach>
                    <!-- Next and previous buttons -->
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>

                    <!-- Thumbnail images -->
                    <div class="row-image">
                        <c:forEach items="${requestScope.listImage}" var="image" varStatus="track">
                            <div class="column">
                                <img class="demo cursor w-100" src="assets/images/products/${image.imageName}" onclick="currentSlide(${track.count})">
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5 mt-5">
                    <div class="product-details">
                        <h3 class="mt-5">${requestScope.product.name}
                            <c:if test="${requestScope.product.status == 2}">
                                <sup><span class="badge badge-success ml-1">SALE</span></sup>
                            </c:if>
                        </h3>
                        <p>Mã sản phẩm: ${requestScope.product.code}</p>
                        <h4 class="mt-3">${requestScope.product.displayPrice}<sup>đ</sup></h4>
                        <a href="add-to-cart?id=${requestScope.product.id}" class="btn btn-outline-danger w-50 mt-4"><i class="fas fa-cart-plus mr-2"></i>Thêm vào giỏ hàng</a>
                        <a href="" class="btn btn-outline-success w-25 mt-4 ml-2">Mua ngay</a>
                        <br>
                        <div class="row">
                            <div class="col-md-12 info">
                                <p class="description bd-t pt-3 mt-4">
                                    <label>Chi tiết sản phẩm</label>
                                <span>${requestScope.product.description}</span>
                                </p>
                                <p class="local bd-t pt-3">
                                    <label>Mua hàng trực tiếp tại cửa hàng</label>
                                    <ul>
                                        <li>133 Thái Hà, Phường Trung Liệt, Q.Đống Đa, Hà Nội</li>
                                        <li>135 Nguyễn Văn Cừ, Phường Ngọc Lâm, Quận Long Biên, Hà Nội</li>
                                    </ul>
                                </p>
                                <p class="refund bd-t pt-3">
                                    <label>Giao hàng và đổi trả</label>
                                    <ul>
                                        <li>Đổi hàng trong vòng 72h</li>
                                        <li>Phí vận chuyển nội thành Hà Nội: 20.000<sup>đ</sup> </li>
                                        <li>Phí vận chuyển ngoại thành/ngoại tỉnh: tùy thuộc vào địa điểm</li>
                                        <li>Thanh toán khi nhận hàng</li>
                                    </ul>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
        <script src="assets/js/gallery.js" type="text/javascript"></script>
    </body>
</html>

