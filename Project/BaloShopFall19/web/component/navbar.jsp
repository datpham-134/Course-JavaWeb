<%-- 
    Document   : navbar
    Created on : Oct 7, 2019, 8:27:08 PM
    Author     : Shado
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="get-list-product">SúnStore</a>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                <form class="form-inline my-2 my-lg-0 mr-3" action="search" method="post">
                    <input class="form-control input-text-search" type="text" name="inputSearch" placeholder="Tìm kiếm..." />
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle mr-2" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-shopping-cart mr-1"></i>Giỏ hàng <sup>${sessionScope.listCart.size()}</sup>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:choose>
                            <c:when test="${sessionScope.listCart eq null}">
                                <span class="mx-3">Giỏ hàng trống</span>
                            </c:when>
                            <c:otherwise>
                                <div class="popup-list-cart">
                                    <table>
                                        <c:forEach items="${sessionScope.listCart}" var="cart">
                                            <tr>
                                                <td class="px-2"><img src="assets/images/products/${cart.productImg}"></td>
                                                <td class="f-small"><a href="detail?id=${cart.productId}">${cart.productName}</a></td>
                                                <td class="px-3 f-small">x ${cart.quantity}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="cart">Xem giỏ hàng</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.logined == null}">
                        <li class="nav-item active">
                            <a class="nav-link" href=""><i class="fas fa-edit fa-fw mr-1"></i>Đăng ký</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="login"><i class="fas fa-sign-in-alt fa-fw mr-1"></i>Đăng nhập</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item dropdown">
                            <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user-circle mr-1"></i>${sessionScope.logined.email}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#"><i class="fas fa-user fa-fw mr-2"></i>Trang cá nhân</a>
                                <a class="dropdown-item" href="#"><i class="far fa-file-alt fa-fw mr-2"></i>Đơn hàng</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-history fa-fw mr-2"></i>Lịch sử</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="log-out"><i class="fas fa-sign-out-alt fa-fw mr-2"></i>Đăng xuất</a>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
