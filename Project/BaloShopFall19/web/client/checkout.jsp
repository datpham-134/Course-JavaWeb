<%-- 
    Document   : checkout
    Created on : Oct 23, 2019, 8:53:51 PM
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
        <title>Thông tin khách hàng</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-8 mt-4">
                    <h4>Danh sách sản phẩm</h4>
                    <c:set var="totalPrice" value="0" scope="page" />
                    <table class="table w-100 mt-3">
                        <tr>
                            <th>STT</th>
                            <th>Hình ảnh</th>   
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng giá</th>
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
                                    ${cart.quantity}                               
                                </td>
                                <td>
                                    <fmt:formatNumber type="currency" value="${cart.productPrice * cart.quantity}" />       
                                </td>
                            </tr>
                            <span class="d-none">${totalPrice = totalPrice + (cart.productPrice * cart.quantity)}</span>
                        </c:forEach>
                    </table>
                    <hr/>
                    <div class="text-right">
                        <h4>Tổng tiền: <fmt:formatNumber type="currency" value="${totalPrice}" /> </h4>
                    </div>
                </div>
                <div class="col-md-4 mt-4 pl-5">
                    <h4>Thông tin khách hàng</h4>
                    <div class="card mt-3">
                        <div class="card-body">
                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="name">Họ và tên</label>
                                    <input type="text" class="form-control" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="mobile">Số điện thoại</label>
                                    <input type="text" class="form-control" name="mobile">
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ</label>
                                    <textarea class="form-control" rows="2" name="address"></textarea>
                                </div>
                                <button type="submit" class="btn btn-success w-100">Xác nhận</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
    </body>
</html>
