<%-- 
    Document   : error
    Created on : Dec 10, 2021, 12:09:15 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/myStyle.css" type="text/css">
    </head>
    <body>
        <div class="container-fluid px-0 position-relative">
            <div class="header"></div>
            <div class="my-container">
                <div class="row w-100 " style="height: 40vh">
                    <div class="col-2 col-md-2 col-xl-2">
                        <%@include file="./component/left.jsp" %>
                    </div>
                    <div class="col-md-8 px-5">
                        <i class="fa fa-exclamation-circle d-block text-center mb-2 mt-5" style="font-size: 2.5rem"></i>
                        <p class="text-center h4">Oops!</p>
                        <p class="text-center font-weight-normal h5">Something went wrong.</p>
                        <p class="text-center h6 font-weight-normal">Error: ${msg}</p>
                    </div>
                </div>
                <div class="footer"></div>
            </div>
        </div>
    </body>
</html>
