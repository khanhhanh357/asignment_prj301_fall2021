<%-- 
    Document   : login.jsp
    Created on : Dec 10, 2021, 4:54:49 PM
    Author     : Admin
--%>

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
                                            colspan="6" 
                                            class="text-center bg-light pt-3 pb-4"
                                            style="box-shadow: inset 0 -115px 20px #e6e6e6">
                                            <form action="view" method="GET">
                                                <div class="form-group row">
                                                    <label for="department" 
                                                           class="font-weight-bold offset-md-2 col-md-4">
                                                        Select date
                                                    </label>
                                                    <select name="department" 
                                                            id="department" 
                                                            class="col-md-4 py-0" 
                                                            style="height: 35px;"
                                                            >
                                                        <option value="" 
                                                                disabled="true" 
                                                                <c:if test="${0 eq 0}">
                                                                    selected="true"
                                                                </c:if>
                                                                >
                                                            -- All
                                                        </option>
                                                        <!--<c:forEach items="${departments}" var="d">
                                                            <option value="${d.id}"
                                                                    <c:if test="${departmentId eq d.id}">
                                                                        selected="true"
                                                                    </c:if>
                                                                    >
                                                                ${d.departmentName}
                                                            </option>
                                                        </c:forEach>-->
                                                    </select>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputTitle" 
                                                           class=" col-sm-5 mt-1 col-form-label text-right py-0 font-weight-bold">
                                                        or Enter Customer name
                                                    </label>
                                                    <div class="col-sm-5 pt-1">
                                                        <input type="text" 
                                                               class="form-control py-0 px-1 rounded-0 border border-dark shadow-0" 
                                                               id="inputTitle" 
                                                               name="title"
                                                               value=""
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
                                    <c:if test="${requests.isEmpty()}">
                                        <tr class="cursor-context-menu">
                                            <td colspan="6" 
                                                class="text-muted font-weight-bold font-italic text-center">
                                                No result 
                                                <c:if test="${departmentId ne 0}">
                                                    in <c:forEach items="${departments}" var="d">
                                                        <c:if test="${departmentId eq d.id}">
                                                            ${d.departmentName}
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${departmentId ne null}">
                                                    with the title ${title}
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${!requests.isEmpty()}">
                                        <c:forEach items="${requests}" var="r">
                                            <tr>
                                                <td style="flex-basis:24%;">
                                                    <p class="d-flex h-100 align-items-center justify-content-center text-success text-center">
                                                        ${r.title}
                                                    </p>
                                                </td>
                                                <td style="flex-basis:17%;">
                                                    <p class="d-flex h-100 align-items-center justify-content-center text-center">
                                                        <c:set var="date" value="${r.date}"/>
                                                        <%= df.format((Date) pageContext.getAttribute("date"))%>
                                                    </p>
                                                </td>
                                                <td style="flex-basis:17%;">
                                                    <p class="d-flex h-100 align-items-center justify-content-center text-center">
                                                        <c:if test="${r.closeDate ne null}">
                                                            <c:set var="date" value="${r.closeDate}"/>
                                                            <%= df.format((Date) pageContext.getAttribute("date"))%>
                                                        </c:if>
                                                        <c:if test="${r.closeDate eq null}">
                                                            N/A
                                                        </c:if>
                                                    </p>
                                                </td>
                                                <td style="flex-basis:13%;">
                                                    <p class="d-flex h-100 align-items-center justify-content-center text-center
                                                       <c:if test="${r.status eq -1}">text-danger</c:if>
                                                       <c:if test="${r.status eq 1}">text-success</c:if>
                                                           ">
                                                       <c:if test="${r.status eq -1}">Rejected</c:if>
                                                       <c:if test="${r.status eq 0}">in progress</c:if>
                                                       <c:if test="${r.status eq 1}">Approved</c:if>
                                                       </p>
                                                    </td>
                                                    <td style="flex-basis:20%;">
                                                        <p class="d-flex h-100 align-items-center  justify-content-center text-center">
                                                        <c:set var="did" value="${r.departmentId}"/>
                                                        <%
                                                            int id = (Integer) pageContext.getAttribute("did");
//                                                            Department department = studentRequestDAO.getDepartmentById(id);
                                                        %>
                                                        <%--<%=department.getDepartmentName()%>--%>
                                                    </p>
                                                </td>
                                                <td style="flex-basis:9%;">
                                                    <a href="<%=request.getContextPath()%>/solve?id=${r.id}" 
                                                       class="text-dark font-weight-bold d-flex h-100 align-items-center justify-content-center text-center">
                                                        Solve
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
