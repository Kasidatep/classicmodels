<jsp:include page="login-form.html"/>
<nav class="navbar navbar-expand-md navbar-dark bg-dark text-light" style="position: fixed; width: 100%; z-index: 20;">
    <div class="container-fluid">
        <a class="navbar-brand text-warning" href="javascript:void(0)">Classic Model</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#classicModelsNav">
            MENU <i class="fa fa-bars" aria-hidden="true"></i> </span>
        </button>
        <div class="collapse navbar-collapse" id="classicModelsNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadOffice('')">Office</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadProduct(1,10)">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">Order History</a>
                </li>
                <li class="nav-item ml-4">
                    <a id="login-menu" class="nav-link text-light" href="javascript:showLoginForm()">
                        <i class="fa fa-sign-in" aria-hidden="true"></i> Sign in</a>
                </li>
            </ul>
            <div style="margin-right: 20px">
                <button onclick="viewCart()" type="button" class="btn btn-outline-secondary position-relative"
                        style="cursor: pointer; text-decoration: none">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> My Cart
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                          id="noOfItemInCart">
                </span>
                </button>
            </div>
            <form class="d-flex">
                <input id="searchBox" class="form-control me-2" type="text" placeholder="Search...">
                <button class="btn btn-primary" type="button" onclick="search(thisContent)">Search</button>
            </form>
        </div>
    </div>
</nav>
<%--//<div class="nav-space"></div>--%>
<jsp:include page="login-form.html"/>