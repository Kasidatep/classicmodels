<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ClassicModel Online Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/7e6e2fadf1.js"></script>
    <link href="components/asset/style.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="components/asset/favicon.ico"/>
    <link rel="apple-touch-icon" sizes="180x180" href="components/asset/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="components/asset/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="components/asset/favicon/favicon-16x16.png">
    <link rel="manifest" href="components/asset/favicon/site.webmanifest">
</head>
<body>
<jsp:include page="components/navBar.jsp"/>
<div id="body-content">
    <jsp:include page="components/home-info.html"/>
</div>
<div class="d-flex justify-content-center modal d-none" id="loading">
    <button class="btn" type="button" disabled style="margin-top: 10%; width: 6rem; height: 8rem; background-color: white">
        <span class="spinner-border spinner-border-lg text-dark" role="status" aria-hidden="true"
              style="margin-top: 10%; width: 4rem; height: 4rem;"></span>
        <span class="">Loading...</span>
    </button>
</div>
<div class="modal" tabindex="-1" id="viewCartModal">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Your Cart</h3>
                <button type="button" class="close btn btn-outline-dark" data-dismiss="modal" aria-label="Close"
                        onclick="$('#viewCartModal').modal('hide')">
                    Close
                </button>
            </div>
            <div class="modal-body" id="view-cart">
                <p></p>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <footer class="py-3 my-4">
        <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
            <p>© 2022 KasidatePLUS, All rights reserved.</p>
            <ul class="list-unstyled d-flex">
                <li class="ms-3"><a class="link-dark" href="./"><i class="fa fa-home" aria-hidden="true"></i></a></li>
                <li class="ms-3"><a class="link-dark" href="http://fb.kasp.social"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                <li class="ms-3"><a class="link-dark" href="http://github.kasp.codes"><i class="fa fa-github" aria-hidden="true"></i></a></li>
                <li class="ms-3"><a class="link-dark" style="text-decoration: none" href="https://kasidate.me"><i class="fa fa-at" aria-hidden="true"></i>KASIDATE.ME</a></li>
            </ul>
        </div>
    </footer>
</div>
<script src="components/function.js"></script>
</body>
</html>