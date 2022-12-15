<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="nav-space"></div>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Order History</li>
        </ol>
    </nav>
<div class="accordion" id="accordionPanelsStayOpenExample">
<c:forEach varStatus="no" var="order" items="${orders}">
    <div class="accordion-item">
        <h2 class="accordion-header" id="panelsStayOpen-heading${order.orderNumber}">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${order.orderNumber}" aria-expanded="false" aria-controls="panelsStayOpen-collapse${order.orderNumber}">

                        <div class="d-flex align-items-center">
                            <div class="ms-3">
                                <p class="fw-bold mb-1">Order: #${order.orderNumber}</p>
                                <p class="text-muted mb-0">${user.customerName}</p>
                            </div>
                        </div>


        </h2>
        <div id="panelsStayOpen-collapse${order.orderNumber}" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-heading${order.orderNumber}">
            <table class="table align-middle mb-0 bg-white">
                <thead class="bg-light">
                <tr>
                    <th>Order Number</th>
                    <th>Order Date</th>
                    <th>Shipped date</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div class="d-flex align-items-center">
                                <div class="ms-3">
                                    <p class="fw-bold mb-1">Order: #${order.orderNumber}</p>
                                    <p class="text-muted mb-0">${user.customerName}</p>
                                </div>
                            </div>
                        </td>
                        <td>
                <span>
                            <c:set var="now" value="${order.orderDate}" />
                            <fmt:parseDate value = "${now}" var = "parsedEmpDate" pattern = "yyyy-MM-dd" />
                            <fmt:setLocale value="en"/>
                            <fmt:formatDate value="${parsedEmpDate}"  pattern="dd MMMMMMMM yyyy"/>
                </span>
                        </td>
                        <td>
                <span>
                            <c:set var="shippedDate" value="${order.shippedDate}" />
                            <fmt:parseDate value = "${shippedDate}" var = "parsedEmpDateshippedDate" pattern = "yyyy-MM-dd" />
                            <fmt:setLocale value="en"/>
                            <fmt:formatDate value="${parsedEmpDateshippedDate}"  pattern="dd MMMMMMMM yyyy"/>
                </span>
                        </td>
                        <td>
                            <span class="badge text-bg-${order.status=="Shipped"?"success":order.status=="Cancelled"?"danger":"warning"} rounded-pill">${order.status}</span>
                        </td>

                        <td>
                            <button type="button" onclick="historydetail('${order.orderNumber}')" class="btn btn-link btn-sm btn-rounded">
                                View Invoice
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="accordion-body">
                <div class="invoice-items">
                    <div class="table-responsive" style="overflow: hidden; outline: none;"
                         tabindex="0">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="per70 text-center">Description</th>
                                <th class="per5 text-center">Qty</th>
                                <th class="per25 text-center">Total</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${order.orderDetails}" var="item" varStatus="vs">
                                <tr>
                                    <td>${vs.count}: ${item.product.productName} (Price: $
                                        <fmt:formatNumber type="number" maxFractionDigits="2"
                                                          minFractionDigits="2"
                                                          value="${item.priceEach}"/>
                                        )
                                    </td>
                                    <td class="text-end">${item.quantityOrdered}</td>
                                    <td class="text-end">$
                                        <fmt:formatNumber type="number" maxFractionDigits="2"
                                                          minFractionDigits="2"
                                                          value="${item.priceEach*item.quantityOrdered}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="2" class="text-end">Total:</th>
                                <th class="text-end">$
                                    <fmt:formatNumber type="number" maxFractionDigits="2"
                                                      minFractionDigits="2" value="${totalPrice}"/>
                                    USD
                                </th>
                            </tr>
                            </tfoot>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</div>
</div>
