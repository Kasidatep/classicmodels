<%--
  Created by IntelliJ IDEA.
  User: Kasidatep
  Date: 28/11/2565
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="nav-space"></div>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Order History</li>
        </ol>
    </nav>
    <h2>Classic Model Order History::</h2>
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
<c:forEach varStatus="no" var="order" items="${orders}">
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
                    View details
                </button>
            </td>
        </tr>

<%--    <c:forEach items="${order.orderDetails}" var="prod">--%>
<%--        - ${prod.product.productName} <br>--%>
<%--    </c:forEach>--%>
</c:forEach>
        </tbody>
    </table>


</div>
