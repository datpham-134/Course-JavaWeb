<%-- 
    Document   : detail
    Created on : Oct 10, 2019, 9:27:28 PM
    Author     : Shado
--%>

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
                <div class="col-md-6">
                    <img src="assets/images/products/${product.image}" class="card-img-top pt-4" alt="...">
                </div>
                <div class="col-md-6 pl-5">
                    <h3 class="mt-5">${product.name}<sup><span class="badge badge-success ml-2">Success</span></sup></h3>
                    <h5 class="mt-3">${product.displayPrice}<sup>đ</sup></h5>
                    <a href="" class="btn btn-danger w-100 mt-4">Thêm vào giỏ hàng</a>
                    <p class="mt-4">${product.description}</p>
                </div>
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
    </body>
</html>

