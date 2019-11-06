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

        <div class="container mb-5">
            <div class="row">
                <div class="col-md-12 mt-4 border-dashed py-3 px-4">
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
            </div>
            <div class="row">
                <div class="col-md-8 border-dashed mt-3 py-3 px-4">
                    <h5>Địa chỉ giao hàng</h5>
                    <p>Địa chỉ giao hàng sẽ giao theo thông tin bên dưới:</p>
                    <div class="m-info">
                        <table>
                            <tr>
                                <td>Họ và tên:</td>
                                <td class="pl-2"><b>${accountDetailInfo.name}</b></td>
                            </tr>
                            <tr>
                                <td>Số điện thoại:</td>
                                <td class="pl-2">${accountDetailInfo.mobile}</td>
                            </tr>
                            <tr>
                                <td>Giới tính:</td>
                                <td class="pl-2">${accountDetailInfo.displayGender}</td>
                            </tr>
                            <tr>
                                <td>Địa chỉ:</td>
                                <td class="pl-2">${accountDetailInfo.address}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-4 mt-3 pr-0">
                    <a class="btn btn-outline-danger w-100" href="#"><i class="fas fa-check fa-fw mr-2"></i>Giao đến địa chỉ này</a>
                    <a class="btn btn-outline-info w-100 mt-3" href="#collapseExample" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapseExample">
                        <i class="fas fa-directions fa-fw mr-2"></i>Giao đến địa chỉ khác
                    </a>                  
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 px-0 mt-3">
                    <div class="collapse" id="collapseExample">
                        <h5>Nhập thông tin địa chỉ giao hàng mới</h5>
                        <p>Hàng hóa sẽ được giao đến địa chỉ này sau khi xác nhận.</p>
                        <div class="card mt-3 border-dashed">
                            <div class="card-body">
                                <form action="checkout-order" method="post">
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
                                    <div class="form-group">
                                        <label for="note">Ghi chú</label>
                                        <textarea class="form-control" rows="2" name="note"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-success">Xác nhận</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
    </body>
</html>
