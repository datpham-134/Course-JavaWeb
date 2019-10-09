<%-- 
    Document   : list-product.jsp
    Created on : Oct 2, 2019, 8:56:56 PM
    Author     : Shado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="vi_VN" scope="session"/>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="assets/css/main.css" rel="stylesheet" type="text/css"/>
        <title>Hello, world!</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container">
            
            <div class="row">
                <!-- Show list category -->
                <div class="col-md-3">
                    <h5 class="mt-5">Danh mục</h5>
                    <div class="category mt-3">
                        <c:forEach items="${requestScope.listCategory}" var="category">
                            <a href="filter?id=${category.id}">${category.category}</a>
                        </c:forEach>
                    </div>
                </div>
                <!-- end -->
                <!-- Show list product -->
                <div class="col-md-9">
                    <h5 class="mt-5">Danh sách sản phẩm</h5>
                    <div class="row mb-5">
                        <c:forEach items="${requestScope.listProduct}" var="product">
                            <!-- Show product -->
                            <div class="col-md-4 mb-3 mt-2">
                                <div class="card">                          
                                    <img src="assets/images/products/${product.image}" class="card-img-top pt-4" alt="...">
                                    <div class="card-body pt-0">
                                        <h6 class="card-title text-center mb-1">${product.name}</h6>
                                        <p class="text-center my-0">${product.displayPrice}<sup>đ</sup></p>
                                    </div>
                                </div>
                            </div>
                            <!-- end -->
                        </c:forEach>
                    </div>
                </div>
                <!--end -->
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
    </body>
</html>