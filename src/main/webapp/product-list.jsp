<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ProductList - ClassicModels</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/7e6e2fadf1.js"></script>
    <link href="componance/asset/style.css" rel="stylesheet">
    <link href="componance/function.js" rel="stylesheet">
    <script>
        var thisContent = '';

        function loadOffice(officeCode) {
            thisContent = 'office-list';
            const xhttp = new XMLHttpRequest();
            setLoading('on')
            xhttp.onload = function () {
                setLoading('off')
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
               alert("Response = "+ noOfItem);
                if (noOfItem > 0) {
                    cartInfo.style.display = 'inline'
                } else {
                    cartInfo.style.display = 'inline'
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
            const xmlHttp = new XMLHttpRequest();
            xmlHttp.onload = function () {
                document.getElementById("body-content").innerHTML = xmlHttp.responseText;
            }
            xmlHttp.open("GET", "product-list?page=" + page + "&size=" + pageSize);
            xmlHttp.send();
        }
    </script>

</head>
<body id="body-content">
<jsp:include page="componance/navBar.jsp"/>
<div class="nav-space"></div>
<div class="container">
    <div class="flex-product">
<%--        //class="row pt-4 align-items-center">--%>
        <c:forEach items="${products}" var="p" varStatus="vs">
            <div class="col col-first my-1 mx-2">
                <div class="card">
                    <img src="model-images/${p.productLine}/${p.productCode}.jpg" class="card-img-top product-img"
                         alt="${p.productName}">
                    <p class="badge bg-dark text-light product-price">
                        <i class="fa fa-usd" aria-hidden="true"></i>
                            ${p.MSRP}
                    </p>
                    <div class="card-body">
                        <h5 class="card-title text-truncate tooltips"
                            style="max-width: 220px;"
                            title="${p.productName}">
                                ${p.productName}
                        </h5>
                        <p class="card-text details">
                                ${p.productDescription}
                        </p>
                        <span class="btn btn-primary">
                            <i class="bi bi-bag-plus" onclick="addToCart('${p.productCode}')"></i>
                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                            Add to cart
                        </span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <hr>
    <div class="d-flex flex-row">
        <nav aria-label="paging">
            <ul class="pagination">
                <li class="page-item ${page==1?"disabled":""}">
                    <a class="page-link" href="product-list?page=${page-1}&size=${pageSize}">Previous</a>
                </li>
                <c:forEach begin="1" end="${totalPage}" varStatus="vs">
                    <c:choose>
                        <c:when test="${vs.count==page}">
                            <li class="page-item active" aria-current="page">
                                <a class="page-link"
                                   href="product-list?page=${vs.count}&size=${pageSize}">${vs.count}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link"
                                   href="product-list?page=${vs.count}&size=${pageSize}">${vs.count}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="page-item ${page==totalPage?"disabled":""}">
                    <a class="page-link" href="product-list?page=${page+1}&size=${pageSize}">Next</a>
                </li>
                <a class="px-1 mx-2 div-link" onclick="loadProduct(page=${page>=totalPage?1:page+1}, ${pageSize})"></a>
                <select id="itemsPage" class="form-select ml-2" onchange="loadProduct(1)">
                    <option value="5" ${pageSize==5?'selected':''}>5 Item/Page </option>
                    <option value="10" ${pageSize==10?'selected':''}>10 Item/Page </option>
                    <option value="15" ${pageSize==15?'selected':''}>15 Item/Page </option>
                    <option value="20" ${pageSize==20?'selected':''}>20 Item/Page </option>
                    <option value="50" ${pageSize==50?'selected':''}>50 Item/Page </option>
                </select>
            </ul>
    </div>
</div>

</body>
</html>
