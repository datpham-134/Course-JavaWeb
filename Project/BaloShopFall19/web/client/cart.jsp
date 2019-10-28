<%-- 
    Document   : cart
    Created on : Oct 21, 2019, 8:32:39 PM
    Author     : Shado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="vi_VN" />
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
                        <div class="alert alert-success text-center mt-5 p-3" role="alert">
                            <h5>Giỏ hàng trống.</h5>
                            <a href="get-list-product" class="btn btn-success mt-2"><i class="fas fa-arrow-left mr-2"></i>Quay lại</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="mt-4">
                        <h4>Giỏ hàng</h4>
                        <form action="sync-cart" method="get">
                            <c:set var="totalPrice" value="0" scope="page" />
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
                                        <td>
                                            <fmt:formatNumber type="currency" value="${cart.productPrice}" />
                                        </td>
                                        <td>
                                            <input type="number" class="pl-1" min="1" max="${cart.productQuantity}" name="quantity${track.count}" value="${cart.quantity}" style="width: 60px;">                                
                                        </td>
                                        <td>
                                            <fmt:formatNumber type="currency" value="${cart.productPrice * cart.quantity}" />       
                                        </td>
                                        <td>
                                            <a href="remove-cart?id=${cart.productId}" class="btn btn-danger">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <span class="d-none">${totalPrice = totalPrice + (cart.productPrice * cart.quantity)}</span>
                                </c:forEach>
                            </table>
                            <hr/>
                            <div class="text-right">
                                <h4>Tổng tiền: <fmt:formatNumber type="currency" value="${totalPrice}" /> </h4>
                            </div>
                            <hr/>
                            <div class="text-right">               
                                <a href="remove-cart?id=0" class="btn btn-danger"><i class="fas fa-trash mr-2"></i>Xoá giỏ hàng</a>
                                <button type="submit" class="btn btn-info ml-2"><i class="fas fa-sync-alt mr-2"></i>Cập nhật</button>
                                <a href="checkout" class="btn btn-success ml-2">Tiếp tục<i class="fas fa-arrow-right ml-2"></i></a>
                            </div>
                        </form>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <%@include file="../component/footer.jsp" %>
    </body>
</html>
