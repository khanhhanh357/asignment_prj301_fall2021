<%-- 
    Document   : login.jsp
    Created on : Dec 9, 2021, 4:54:49 PM
    Author     : Admin
--%>

<%@page import="model.Account"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="row h-80 w-100 ">
                    <div class="col-2 col-md-2 col-xl-2">
                        <%@include file="./component/left.jsp" %>
                    </div>
                    <div class="col-8 col-md-8 col-xl-8 position-relative ml-5">
                        <div class="login d-flex flex-column align-items-center">
                            <h2 class="text-primary">Member Login</h2>
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
                                               value="${name}"
                                               required="true">
                                    </div>
                                    <span class="col-sm-1 text-danger h6">(*)
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
                                               required="true">
                                    </div>
                                    <span class="col-sm-1 text-danger h6">(*)</span>
                                </div>
                                <div class="form-group row mt-4 pr-5">
                                    <button type="submit" 
                                            class="btn btn-secondary px-5 py-1 mx-auto">
                                        Log In
                                    </button>
                                </div>
                                <p class="h6 font-weight-normal mt-2">
                                    The field 
                                    <span class="text-danger">(*)</span> 
                                    is required.
                                </p>
                            </form>
                            <p class="text-danger mt-5 h5 font-weight-normal">${msg}</p>
                        </div>
                    </div>
                </div>
                <div class="footer"></div>
            </div>
        </div>
    </body>
</html>
