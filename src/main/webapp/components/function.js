var thisContent = '';

function loadOffice(officeCode) {
    thisContent = 'office-list';
    setLoading('on')
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        setLoading('off');
        document.getElementById("body-content").innerHTML = xhttp.responseText;
    }
    xhttp.open("GET", "office-list?officeCode=" + officeCode);
    xhttp.send();
}

function loadProduct(page, pageSize = document.getElementById("itemsPage").value) {
    thisContent = 'product-list';
    //alert('page: '+ page + ", size: "+ pageSize)
    setLoading('on')
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        setLoading('off');
        document.getElementById("body-content").innerHTML = xhttp.responseText;
    }
    xhttp.open("GET", "product-list?page=" + page + "&size=" + pageSize);
    xhttp.send();
}

function setLoading(on_off) {
    let loading = document.getElementById("loading");
    let cursorContent = document.getElementById("body-content")
    if (on_off == 'on') {
        loading.classList.remove("d-none");
        loading.classList.add("d-inline");
        cursorContent.style.cursor = "progress"

    } else {
        loading.classList.remove("d-inline");
        loading.classList.add("d-none");
        cursorContent.style.cursor = "auto"
    }
}

function search(page) {
    alert('Search from: ' + page);
}

function addToCart(productCode) {
    setLoading('on')
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        setLoading('off');
        cartInfo = document.getElementById("noOfItemInCart");
        noOfItem = xhttp.responseText;
        //alert("Response = " + noOfItem);
        if (noOfItem > 0) {
            cartInfo.style.display = 'inline'
        } else {
            cartInfo.style.display = 'none'
        }
        cartInfo.innerHTML = noOfItem;
    }
    xhttp.open("GET", "add-to-cart?productCode=" + productCode);
    xhttp.send();
}

function viewCart() {
    setLoading('on')
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        setLoading('off');
        document.getElementById("view-cart").innerHTML = xhttp.responseText;
        $('#viewCartModal').modal('show');
    }
    xhttp.open("GET", "ViewCart.jsp");
    xhttp.send();
}

function showLoginForm() {
    $('#modalLoginForm').modal('show');
}

function login(userName, password) {
    if (userName == '' || password == '' || userName == undefined) {
        document.getElementById("login-message").innerHTML = "Invalid user name or password !!!";
    }
    setLoading('on')
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        setLoading('off');
        if (xhttp.status == 200) {
            $('#modalLoginForm').modal('hide');
            document.getElementById("login-menu").innerHTML = "<i class='bi bi-box-arrow-left'></i> Logout"
        } else if (xhttp.status > 400) {
            document.getElementById("login-message").innerHTML = xhttp.statusText;
        } else {
            document.getElementById("login-message").innerHTML = "Wrong user name or password !!!";
        }
    }
    let urlEncodedData = "", urlEncodedDataPairs = [];
    urlEncodedDataPairs.push(encodeURIComponent("userName") + '=' + encodeURIComponent(userName));
    urlEncodedDataPairs.push(encodeURIComponent("password") + '=' + encodeURIComponent(password));
    urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+');
    xhttp.open("POST", "login");
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send(urlEncodedData);
}

function loadProduct(page, pageSize = document.getElementById("itemsPage").value) {
    //alert('page: '+ page + ", size: "+ pageSize)
    setLoading('on');
    const xmlHttp = new XMLHttpRequest();
    xmlHttp.onload = function () {
        setLoading('off');
        document.getElementById("body-content").innerHTML = xmlHttp.responseText;
    }
    xmlHttp.open("GET", "product-list?page=" + page + "&size=" + pageSize);
    xmlHttp.send();
}