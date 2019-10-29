<%-- 
    Document   : navbar
    Created on : Oct 7, 2019, 8:27:08 PM
    Author     : Shado
--%>

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
                <li class="nav-item active">
                    <a class="nav-link" href="get-list-product"><i class="fas fa-home mr-1"></i>Trang chủ <span class="sr-only">(current)</span></a>
                </li>
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
            </ul>
        </div>
    </div>
</nav>
