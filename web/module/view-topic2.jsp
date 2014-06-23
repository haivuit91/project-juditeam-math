<%-- 
    Document   : view-topic2
    Created on : Jun 22, 2014, 9:55:13 PM
    Author     : Tuanka
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div id ="view-wapper">
            <div id="content">
                <div id="title">${current_post.title}</div>
                <div id="wrapp-post">
                    <div>
                        ${current_post.content}
                    </div>
                    <c:forEach items="${current_post.attachList}" var="item">
                        <div id="attach"><a href="${item.path}">${item.title}</a></div>
                    </c:forEach>
                    <div id="action">
                        <label>Đăng bởi: ${current_post.user.userName}</label>
                        <label>Ngày: ${current_post.datePost} </label>
                    </div>
                </div>
                <div id="wrapp-commet">
                    <c:forEach items="${current_post.commentList}" var="item">
                        <div class="comment">
                            <label>${item.user.userName}</label><br>
                            <label class="content">${item.content}</label>
                        </div>
                    </c:forEach>
                </div>
                <div id="dediter">
                    <form action="comment" method="post" accept-charset="UTF-8">
                        <input type="text" name="id" readonly value="${current_post.postID}" style="display: none"/>
                        <textarea cols="122" rows="3" name="content" placeholder="Nhập thắc mắc của bạn"></textarea>
                        <button type="submit" value="comment" name="action">Gửi</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
