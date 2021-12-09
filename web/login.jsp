<%-- 
    Document   : login.jsp
    Created on : Dec 9, 2021
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Management</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css" type="text/css">
        <link rel="stylesheet" href="css/myStyle.css" type="text/css">
    </head>
    <body>
        <div class="container-fluid px-0 position-relative">
            <%@include file="./component/header.jsp" %>
            <div class="my-container">
                <div class="row h-80 w-100 ">
                    <div class="col-2 col-md-2 col-xl-2">
                        <%@include file="./component/left.jsp" %>
                    </div>
                    <div class="col-8 col-md-8 col-xl-8 position-relative">
                        <div class="login d-flex flex-column align-items-center">
                            <h2 class="text-primary">Login</h2>
                            <p class="h6 font-weight-normal">Using your username and password.</p>
                            <form id="my-form" 
                                  action="login" 
                                  method="POST" 
                                  class="mt-4 w-75 d-flex flex-column align-items-center">
                                <div class="form-group row mb-0">
                                    <label for="username" 
                                           class="col-sm-2 col-form-label">Username</label>
                                    <div class="col-sm-9 ">
                                        <input type="text" 
                                               class="form-control p-1 " 
                                               id="username" 
                                               name="name" 
                                               placeholder="User name"
                                               onblur="validateUserName()"
                                               oninput="validateUserName()"
                                               value="${name}">
                                    </div>
                                    <span class="col-sm-1 text-danger h6">(*)
                                </div>
                                <div class="row w-100" style="height: 30px">
                                    <p class="msg-warn text-danger h6 font-weight-normal offset-sm-4 col-sm-7 px-0">
                                    </p>
                                </div>
                                <div class="form-group row mt-4 mb-0">
                                    <label for="inputPassword" 
                                           class="col-sm-2 col-form-label">
                                        Password
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" 
                                               class="form-control p-1" 
                                               id="inputPassword" 
                                               name="password" 
                                               placeholder="Password"
                                               value="${password}"
                                               onblur="validatePassword()"
                                               oninput="validatePassword()">
                                    </div>
                                    <span class="col-sm-1 text-danger h6">(*)</span>
                                </div>
                                <div class="row w-100" style="height: 30px">
                                    <p class="msg-warn text-danger h6 font-weight-normal offset-sm-4 col-sm-7 px-0">
                                    </p>
                                </div>
                                <div class="form-group row mt-4 pr-5">
                                    <button type="button" 
                                            class="btn btn-secondary px-5 py-1 mx-auto"
                                            onclick="submitForm()">
                                        Log In
                                    </button>
                                </div>
                                <p class="h6 font-weight-normal mt-2">
                                    The field 
                                    <span class="text-danger">(*)</span> 
                                    is required.
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
                <%@include file="./component/footer.jsp" %>
            </div>
        </div>
        <script>
            var warnMsg = document.getElementsByClassName("msg-warn");
            function validateUserName() {
                let userName = document.getElementById("username");
                userName.value = userName.value.trim();
                const patt = new RegExp("^[A-z0-9]+$");
                if (userName.value == "" || !patt.test(userName.value)) {
                    warnMsg[0].textContent = "*Fill the blank."
                    userName.classList.add("alert-danger");
                    return false;
                } else {
                    warnMsg[0].textContent = ""
                    userName.classList.remove("alert-danger");
                    return true;
                }
            }
            function validatePassword() {
                let password = document.getElementById("inputPassword");
                const patt = new RegExp("^[A-z0-9]+$");
                if (password.value == "" || !patt.test(password.value)) {
                    warnMsg[1].textContent = "*Fill the blank."
                    password.classList.add("alert-danger");
                    return false;
                } else {
                    warnMsg[1].textContent = ""
                    password.classList.remove("alert-danger");
                    return true;
                }
            }
            function submitForm() {
                let isValid = validateUserName();
                if (isValid && validatePassword()) {
                    document.getElementById("my-form").submit();
                }
            }
        </script>
    </body>
</html>
