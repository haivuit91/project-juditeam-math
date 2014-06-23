<%-- 
    Document   : login-logout
    Created on : Jun 12, 2014, 8:37:02 AM
    Author     : Welcomes
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                padding: 70px 0px;
            }
        </style>
    </head>
    <body>
        <form action="authen" name="login" method="post">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading" style="text-align: center">
                        <h5><span class="glyphicon glyphicon-lock"></span>&nbsp; ĐĂNG KÝ</h5>
                    </div>
                    <div class="panel-body">
                        <!--Ten dang nhap-->
                        <div class="form-group">
                            <div class="col-md-12" >
                                <label>Tên đăng nhập(*)</label>
                            </div>
                            <div class="col-md-12" >
                                <input type="text" name="user_name" class="form-control" id="inputEmail3" >
                            </div>
                        </div>    
                        <!--Mật khẩu-->
                        <div class="form-group">
                            <div class="col-md-12" >
                                <label>Mật khẩu(*)</label>
                            </div>
                            <div class="col-md-12" >
                                <input type="password" name="pwd" class="form-control" id="inputEmail3" >
                            </div>
                        </div> 
                        <!--Nhập lại mật khẩu-->
                        <div class="form-group">
                            <div class="col-md-12" >
                                <label>Nhập lại mật khẩu(*)</label>
                            </div>
                            <div class="col-md-12" >
                                <input type="password" name="fullName" class="form-control" id="inputEmail3" >
                            </div>
                        </div> 
                        <!--Nhập lại mật khẩu-->
                        <div class="form-group">
                            <div class="col-md-12" >
                                <label>Bạn là ai?(*)</label>
                            </div>
                            <div class="col-md-12" >
                                <select class="form-control" name="role_id">
                                    <c:forEach items="${list_role}" var="val" >
                                        <option value="${val.roleID}" >${val.roleName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div> 
                        <div class="form-group">
                            <div class="col-md-2 col-md-offset-8">
                                <button type="submit" value="signup" class="btn btn-primary" style="margin-top:10px" name="action">Đăng ký</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12" style="margin-top:5px">
                                <div class="alert alert-warning">
                                    <label>
                                        ${result_singup}
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>              
                </div>              
            </div>  
        </form>
        <form action="authen" name="signup" method="post">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading" style="text-align: center">
                        <h5><span class="glyphicon glyphicon-home"></span>&nbsp; ĐĂNG NHẬP</h5>
                    </div>
                    <div class="panel-body">

                        <div class="form-group">
                            <div class="col-md-12" >
                                <label>Tên đăng nhập(*)</label>
                            </div>
                            <div class="col-md-12" >
                                <input type="text" name="userName" class="form-control" id="inputEmail3" >
                            </div>
                        </div>    
                        <!--Mật khẩu-->
                        <div class="form-group">
                            <div class="col-md-12" >
                                <label>Mật khẩu(*)</label>
                            </div>
                            <div class="col-md-12" >
                                <input type="password" name="password" class="form-control" id="inputEmail3" >
                            </div>
                        </div> 

                        <div class="form-group">
                            <div class="col-md-2 col-md-offset-8">
                                <button type="submit" value="login" class="btn btn-warning" style="margin-top:10px" name="action">Đăng Nhập</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12" style="margin-top:5px">
                                <div class="alert alert-warning">
                                    <label>
                                        ${result_login}
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>              
                </div>    
            </div>  
        </form>
    </body>
</html>
