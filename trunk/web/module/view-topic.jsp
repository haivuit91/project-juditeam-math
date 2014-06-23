<%-- 
    Document   : viewtopic
    Created on : Jun 12, 2014, 4:23:47 PM
    Author     : Welcomes
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="col-md-12">

            <div class="col-md-10">
                <div class="alert alert-info"> ${current_post.title}</div>
                <div class="col-md-12" style="border:#269abc solid thin">
                    <p>
                        ${current_post.content}
                    </p>
                </div>
                <div class="col-md-3 col-md-offset-12">
                    <c:forEach items="${current_post.attachList}" var="item">
                        <div class="alert-info">
                            <a href="${item.path}">${item.title}</a> 
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-12">
                    <div class="alert-danger" style="margin-left: 5px">
                        Đăng bởi: <b>${current_post.user.userName}</b>
                    </div>
                    <div class="alert-danger" style="margin-left: 5px">
                        Ngày: <i>${current_post.datePost}</i>
                    </div>
                </div>

                <div class="col-md-3 col-md-offset-9" style="margin-top:10px">
                    <!-- Large modal -->
                    <button class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Gửi bình luận</button>
                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="col-md-10 alert-info">
                                    <label>Bình luận</label>
                                    <form action="comment" method="post">
                                        <input type="text" name="id" readonly value="${current_post.postID}" style="display: none"/>
                                        <textarea class="col-md-12" name="content" style="padding: 5px;height:400px"></textarea>
                                        <div class="col-md-12" style="margin:20px 0px">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-danger" name="action" value="comment" type="submit">Gửi</button>
                                                </span>
                                            </div>                  
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <textarea class="col-md-12 panel panel-primary" disabled style="margin-top: 10px;min-height:300px">
                    <c:forEach items="${current_post.commentList}" var="item">${item.content}
                    </c:forEach>
                </textarea>

            </div>



            <div class="col-md-2 ">
                <div class="col-md-12 alert-success" style="font-weight: bold;text-align: center">
                    <p>
                        DANH MỤC
                    </p>    
                </div>
                <div class="col-md-12 alert-info" style=";text-align: center;margin-top: 10px">
                    <table class="col-md-12 table-hover">
                        <tr style="border-bottom:#269abc solid thin">
                            <td>
                                <a href="#" >Muc luc 1</a>
                            </td>
                        </tr>
                        <tr style="border-bottom:#269abc solid thin">
                            <td>Muc luc 2</td>
                        </tr>
                        <tr style="border-bottom:#269abc solid thin">
                            <td>Muc luc 3</td>
                        </tr>
                        <tr style="border-bottom:#269abc solid thin">
                            <td>Muc luc 4</td>
                        </tr>
                        <tr style="border-bottom:#269abc solid thin">
                            <td>Muc luc 5</td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
