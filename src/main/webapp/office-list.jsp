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
    <title>OfficeList - ClassicModels</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/7e6e2fadf1.js"></script>
    <link href="componance/asset/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="componance/navBar.jsp"/>
<div class="nav-space"></div>
<div class="container">
    <br>
        <h2>Classic Model Offices ::</h2>
    <div class="row">
        <c:forEach items="${offices}" var="office">
            <a href="office-list?officeCode=${office.officeCode}" class="col-2 border border-secondary p-2 m-2 ${office.officeCode == selected ? 'btn btn-secondary' : 'btn btn-outline-secondary'}">
                <div class="text-start">${office.city}, ${office.country} </div>
                <div class="text-start"> <i class="fa fa-phone" aria-hidden="true"></i> ${office.phone}</div>
            </a>
        </c:forEach></div>
    <br>
    <c:if test="${selected!=null}">
    <hr>
        <h4>Employees ::</h4>
    <div class="p-3 office-employee-list">
        <c:forEach items="${selectedOffice.employees}" var="employee">
                <div class="px-3 py-2 mx-2 my-2 bg-secondary bg-opacity-25 rounded-pill" >
                    <i class="fa fa-user" aria-hidden="true"></i> <b>${employee.firstName} ${employee.lastName} </b> - ${employee.jobTitle}
                </div>
        </c:forEach>
    </div>
    </c:if>
</div>
</body>
</html>