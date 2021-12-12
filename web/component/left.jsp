<%-- 
    Document   : left.jsp
    Created on : Dec 10, 2021, 5:12:37 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%  java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyy");%>
        <div class="left list-group scrollarea pl-3">
            <c:if test="<%=session.getAttribute("name") == null%>">
                <a href="<%=request.getContextPath()%>/login" 
                   class="list-group-item list-group-item-action py-2 my-1 bg-lightgray overflow-hidden text-wrap">
                    Login
                </a>
            </c:if>
            <c:if test="<%=session.getAttribute("name") != null%>">
                <p class="list-group-item list-group-item-action py-2 my-1 bg-lightgray overflow-hidden text-wrap">
                    Welcom <%= session.getAttribute("name")%>,<br/>
                    <a class="text-dark"
                       href="<%=request.getContextPath()%>/login?logout=1"> 
                        Logout
                    </a>
                </p>
            </c:if>
            <a href="<%=request.getContextPath()%>/home" 
               class="list-group-item list-group-item-action py-2 my-1 bg-lightgray overflow-hidden text-wrap">
                Home
            </a>
            <a href="<%=request.getContextPath()%>/add" 
               class="list-group-item list-group-item-action py-2 my-1 bg-lightgray overflow-hidden text-wrap">
                Add order
            </a>
        </div>
    </body>
</html>
