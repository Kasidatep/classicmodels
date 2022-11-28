<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="nav-space"></div>
<div class="container">
    <br>
        <h2>Classic Model Offices ::</h2>
    <div class="row">
        <c:forEach items="${offices}" var="office">
            <a href="javascript:loadOffice('${office.officeCode}')" class="col-2 border border-secondary p-2 m-2 ${office.officeCode == selected ? 'btn btn-secondary' : 'btn btn-outline-secondary'}">
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
