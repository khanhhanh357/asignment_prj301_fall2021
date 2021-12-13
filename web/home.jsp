<%-- 
    Document   : login.jsp
    Created on : Dec 10, 2021, 4:54:49 PM
    Author     : Admin
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>
<%@page import="javax.ejb.Local"%>
<%@page import="dao.StoreManagerDAO"%>
<%@page import="java.sql.Date"%>
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
        <%  java.text.DateFormat dmf = new java.text.SimpleDateFormat("MM-yyy");
            java.text.DateFormat mf = new java.text.SimpleDateFormat("MM");
            java.text.DateFormat dfmt = new java.text.SimpleDateFormat("dd/MM/yyyy");
        %>
        <div class="container-fluid px-0 position-relative">
            <div class="header"></div>
            <div class="my-container">
                <div class="row h-80 w-100 ">
                    <div class="col-2 col-md-2 col-xl-2">
                        <%@include file="./component/left.jsp" %>
                    </div>
                    <div class="col-9 col-md-9 col-xl-9 position-relative ml-5">
                        <div class="main-content d-flex flex-column">
                            <h3 class="text-darkprimary float-left">View Order</h3>
                            <table class="table-scroll">
                                <thead>
                                    <tr >
                                        <td scope="col" 
                                            colspan="4" 
                                            class="text-center bg-light pt-3 pb-4"
                                            style="box-shadow: inset 0 -115px 20px #e6e6e6">
                                            <form action="home" method="GET">
                                                <div class="form-group row">
                                                    <label for="orderDate" 
                                                           class="font-weight-bold offset-md-2 col-md-4">
                                                        Select date
                                                    </label>
                                                    <select name="month" 
                                                            id="orderDate" 
                                                            class="col-md-4 py-0" 
                                                            style="height: 35px;"
                                                            >
                                                        <option value="0" <c:if test="${month eq 0}">selected="true"</c:if>> <%= dmf.format(new java.util.Date())%></option>
                                                        <option value="1" <c:if test="${month eq 1}">selected="true"</c:if>> <%= dmf.format(Date.valueOf(LocalDateTime.now().minusMonths(1).toLocalDate()))%></option>
                                                        <option value="2" <c:if test="${month eq 2}">selected="true"</c:if>> <%= dmf.format(Date.valueOf(LocalDateTime.now().minusMonths(2).toLocalDate()))%></option>
                                                        <option value="-1" <c:if test="${month eq -1}">selected="true"</c:if>> -- All</option>
                                                    </select>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="customer" 
                                                           class=" col-sm-5 mt-1 col-form-label text-right py-0 font-weight-bold">
                                                        or Enter Customer name
                                                    </label>
                                                    <div class="col-sm-5 pt-1">
                                                        <input type="text" 
                                                               class="form-control py-0 px-1 rounded-0 border border-dark shadow-0" 
                                                               id="customer" 
                                                               name="customer"
                                                               value="${customer}"
                                                               maxlength="200"
                                                               placeholder="CustomerName">
                                                    </div>
                                                    <button type="submit" 
                                                            class="col-sm-2 border-light outline-0 py-0" >
                                                        View
                                                    </button>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center bg-light" 
                                            style="flex-basis:10%; box-shadow: inset 0 -20px 15px #e6e6e6">
                                            Code
                                        </td>
                                        <td class="text-center bg-light" 
                                            style="flex-basis:40%; box-shadow: inset 0 -20px 15px #e6e6e6">
                                            Customer
                                        </td>
                                        <td class="text-center bg-light" 
                                            style="flex-basis:30%; box-shadow: inset 0 -20px 15px #e6e6e6">
                                            Date
                                        </td>
                                        <td class="text-center bg-light" 
                                            style="flex-basis:20%; box-shadow: inset 0 -20px 15px #e6e6e6">
                                            Detail
                                        </td>
                                    </tr>
                                </thead>
                                <tbody style="max-height: 46vh">
                                    <c:if test="${listOrder.isEmpty()}">
                                        <tr class="cursor-context-menu">
                                            <td colspan="4" 
                                                class="text-muted font-weight-bold font-italic text-center">
                                                No result 
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${!listOrder.isEmpty()}">
                                        <c:forEach items="${listOrder}" var="l">
                                            <tr>
                                                <td style="flex-basis:10%;">
                                                    <p class="d-flex h-100 align-items-center justify-content-center text-success text-center">
                                                        ${l.id}
                                                    </p>
                                                </td>
                                                <td style="flex-basis:40%;">
                                                    <p class="d-flex h-100 align-items-center justify-content-center text-center">
                                                        ${l.lastName} ${l.firstName}
                                                    </p>
                                                </td>
                                                <td style="flex-basis:30%;">
                                                    <p class="d-flex h-100 align-items-center justify-content-center text-center">
                                                        <c:set var="date" value="${l.orderDate}"/>
                                                        <%= dfmt.format((Date) pageContext.getAttribute("date"))%>
                                                    </p>
                                                </td>
                                                <td style="flex-basis:20%;">
                                                    <a href="<%=request.getContextPath()%>/view?id=${l.id}" 
                                                       class="text-dark font-weight-bold d-flex h-100 align-items-center justify-content-center text-center">
                                                        View
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="footer"></div>
            </div>
        </div>
    </body>
</html>
