<%-- 
    Document   : result-search2
    Created on : Jun 23, 2014, 9:09:54 PM
    Author     : Tuanka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background: #a09e9e">
        <div id="wapper-result">
            <c:if test="${total_result != null}">
                <div id="alert"> 
                        ${total_result != '0' ? total_result:' Không tìm thấy'} kết quả ${total_result == '0' ? '':'được tìm thấy'}
                </div>
            </c:if>
            <c:forEach items="${result_search}" var="item">
                <div class="block">
                    <div class="header">
                        <div class="title"><a href="detail?action=view&id=${item.postID}">${item.title}</a></div>
                        <div class="date">${item.datePost}</div>
                    </div>
                    <div class="line"></div>
                    <div class="summary">Tóm tắt nội dung:</div>
                    <div class="content">
                        <p>${item.summary}</p>
                        <p class="link"><span>Liên kết: </span><a href="${item.link}">${item.link}</a></p>
                    </div>
                    <div class="info">
                        Danh mục: <label class="cat">${item.category.categoryName}</label> Người viết: <label>${item.user.userName}</label>
                    </div>
                </div>
            </c:forEach>
            <div id="page">
                <c:if test="${action == 'search-cb'}">
                    <c:forEach begin="1" end="${total_page}" var="i">
                        <c:if test="${current_page != i}">
                            <a href="index?page=${i}" >${i}</a>
                        </c:if>
                        <c:if test="${current_page == i}">
                            <b> ${i}</b>
                        </c:if>
                    </c:forEach>
                </c:if>
            </div>
            <div id="page">
                <c:if test="${action == 'load-default'}">
                    <c:forEach begin="1" end="${total_page}" var="i">
                        <c:if test="${current_page != i}">
                            <a href="index?page=${i}" >${i}</a>
                        </c:if>
                        <c:if test="${current_page == i}">
                            <b> ${i}</b>
                        </c:if>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </body>
</html>
