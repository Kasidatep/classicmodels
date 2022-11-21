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
    <link href="components/asset/style.css" rel="stylesheet">
    <link href="components/function.js" rel="stylesheet">
</head>
<body>
<div class="nav-space"></div>
<div class="container">
    <div class="flex-product">
<%--        //class="row pt-4 align-items-center">--%>
        <c:forEach items="${products}" var="p" varStatus="vs">
            <div class="col col-first my-1 mx-2 product-item">
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
                        <span class="btn btn-primary" onclick="addToCart('${p.productCode}')">
                            <i class="bi bi-bag-plus"></i>
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
                    <a class="page-link" onclick="loadProduct(page=${vs.count}, ${pageSize})">Previous</a>
                </li>
                <c:forEach begin="1" end="${totalPage}" varStatus="vs">
                    <c:choose>
                        <c:when test="${vs.count==page}">
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" onclick="loadProduct(page=${vs.count}, ${pageSize})">${vs.count}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" onclick="loadProduct(page=${vs.count}, ${pageSize})">${vs.count}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="page-item ${page==totalPage?"disabled":""}">
                    <a class="page-link" onclick="loadProduct(page=${vs.count}, ${pageSize})">Next</a>
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
