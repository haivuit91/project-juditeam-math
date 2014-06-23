<%-- 
    Document   : seach-nc
    Created on : Jun 12, 2014, 8:50:06 AM
    Author     : Welcomes
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <form action="search" name="search-nc" onsubmit="return checkSearchNC();">
            <div class="jumbotron navbar-seach">
                <div class="container">
                    <h3 style="text-align: center;font-size: 40px;font-weight:bold;color:white">Bạn cần tìm các bài tập toán học để ôn thi ?</h3>
                    <h5 style="text-align: center;font-size: 16px;font-weight: lighter;color:white">Nếu bạn cần hãy nhập từ khóa cần tìm và chúng tôi sẽ gợi ý cho bạn!</h5>

                    <div class="col-md-10 col-md-offset-1" style="text-align:center">
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <input id="title" value="${key_search}" name="key-search" type="text" class="form-control" placeholder="Nhập thông tin vần tìm">
                                </div>
                                <div class="col-md-6">
                                    <select class="form-control" name="type">
                                        <c:forEach items="${list_cat}" var="val">
                                            <option ${type_search == val.categoryID ? 'selected':''} value="${val.categoryID}">${val.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" >
                            <div class="col-md-12" style="margin-top:5px;">
                                <div class="col-md-2 col-md-offset-10">
                                    <button type="submit" name="action" value="search-nc" class="btn btn-primary">Tìm kiếm </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /input-group -->
                    <div class="col-md-1">
                        <a href="/project2/index"  class="label label-success" style="font-size:16;padding:10px">Tìm kiếm nâng cao </a>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
