<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kasidatep
  Date: 7/11/2565
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Office List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="row bg-primary">
        <h2>Classic Model Offices ::</h2>
    </div>    <div class="row">
    <c:forEach items="${offices}" var="office">
        <div class="col-2 border border-secondary p-2 m-2${office.officeCode == selectedOffice ? 'bg-warning' : ''}">
            <div>
                <a href="office-list?officeCode=${office.officeCode}">
                        ${office.city}</a>, ${office.country}
            </div>
            <div> ${office.phone}</div>
        </div>
    </c:forEach></div>
    <br>
    <div class="row bg-light">
        <b>Employees ::</b>
    </div>
    <div class="row">
        <c:forEach items="${selectedOffice.employees}" var="employee">
            <div class="col-2 pl-2 m-2 border border-secondary rounded-pill">
                <div> ${employee.firstName}                        ${employee.lastName} - ${employee.jobTitle}
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>