<%-- 
    Document   : sign-in
    Created on : Nov 4, 2019, 9:16:48 PM
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
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/main.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
        <title>Đăng nhập</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card" style="width: 400px; margin-top: 10%; padding: 40px; margin-left: auto; margin-right: auto;">
                        <h2 class="text-center mb-4">SúnStore</h2>
                        
                        <form action="login-process" method="post">
                            <div class="form-group">
                                <label><i class="far fa-envelope fa-fw mr-1"></i>Email address</label>
                                <input type="email" class="form-control" name="email" placeholder="Enter email">
                                <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label><i class="fas fa-key fa-fw mr-1"></i>Password</label>
                                <input type="password" class="form-control" name="password" placeholder="Password">
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input">
                                <label class="form-check-label">Remember password</label>
                            </div>
                            <button type="submit" class="btn btn-success"><i class="fas fa-sign-in-alt fa-fw mr-1"></i>Đăng nhập</button>
                            <a href="#" class="float-right mt-2"><i class="fas fa-edit fa-fw mr-1"></i>Đăng ký</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div style="position: fixed; bottom: 28px; right: 14px; z-index: 9999;">
            <!-- Then put toasts within -->
            <div class="toast toast-error" role="alert" aria-live="assertive" aria-atomic="true" data-delay="5000">
                <div class="toast-header">
                    <strong class="mr-auto">Thông báo</strong>
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body">
                    ${message}
                </div>
            </div>
        </div>

        <%@include file="../component/footer.jsp" %>
        <script>
            <c:if test="${message ne null}">
                $(document).ready(function () {
                    $('.toast-error').toast('show');
                });
            </c:if>
        </script>
        
    </body>
</html>

