<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ClassicModel App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/7e6e2fadf1.js"></script>
    <script src="./components/function.js"></script>
    <link href="components/asset/style.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="components/asset/favicon.ico"/>
    <script>
        var thisContent = '';

        function loadOffice(officeCode) {
            thisContent = 'office-list';
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "office-list?officeCode=" + officeCode);
            xhttp.send();
        }

        function loadProduct(page, pageSize = document.getElementById("itemsPage").value) {
            thisContent = 'product-list';
            //alert('page: '+ page + ", size: "+ pageSize)
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "product-list?page=" + page + "&size=" + pageSize);
            xhttp.send();
        }

        function setLoading(on_off) {
            let loading = document.getElementById("loading");
            if (on_off == 'on') {
                loading.classList.remove("d-none");
                loading.classList.add("d-inline");
            } else {
               loading.classList.remove("d-inline");
               loading.classList.add("d-none");
            }
        }

        function search(page) {
            alert('Search from: ' + page);
        }

        function addToCart(productCode) {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                cartInfo = document.getElementById("noOfItemInCart");
                noOfItem = xhttp.responseText;
                //alert("Response = " + noOfItem);
                if (noOfItem > 0) {
                    cartInfo.style.display = 'inline'
                } else {
                    cartInfo.style.display = 'none'
                }
                cartInfo.innerHTML = noOfItem;
            }
            xhttp.open("GET", "add-to-cart?productCode=" + productCode);
            xhttp.send();
        }

        function viewCart() {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                document.getElementById("view-cart").innerHTML = xhttp.responseText;
                $('#viewCartModal').modal('show');
            }
            xhttp.open("GET", "ViewCart.jsp");
            xhttp.send();
        }

        function showLoginForm() {
            $('#modalLoginForm').modal('show');
        }

        function login(userName, password) {
            if (userName == '' || password == '' || userName == undefined) {
                document.getElementById("login-message").innerHTML = "Invalid user name or password !!!";
            }
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                if (xhttp.status == 200) {
                    $('#modalLoginForm').modal('hide');
                    document.getElementById("login-menu").innerHTML = "<i class='bi bi-box-arrow-left'></i> Logout"
                } else if (xhttp.status > 400) {
                    document.getElementById("login-message").innerHTML = xhttp.statusText;
                } else {
                    document.getElementById("login-message").innerHTML = "Wrong user name or password !!!";
                }
            }
            let urlEncodedData = "", urlEncodedDataPairs = [];
            urlEncodedDataPairs.push(encodeURIComponent("userName") + '=' + encodeURIComponent(userName));
            urlEncodedDataPairs.push(encodeURIComponent("password") + '=' + encodeURIComponent(password));
            urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+');
            xhttp.open("POST", "login");
            xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhttp.send(urlEncodedData);
        }

        function loadProduct(page, pageSize = document.getElementById("itemsPage").value) {
            //alert('page: '+ page + ", size: "+ pageSize)
            setLoading('on');
            const xmlHttp = new XMLHttpRequest();
            xmlHttp.onload = function () {
                setLoading('off');
                document.getElementById("body-content").innerHTML = xmlHttp.responseText;
            }
            xmlHttp.open("GET", "product-list?page=" + page + "&size=" + pageSize);
            xmlHttp.send();
        }
    </script>
</head>
<body>

<jsp:include page="components/navBar.jsp"/>

<div class="d-flex justify-content-center modal d-none" id="loading">

    <button class="btn" type="button" disabled style="margin-top: 10%; width: 6rem; height: 6rem; background-color: white">
        <span class="spinner-border spinner-border-lg text-dark" role="status" aria-hidden="true"
              style="margin-top: 10%; width: 4rem; height: 4rem;"></span>
        <span class="visually-hidden">Loading...</span>
    </button>
</div>
<div id="body-content">
    <jsp:include page="components/home-info.html"/>
</div>
</body>
</html>