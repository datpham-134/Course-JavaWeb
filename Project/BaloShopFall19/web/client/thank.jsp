<%-- 
    Document   : thank
    Created on : Oct 28, 2019, 9:01:50 PM
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
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/main.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
        <title>Cảm ơn</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-success text-center mt-5 p-3" role="alert">
                        <h5>Đơn hàng của bạn đã đượ tiếp nhận. Cảm ơn bạn đã mua hàng.</h5>
                        <a href="get-list-product" class="btn btn-success mt-2"><i class="fas fa-arrow-left mr-2"></i>Tiếp tục mua hàng</a>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
    </body>
</html>

