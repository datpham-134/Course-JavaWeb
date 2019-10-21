<%-- 
    Document   : cart
    Created on : Oct 21, 2019, 8:32:39 PM
    Author     : Shado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Front Awesome -->
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/main.css" rel="stylesheet" type="text/css"/>
        <title>Giỏ hàng</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container">
            <c:choose>
                <c:when test="${sessionScope.listCart eq null || sessionScope.listCart.isEmpty()}">
                    <div class="text-center mt-5">
                        <h4>Giỏ hàng trống.</h4>
                        <a href="get-list-product" class="btn btn-success mt-2">Quay lại</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="mt-4">
                        <h4>Giỏ hàng</h4>
                        <table class="table w-100 mt-3">
                            <tr>
                                <th>STT</th>
                                <th>Hình ảnh</th>   
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng giá</th>
                                <th>Hành động</th>
                            </tr>
                            <c:forEach items="${sessionScope.listCart}" var="cart" varStatus="track">
                                <tr>
                                    <td>${track.count}</td>
                                    <td>
                                        <img src="assets/images/products/${cart.productImg}" style="width: 80px;">
                                    </td>
                                    <td>${cart.productName}</td>
                                    <td>${cart.productPrice}</td>
                                    <td>${cart.quantity}</td>
                                    <td>${cart.productPrice * cart.quantity}</td>
                                    <td>
                                        <a href="remove-cart?flag=1&id=${cart.productId}" class="btn btn-danger">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <hr/>
                        <div class="text-right">
                            <h4>Tổng tiền: 20000000đ</h4>
                        </div>
                        <hr/>
                        <div class="text-right">
                            <a href="remove-cart?flag=0" class="btn btn-danger"><i class="fas fa-trash mr-2"></i>Xoá giỏ hàng</a>
                            <a href="" class="btn btn-success ml-2">Tiếp tục<i class="fas fa-arrow-right ml-2"></i></a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <%@include file="../component/footer.jsp" %>
    </body>
</html>
