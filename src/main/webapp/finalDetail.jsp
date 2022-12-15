<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kasidatep
  Date: 16/12/2565
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Detail Final</title>
</head>
<body>

004-${customer.customerNumber}, ${customer.customerName} - ${orders.orderNumber}, ${orders.orderDate}, ${orders.status}
<hr>
<c:forEach items="${orders.orderDetails}" var="order">
   - ${order.orderLineNumber}, ${order.productCode}, ${order.quantityOrdered}, ${order.priceEach}, ${order.quantityOrdered*order.priceEach} <br>
 </c:forEach>
</body>
</html>
