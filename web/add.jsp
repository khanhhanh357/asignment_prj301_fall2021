<%-- 
    Document   : login.jsp
    Created on : Dec 10, 2021, 4:54:49 PM
    Author     : Admin
--%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css" type="text/css">
        <link rel="stylesheet" href="css/myStyle.css" type="text/css">
    </head>
    <body>
        <div class="container-fluid px-0 position-relative">
            <div class="header"></div>
            <div class="my-container">
                <div class="row h-80 w-100 " style="height: 800px">
                    <div class="col-2 col-md-2 col-xl-2">
                        <%@include file="./component/left.jsp" %>
                    </div>
                    <div class="col-8 col-md-8 col-xl-8 position-relative">
                        <div class="main-content d-flex flex-column ml-5">
                            <h3 class="text-darkprimary float-left">Add Order</h3>
                            <form action="add" method="POST">
                                <div class="form-group row mt-3">
                                    <label for="date-create" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        Date
                                    </label>
                                    <div class="col-sm-5">
                                        <input type="text" 
                                               class="form-control py-0 px-1 border shadow-0 bg-white border-secondary shadow-inset-top" 
                                               id="date-create" 
                                               readonly
                                               value="<%= df.format(new java.util.Date())%>">
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="firstName" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        FirstName
                                    </label>
                                    <div class="col-sm-5">
                                        <input type="text" 
                                               class="form-control py-0 px-1 border border-secondary shadow-inset-top bg-white" 
                                               id="firstName"
                                               placeholder="First Name"
                                               value=""
                                               name="firstName"
                                               required="">
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="lastName" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        Last Name
                                    </label>
                                    <div class="col-sm-5">
                                        <input type="text" 
                                               class="form-control py-0 px-1 border border-secondary shadow-inset-top bg-white" 
                                               id="lastName"
                                               placeholder="Last Name"
                                               value=""
                                               name="lastName"
                                               required="">
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="product" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        Product
                                    </label>
                                    <div class="col-sm-5">
                                        <select id="product" 
                                                class=" py-0 form-control py-0 px-1 border border-secondary shadow-inset-top bg-white" 
                                                style="height: 35px"
                                                >
                                            <c:forEach items="${listProducts}" var="l" varStatus="loop">
                                                <option value="${loop.index}" data-id ="${l.id}" data-price="${l.price}" >${l.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="price" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        Price/Unit (VN??)
                                    </label>
                                    <div class="col-sm-5">
                                        <input type="text" 
                                               class="form-control py-0 px-1 border border-secondary shadow-inset-top bg-white" 
                                               id="price" 
                                               value="0"
                                               readonly="true"
                                               >
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="quantity" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        Quantity
                                    </label>
                                    <div class="col-sm-5">
                                        <input type="number" 
                                               class="form-control py-0 px-1 border border-secondary shadow-inset-top bg-white" 
                                               id="quantity" 
                                               value="1"
                                               name="quantity"
                                               onchange="updateTotal()"
                                               >
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="total" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        Total (VN??)
                                    </label>
                                    <div class="col-sm-5">
                                        <input type="text" 
                                               class="form-control py-0 px-1 border border-secondary shadow-inset-top bg-white" 
                                               id="total" 
                                               readonly
                                               value=""
                                               >
                                    </div>
                                </div>
                                <input id="productId" type="hidden" name="product" value="${listProducts.get(0).id}">
                                <div class="form-group mt-3 row">
                                    <button type="submit" 
                                            class="btn offset-sm-6 col-sm-2 py-1 border-secondary outline-0 bg-lightgray">
                                        Save
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="footer"></div>
            </div>
        </div>
        <script>
            document.getElementById("product").addEventListener('change', function () {
                let option = document.getElementsByTagName('option')[document.getElementById("product").value];
                let price = option.getAttribute('data-price');
                let pId = option.getAttribute("data-id")
                document.getElementById("price").value = price;
                updateTotal(price);
                document.getElementById("productId").value = pId;
            });

            function updateTotal() {
                let price = document.getElementById("price").value;
                let quantity = document.getElementById("quantity").value;
                document.getElementById("total").value = parseInt(quantity) * parseInt(price);
            }

            document.getElementById("price").value = document.getElementsByTagName('option')[0].getAttribute('data-price');
            updateTotal(document.getElementById("price").value);
        </script>
    </body>
</html>
