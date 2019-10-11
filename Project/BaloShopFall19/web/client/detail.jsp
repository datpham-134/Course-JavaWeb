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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="assets/css/main.css" rel="stylesheet" type="text/css"/>
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
                    <h3 class="mt-5">${product.name}
                        <c:if test="${product.status == 2}">
                            <sup><span class="badge badge-success ml-1">SALE</span></sup>
                        </c:if>
                    </h3>
                    <p>Mã sản phẩm: ${product.code}</p>
                    <h4 class="mt-3">${product.displayPrice}<sup>đ</sup></h4>
                    <a href="" class="btn btn-danger w-100 mt-4">Thêm vào giỏ hàng</a>
                    <label class="mt-4"><b>Thông tin sản phẩm:</b></label>
                    <p>${product.description}</p>
                </div>
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
        <script src="assets/js/gallery.js" type="text/javascript"></script>
    </body>
</html>

