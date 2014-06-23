<%-- 
    Document   : resurce.jsp
    Created on : Jun 23, 2014, 4:28:56 AM
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
        <div class="panel panel-heading">
            <a href="#">Trang chủ</a>&nbsp; /&nbsp;<a href="#">Tài liệu tham khảo</a> 
        </div>

        <table class="col-md-8 col-md-offset-2 tab-pane">
            <tr class="col-md-12 alert-info " style="border-bottom:#EDEDED solid thin;">
                <td class="col-md-3" style="border-right:  2px solid #EDEDED;min-width: 200px;font-size: 1.2em">
                    <label>Bài tập</label>
                </td>
                <td class="col-md-9" style="padding-top: 5px">
                    <c:forEach items="${list_bt}" var="item">
                        <p><a href="${item.link}">${item.title}</a></p>   
                    </c:forEach>
                </td>
            </tr>

            <tr class="col-md-12 alert-success" style="border-bottom:#EDEDED solid thin;">
                <td class="col-md-3" style="border-right:  2px solid #EDEDED;min-width: 200px;font-size: 1.2em">
                     <label>Lý thuyết</label>
                </td>
                <td class="col-md-9">
                     <c:forEach items="${list_lt}" var="item">
                        <p><a href="${item.link}">${item.title}</a></p>   
                    </c:forEach>
                </td>
            </tr>
            <tr class="col-md-12 alert-info" style="border-bottom:#EDEDED solid thin;">
                <td class="col-md-3" style="border-right:  2px solid #EDEDED;min-width: 200px;font-size: 1.2em">
                     <label>Tài liệu</label>
                </td>
                <td class="col-md-9">
                    <c:forEach items="${list_tl}" var="item">
                        <p><a href="${item.link}">${item.title}</a></p>   
                    </c:forEach>
                </td>
            </tr>
            <tr class="col-md-12 alert-success" style="border-bottom:#EDEDED solid thin;">
                <td class="col-md-3" style="border-right:  2px solid #EDEDED;min-width: 200px;font-size: 1.2em">
                    <label>Hướng dẫn</label>
                </td>
                <td class="col-md-9">
                     <c:forEach items="${list_hd}" var="item">
                        <p><a href="${item.link}">${item.title}</a></p>   
                    </c:forEach>
                </td>
            </tr>
            <tr class="col-md-12 alert-info" style="border-bottom:#EDEDED solid thin;">
                <td class="col-md-3" style="border-right:  2px solid #EDEDED;min-width: 200px;font-size: 1.2em">
                   <label>Kinh nghiệm</label>
                </td>
                <td class="col-md-9">
                     <c:forEach items="${list_kn}" var="item">
                        <p><a href="${item.link}">${item.title}</a></p>   
                    </c:forEach> 
                </td>
            </tr>

        </table>
    </body>
</html>
