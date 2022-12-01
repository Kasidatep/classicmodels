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
    <br>
    <h2>Classic Model Order History ::</h2>

    <ol class="list-group list-group-numbered">
        <c:forEach varStatus="no" var="order" items="${orders}">
            <li class="list-group-item d-flex justify-content-between align-items-start">
                <div class="ms-2 me-auto">
                    <div class="fw-bold h4">Order Number: ${order.orderNumber}</div>
                    <div class="row h6">
                        <div class="col-6">
                            Order date:
                            <span>
                            <c:set var="now" value="${order.orderDate}" />
                            <fmt:parseDate value = "${now}" var = "parsedEmpDate" pattern = "yyyy-MM-dd" />
                            <fmt:setLocale value="en"/>
                            <fmt:formatDate value="${parsedEmpDate}"  pattern="dd MMMMMMMM yyyy"/>
                            </span>
                        </div>
                        <div class="col-6">
                            Shipped date:
                            <span>
                            <c:set var="shippedDate" value="${order.shippedDate}" />
                            <fmt:parseDate value = "${shippedDate}" var = "parsedEmpDateshippedDate" pattern = "yyyy-MM-dd" />
                            <fmt:setLocale value="en"/>
                            <fmt:formatDate value="${parsedEmpDateshippedDate}"  pattern="dd MMMMMMMM yyyy"/>
                            </span>
                        </div>
                        <div class="col-4">
                            <div class="h6"><a onclick="historydetail('${order.orderNumber}')" class="text-primary">Details >> </a></div>
                        </div>
<%--                        <div>--%>
<%--                            <c:forEach items="${order.orderDetails}" var="product">--%>
<%--                                - ${product.productCode} <br>--%>
<%--                            </c:forEach>--%>
<%--                        </div>--%>
                </div>
                </div>
                <h4 class="h4 badge bg-${order.status=="Shipped"?"success":order.status=="Cancelled"?"danger":"warning"} rounded-pill">${order.status}</h4>
            </li>
        </c:forEach>
    </ol>
</div>
