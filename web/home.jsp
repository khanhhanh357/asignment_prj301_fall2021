<%-- 
    Document   : home.jsp
    Created on : Dec 9, 2021
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Management</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/login.css" type="text/css">
        <link rel="stylesheet" href="./css/myStyle.css" type="text/css">
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
                        <div class="main-content d-flex flex-column">
                            <h3 class="text-darkprimary float-left">View order</h3>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <td scope="col" 
                                            colspan="6" 
                                            class="bg-light">
                                            <form>
                                                <div class="form-group row mt-2 mb-4 w-100 ">
                                                    <label for="date" 
                                                           class="font-weight-bold col-md-2">
                                                        View by date
                                                    </label>
                                                    <select name="date" id="department"
                                                            class="col-md-3">
                                                        <option value="1">-All</option>
                                                        <option value="2">12-2021</option>
                                                        <option value="3">11-2021</option>
                                                        <option value="4">10-2021</option>
                                                    </select>
                                                    <a href="<%=request.getContextPath()%>/add" class="btn py-1 offset-md-4 col-md-2 btn-primary rounded text-white">
                                                        <i class="fa fa-plus-square-o"></i>
                                                        Add order
                                                    </a>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td scope="col" class="text-center bg-light" style="width: 2%">Code</td>
                                        <td scope="col" class="text-center bg-light" style="width: 19%">Customer</td>
                                        <td scope="col" class="text-center bg-light" style="width: 12%">Date</td>
                                        <td scope="col" class="text-center bg-light" style="width: 30%">Description</td>
                                        <td scope="col" class="text-center bg-light text-center" style="width: 17%">Total amount</td>
                                        <td scope="col" class="text-center bg-light text-center" style="width: 20%">Note</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr onclick="window.location.href = '<%=request.getContextPath()%>' + '/login'">
                                        <td class="px-4 text-success align-middle font-weight-bold">1101</td>   
                                        <td class="px-4 align-middle">Nguyễn Văn A</td>
                                        <td class="text-center align-middle">09/12/2021</td>
                                        <td class=" align-middle">Giò lụa, giò chả, giò bì, ...</td>
                                        <td class="text-center align-middle">2,500,000 VNĐ</td>
                                        <td class=" align-middle">N/A</td>
                                    </tr>
                                    <tr onclick="window.location.href = '<%=request.getContextPath()%>' + '/login'">
                                        <td class="px-4 text-success align-middle font-weight-bold">1102</td>   
                                        <td class="px-4 align-middle">Nguyễn Văn B</td>
                                        <td class="text-center align-middle">10/12/2021</td>
                                        <td class=" align-middle">N/A</td>
                                        <td class="text-center align-middle">700,000 VNĐ</td>
                                        <td class=" align-middle">N/A</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <%@include file="./component/footer.jsp" %>
            </div>
        </div>
    </body>
</html>
