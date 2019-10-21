<%-- 
    Document   : error
    Created on : Oct 10, 2019, 8:28:09 PM
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
        <title>Lỗi</title>
    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-danger text-center mt-5" role="alert">
                        <h5>Page not found!</h5>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
    </body>
</html>
