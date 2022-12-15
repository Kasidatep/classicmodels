<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kasidatep
  Date: 16/12/2565
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Final Lab</title>
</head>
<body>
 <h2>Customer List by : 64130500004 กษิดิ์เดช พลายเผือก</h2>
 <h3>${customer.customerNumber}, ${customer.customerName}, ${customer.city}, ${customer.country} </h3>
<hr>
<c:forEach items="${Orders}" var="order" varStatus="no">
    004-${no.count} <a href="detail?no=${order.orderNumber}">${order.orderNumber}</a>, ${order.orderDate}, ${order.shippedDate}, ${order.status}<br>
</c:forEach>


<hr>

</body>
</html>
