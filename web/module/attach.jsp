<%-- 
    Document   : attach
    Created on : Jun 21, 2014, 8:05:37 AM
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

        <div class="col-md-6 col-md-offset-3" style="border:1px solid #DDDDDD;margin-top: 80px">
            <div class="modal-header">
                <label style="size: 22px;font-weight: bold">Đính kèm tập tin</label>
            </div>
            <div class="col-md-12 panel panel-body">
                <div class="form-group" style="">
                    <c:forEach items="${list_attach}" var="item">
                        <div class="col-md-10 " style="border:1px solid threedhighlight;height:35px; padding: 5px;margin-top: 10px">
                            <label>${item.title}</label>
                        </div>
                        <div class="col-md-2"  style="margin-top: 10px">
                            <a href="attach?action=del&id=${item.attachID}&post-id=${id}" class="btn btn-danger">Xóa</a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-4 col-md-offset-8 panel panel-body" style="margin:-20px 0 0 340px">
                <button type="submit" class="btn bg-primary" data-toggle="modal" data-target="#myModal">
                    Thêm
                </button>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <label style="size: 22px;font-weight: bold">Upload tập tin</label>
                            </div>
                            <form action="attach" name="upload" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                                <input type="text" name="id" value="${id}" style="display: none"/>
                                <div class="col-md-12 alert alert-success" style="background: none;border: none" >
                                    <label style="size: 22px;font-weight: normal">Mô tả tập tin</label>
                                    <input type="text" name="title" value="" class="form-control" />
                                    <input type="file" name="file" class="form-control" style="margin-top:20px" />
                                </div>
                                <div class="modal-footer"  style="border: none">
                                    <button type="submit" name="action" value="up-load" class="btn btn-primary">Tải lên</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <form action="attach" name="finish" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                    <button type="submit" name="action" value="finish" class="btn bg-danger" style="margin:-56px 0 0 80px">Hoàn tất</button>
                    <input type="text" name="id" value="${id}" style="display: none"/>
                </form>
            </div>
        </div>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
