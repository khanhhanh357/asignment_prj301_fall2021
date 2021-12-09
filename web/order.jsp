<%-- 
    Document   : order.jsp
    Created on : Dec 9, 2021
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Request System</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css" type="text/css">
        <link rel="stylesheet" href="css/myStyle.css" type="text/css">
    </head>
    <body>
        <div class="container-fluid px-0 position-relative">
            <%@include file="./component/header.jsp" %>
            <div class="my-container">
                <div class="row h-80 w-100 " style="height: 800px">
                    <div class="col-2 col-md-2 col-xl-2">
                        <%@include file="./component/left.jsp" %>
                    </div>
                    <div class="col-8 col-md-8 col-xl-8 position-relative">
                        <div class="main-content d-flex flex-column">
                            <h3 class="text-darkprimary float-left">Order Code: 1104</h3>
                            <form action="solve" method="POST">
                                <div class="form-group row mt-3">
                                    <label for="date-created" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        Date created
                                    </label>
                                    <div class="col-sm-5">
                                        <input type="text" 
                                               class="form-control py-0 px-1 border border-secondary shadow-inset-top bg-white" 
                                               id="date-created" 
                                               readonly
                                               value="09/12/2021">
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="department" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        Customer name
                                    </label>
                                    <div class="col-sm-5">
                                        <input type="text" 
                                               class="form-control py-0 px-1 border shadow-0 bg-white border-secondary shadow-inset-top" 
                                               id="department"
                                               maxlength="100"
                                               placeholder="Vd. Nguyễn Văn A"
                                               value="">
                                    </div>
                                </div>
                                <div class="form-group row mt-3">
                                    <label for="product-name" 
                                           class="col-sm-4 col-form-label text-right py-0">
                                        Product name
                                    </label>
                                    <div class="col-sm-5">
                                        <select name="productName" id="product-name"
                                                class="form-control py-0 px-1 border border-secondary shadow-inset-top bg-white h-100">
                                            <option class="text-mute">- Chọn loại giò</option>
                                            <option value="1">Giò mỡ</option>
                                            <option value="2">Giò lụa</option>
                                            <option value="3">Giò bì</option>
                                            <option value="4">Giò me</option>
                                        </select>
                                    </div>
                                </div>
                                
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
                <%@include file="./component/footer.jsp" %>
            </div>
        </div>
    </body>
</html>
