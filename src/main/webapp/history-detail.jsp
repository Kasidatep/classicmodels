<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en"/>
<%--
  Created by IntelliJ IDEA.
  User: Kasidatep
  Date: 29/11/2565
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav-space"></div>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./">Home</a></li>
            <li class="breadcrumb-item"><a href="javascript:loadHistory()">Order History</a></li>
            <li class="breadcrumb-item active" aria-current="page">Invoice #${orders.orderNumber}</li>
        </ol>
    </nav>
    <h2>Classic Model Invoice #${orders.orderNumber}::</h2>
<div class="border center">
    <div class="container bootdey" id="content">
        <div class="row invoice row-printable">
            <div class="col-md-10">
                <!-- col-lg-12 start here -->
                <div class="panel panel-default plain" id="dash_0">
                    <!-- Start .panel -->
                    <div class="panel-body p30">
                        <div class="row">
                            <!-- Start .row -->
                            <div class="col-lg-8">
                                <!-- col-lg-6 start here -->
                                <div class="invoice-logo"><img width="200px" src="./components/asset/billlogo.png" alt="Invoice logo"></div>
                            </div>
                            <!-- col-lg-6 end here -->
                            <div class="col-lg-4">
                                <!-- col-lg-6 start here -->
                                <div class="invoice-from">
                                    <ul class="list-unstyled text-right">
                                        <br>
                                        <li>Classic Models .inc</li>
                                        <li>100 Market Street, Suite 300</li>
                                        <li>San Francisco, CA 94080</li>
                                        <li>USA</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- col-lg-6 end here -->
                            <div class="col-lg-12">
                                <!-- col-lg-12 start here -->
                                <div class="invoice-details mt25">
                                    <div class="well">
                                        <ul class="list-unstyled mb0">
                                            <li><strong>Invoice</strong> #${orders.orderNumber}</li>
                                            <li><strong>Order Date:</strong>
                                                <c:set var="orderDate" value="${orders.orderDate}" />
                                                <fmt:parseDate value = "${orderDate}" var = "parsedEmpDateorderDate" pattern = "yyyy-MM-dd" />
                                                <fmt:formatDate value="${parsedEmpDateorderDate}"  pattern="dd MMMMMMMM yyyy"/>
                                            </li>
                                            <li><strong>Require Date:</strong>
                                                <c:set var="requiredDate" value="${orders.requiredDate}" />
                                                <fmt:parseDate value = "${requiredDate}" var = "parsedEmpDaterequiredDate" pattern = "yyyy-MM-dd" />
                                                <fmt:formatDate value="${parsedEmpDaterequiredDate}"  pattern="dd MMMMMMMM yyyy"/>
                                            </li>
                                            <li><strong>Shipped Date:</strong>
                                                <c:set var="shippedDate" value="${orders.shippedDate}" />
                                                <fmt:parseDate value = "${shippedDate}" var = "parsedEmpDateshippedDate" pattern = "yyyy-MM-dd" />
                                                <fmt:formatDate value="${parsedEmpDateshippedDate}"  pattern="dd MMMMMMMM yyyy"/>
                                            </li>
                                            <li><strong>Status:</strong> <span class="label label-danger">${orders.status}</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="invoice-to mt25">
                                    <ul class="list-unstyled">
                                        <li><strong>Invoiced To</strong></li>
                                        <li>${user.customerName}</li>
                                        <li>${user.contactFirstName} ${user.contactLastName}</li>
                                        <li>${user.addressLine1}</li>
                                        <li>${user.city}, ${user.state} ${user.postalCode}</li>
                                        <li>${user.country}</li>
                                        <li>Phone ${user.phone}</li>
                                    </ul>
                                </div>
                                <div class="invoice-items">
                                    <div class="table-responsive" style="overflow: hidden; outline: none;" tabindex="0">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th class="per70 text-center">Description</th>
                                                <th class="per5 text-center">Qty</th>
                                                <th class="per25 text-center">Total</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${orders.orderDetails}" var="item" varStatus="vs">
                                            <tr>
                                                <td>${vs.count}: ${item.productCode} (Price: $
                                                    <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits="2"  value = "${item.priceEach}" />
                                                    )</td>
                                                <td class="text-end">${item.quantityOrdered}</td>
                                                <td class="text-end">$
                                                    <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits="2"  value = "${item.priceEach*item.quantityOrdered}" />
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th colspan="2" class="text-end">Sub Total:</th>
                                                <th class="text-end">$
                                                    <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits="2"  value = "${totalPrice}" />
                                                    USD</th>
                                            </tr>
                                            <tr>
                                                <th colspan="2" class="text-end">0% VAT:</th>
                                                <th class="text-end">$0.00 USD</th>
                                            </tr>
                                            <tr>
                                                <th colspan="2" class="text-end">Credit:</th>
                                                <th class="text-end">$0.00 USD</th>
                                            </tr>
                                            <tr>
                                                <th colspan="2" class="text-end">Total:</th>
                                                <th class="text-end">$
                                                    <fmt:formatNumber type = "number" maxFractionDigits = "2" minFractionDigits="2"  value = "${totalPrice}" />
                                                USD</th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <div id="editor"></div>
                                <div class="invoice-footer mt25">
                                    <p class="text-center">Generated on
                                        <jsp:useBean id="now" class="java.util.Date"/>
                                        <fmt:formatDate value="${now}" dateStyle="long" timeStyle="long"/>
                                        <button id="invoiceCreate"><i class="fa fa-print mr5"></i> Print</button>
                                    </p>
                                </div>
                            </div>
                            <!-- col-lg-12 end here -->
                        </div>
                        <!-- End .row -->
                    </div>
                </div>
                <!-- End .panel -->
            </div>
            <!-- col-lg-12 end here -->
        </div>
    </div>
</div>





<br>


</div>

<script>
    var doc = new jsPDF();
    var specialElementHandlers = {
        '#editor': function (element, renderer) {
            return true;
        }
    };

    $('#invoiceCreate').click(function () {
        doc.fromHTML($('#content').html(), 15, 15, {
            'width': 170,
            'elementHandlers': specialElementHandlers
        });
        doc.save('sample-file.pdf');
    });
</script>