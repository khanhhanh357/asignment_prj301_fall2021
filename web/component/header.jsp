<%-- 
    Document   : header.jsp
    Created on : Dec 8, 2021, 4:56:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <c:if test="${loginState eq true}"><div class="overlay"></div></c:if>
            <div class="header position-relative">
                <div id="my-notify">
                <c:if test="${loginState eq false}">
                    <h5 class="text-danger my-3 text-center">Đăng nhập thất bại!</h5>
                </c:if>
                <c:if test="${loginState eq true}">
                    <h5 class="text-success my-3 text-center">Đăng nhập thành công!</h5>
                </c:if>
                <p class="h6 font-weight-normal text-center">${msg}</p>
            </div>
        </div>
        <script>
            var loginStatus = '<%=request.getAttribute("loginState")%>'
            var myNotify = document.getElementById("my-notify");
            if (loginStatus != null && loginStatus != 'null') {
                if (loginStatus == 'true') {
                    myNotify.classList.add("msg-success");
                    setTimeout(() => {
                        window.location.href = '<%=request.getContextPath()%>' + "/home";
                    }, 3000)
                } else {
                    myNotify.classList.add("msg-fail");
                    setTimeout(() => {
                        myNotify.style.display = "none";
                    }, 3000)
                }
                myNotify.style.display = "block";
            }
        </script>
    </body>
</html>
