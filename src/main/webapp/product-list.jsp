<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="nav-space"></div>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Product</li>
        </ol>
    </nav>
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
                    <a class="page-link" onclick="loadProduct(page=${page-1}, ${pageSize})">Previous</a>
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
                    <a class="page-link" onclick="loadProduct(page=${page+1}, ${pageSize})">Next</a>
                </li>

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
