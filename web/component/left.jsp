<%-- 
    Document   : header.jsp
    Created on : Dec 9, 2021
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="left list-group scrollarea pl-3">
            <p class="list-group-item list-group-item-action py-2 my-1 bg-lightgray">Welcom UserName,
                <a href="<%=request.getContextPath()%>/login">Logout</a></p>
            <a href="<%=request.getContextPath()%>/home" class="list-group-item list-group-item-action py-2 my-1 bg-lightgray">View order</a>
            <a href="<%=request.getContextPath()%>/add" class="list-group-item list-group-item-action py-2 my-1 bg-lightgray">Add order</a>
        </div>
    </body>
</html>
