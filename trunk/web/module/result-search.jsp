<%-- 
    Document   : result-seacher
    Created on : Jun 12, 2014, 8:03:46 AM
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
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-body" style="font-weight: bold">
                <c:if test="${total_result != null}">
                    <div class="col-md-12">
                        ${total_result != '0' ? total_result:' Không tìm thấy'} kết quả ${total_result == '0' ? '':'được tìm thấy'}
                    </div>
                </c:if>
            </div>
            <!-- Table -->
            <table class="col-md-12 table-hover" style="margin-top: 10px">
                <c:forEach items="${result_search}" var="item">
                    <!--Kết qua 1-->
                    <tr style="border-bottom: #e1e3e3 solid thin">
                        <td class="col-md-12 alert alert-info">
                            <p style="font-weight: bold"><span class="glyphicon glyphicon-fast-forward"></span> &nbsp;<a href="detail?action=view&id=${item.postID}">${item.title}</a></p>  
                        </td>
                    </tr>
                    <tr style="border-bottom: #e1e3e3 solid thin">
                        <td class="col-md-12">
                            <p style="font-weight: bold">
                                Tóm tắt:
                            </p>
                            <p> 
                                ${item.summary}
                            </p>
                        </td>
                    </tr>
                    <tr style="border-bottom: #e1e3e3 solid thin">
                        <td class="col-md-12">
                            <p style="font-weight: bold">
                                Ngày đăng : ${item.datePost}
                            </p>
                        </td>
                    </tr>
                    <tr style="border-bottom: #e1e3e3 solid thin">
                        <td class="col-md-12">
                            <p style="font-weight:">
                                <b>Liên kết:</b> <a href="${item.link}">${item.link}</a>
                            </p>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <!--paging seach -->
        <div class="col-md-12 alert alert-info" style="text-align: center; background:white;border: none">
            <c:if test="${action == 'search-cb'}">
                <c:forEach begin="1" end="${total_page}" var="i">
                    <c:if test="${current_page != i}">
                        <a class="label label-primary" href="search?key_search=${key_search}&action=search-cb&page=${i}" >${i}</a>
                    </c:if>
                    <c:if test="${current_page == i}">
                        <b class="label label-warning"> ${i}</b>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>
        <!--paging default -->
        <div class="col-md-12 alert alert-info" style="text-align: center; background:white; border: none">
            <c:if test="${action == 'load-default'}">
                <c:forEach begin="1" end="${total_page}" var="i">
                    <c:if test="${current_page != i}">
                        <a  class="label label-primary" href="index?page=${i}" >${i}</a>
                    </c:if>
                    <c:if test="${current_page == i}">
                        <b class="label label-warning"> ${i}</b>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>

        <!--end paging -->

    </body>
</html>
