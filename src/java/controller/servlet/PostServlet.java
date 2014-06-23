/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.CategoryDAO;
import model.dao.PostDAO;
import model.dao.service.CategoryDAOService;
import model.dao.service.PostDAOService;
import model.entities.Category;
import model.entities.Post;
import model.entities.User;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import util.Constants;
import util.FileUpload;
import util.Support;

/**
 *
 * @author Tuanka
 */
public class PostServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter(Constants.ACTION);
        if (action != null) {
            switch (action) {
                case "new-topic":
                    requestNewPost(request, response);
                    break;
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PostDAOService postService = PostDAO.getInstance();
        String title = null;
        String shortTitle = null;
        String sCategoryID = null;
        String content = null;
        String link = null;
        String action = null;
        // String pathImage;
        String imageName = "";
        boolean isUploadSuccess = false;
        ServletFileUpload fileUpload = new ServletFileUpload();
        try {
            FileItemIterator itr = fileUpload.getItemIterator(request);
            while (itr.hasNext()) {
                FileItemStream fileItemStream = itr.next();
                if (fileItemStream.isFormField()) {
                    String fieldName = fileItemStream.getFieldName();
                    InputStream is = fileItemStream.openStream();

                    byte[] b = new byte[is.available()];
                    is.read(b);
                    String value = new String(b, "UTF-8");
                    if (fieldName.equals("action")) {
                        action = value;
                    }
                    if (fieldName.equals("title")) {
                        title = value;
                    }
                    if (fieldName.equals("content")) {
                        content = value;
                    }
                    if (fieldName.equals("short-title")) {
                        shortTitle = value;
                    }
                    if (fieldName.equals("category-id")) {
                        sCategoryID = value;
                    }
                    if (fieldName.equals("link")) {
                        link = value;
                    }

                } else {
                    String realPath = getServletContext().getRealPath("/");
                    String filePath = realPath.replace("\\build\\web", "\\web\\image\\post");//Duong dan luu file anh
                    imageName = fileItemStream.getName();
                    StringTokenizer token = new StringTokenizer(imageName, ".");
                    String fileNameExtension = "";
                    while (token.hasMoreElements()) {
                        fileNameExtension = token.nextElement().toString();
                    }
                    System.out.println("img: " + imageName);
                    if (!imageName.equals("")) {
                        imageName = Support.randomString();
                        isUploadSuccess = FileUpload.processFile(filePath, fileItemStream, imageName, fileNameExtension);
                        imageName += "." + fileNameExtension;
                    }
                }
            }
            Post currentPost = new Post();
            currentPost.setPostID(postService.nextID());
            currentPost.setTitle(title);
            currentPost.setShortTitle(shortTitle);
            currentPost.setCategory(new Category(Integer.valueOf(sCategoryID), "", false));
            currentPost.setContent(content);
            currentPost.setDatePost(Support.getDatePost());
            currentPost.setUser((User) request.getSession().getAttribute(Constants.CURRENT_USER));
            currentPost.setLink(link);
            currentPost.setActive(false);
            request.setAttribute(Constants.CURRENT_POST, currentPost);
            request.setAttribute(Constants.LIST_CATEGORY, CategoryDAO.getInstance().getCategories());
            if (action != null) {
                switch (action) {
                    case "up-load":
                        upLoad(request, response, imageName, isUploadSuccess);
                        break;
                    case "add-topic":
                        addTopic(request, response, currentPost);
                        break;
                }
            }
        } catch (IOException | org.apache.tomcat.util.http.fileupload.FileUploadException e) {
            response.getWriter().println(e.toString());
        }
    }

    private void addTopic(HttpServletRequest request, HttpServletResponse response, Post post) throws ServletException, IOException {
        PostDAOService postService = PostDAO.getInstance();
        if (postService.insertPost(post)) {
            response.sendRedirect("attach?action=load&id="+ post.getPostID());
        } else {
            request.setAttribute(Constants.CURRENT_POST, post);
            request.setAttribute(Constants.MSG_RESULT, "Lỗi");
            request.setAttribute(Constants.PAGE, "new-topic");
            request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
        }
    }

    private void upLoad(HttpServletRequest request, HttpServletResponse response, String imagName, Boolean isSuccess) throws ServletException, IOException {
        if (isSuccess) {
            request.setAttribute(Constants.RESULT_UPLOAD, "Hình ảnh đã được tải lên");
            request.setAttribute(Constants.URL_IMAGE, "image/post/" + imagName);
        } else {
            request.setAttribute(Constants.RESULT_UPLOAD, "Lỗi");
        }
        request.setAttribute(Constants.PAGE, "new-topic");
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }

    //   private void addInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PostDAOService postService = PostDAO.getInstance();
//        String type = request.getParameter("type");
//        String content = request.getParameter("content");
//        System.out.println(type);
//        System.out.println(content);
//        System.out.println(request.getParameter("post_id"));
//        
//        int postID = Integer.valueOf(request.getParameter("post_id"));
//      
//        Post post = postService.getPostByID(postID);
//        Boolean isSuccess = false;
//        switch(type){
//            case "kinh_nghiem":
//                KinhNghiem kinhNghiem = new KinhNghiem(0, content, post, true);
//                KinhNghiemDAOService kinhNghiemService = KinhNghiemDAO.getInstance();
//                isSuccess = kinhNghiemService.insertKinhNgiem(kinhNghiem);
//                break;
//            case "huong_dan":
//                HuongDan huongDan = new HuongDan(0, content, post, true);
//                HuongDanDAOService huongDanService = HuongDanDAO.getInstance();
//                isSuccess = huongDanService.insertHuongDan(huongDan);
//                break;
//            case "bai_tap":
//                BaiTap baiTap = new BaiTap(0,content, post, true);
//                BaiTapDAOService baiTapService = BaiTapDAO.getInstance();
//                isSuccess = baiTapService.insertBaiTap(baiTap);
//                break;
//        }
//        refreshViewPost(request, response,postID);
//    }
//    private void addNewPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        CategoryDAOService categoryService = CategoryDAO.getInstance();
//        PostDAOService postService = PostDAO.getInstance();
//        String title = request.getParameter("title");
//        String shortTitle = request.getParameter("short_title");
//        String sCategoryID = request.getParameter("category_id");
//        String content = request.getParameter("content");
//        String link = null;
//        Category category = categoryService.getCategoryByID(Integer.valueOf(sCategoryID));
//         System.out.println(category.getCategoryID()+"");
//        User user = (User)request.getSession().getAttribute(Constants.CURRENT_USER);
//        Post post = new Post(0, title, shortTitle, content,link, Support.getDatePost(), user, category, true);
//        if(postService.insertPost(post)){
//            response.sendRedirect("/project2/index");
//        }else{
//            request.setAttribute(Constants.PAGE, "new-toppic");
//            request.setAttribute(Constants.CURRENT_POST, post);
//            request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
//        }
//    }
//    private void refreshViewPost(HttpServletRequest request, HttpServletResponse response,int postID) throws ServletException, IOException {
//         PostDAOService postService = PostDAO.getInstance();
//        BaiTapDAOService baiTapService = BaiTapDAO.getInstance();
//        KinhNghiemDAOService kinhNghiemService = KinhNghiemDAO.getInstance();
//        HuongDanDAOService huongDanService = HuongDanDAO.getInstance();
//        CommentDAOService commentService = CommentDAO.getInstance();
//        Post post = postService.getPostByID(postID);
//        List<BaiTap> listBaiTap = baiTapService.listBaiTapByPostID(postID);
//        List<KinhNghiem> listKinhNghiem = kinhNghiemService.getKinhNghiemByPostID(postID);
//        List<HuongDan> listHuongDan = huongDanService.getHuongDanByPostID(postID);
//        List<Comment> listComment = commentService.getCommentByPostID(postID);
//     //   post.setBaiTapList(listBaiTap);
//   //     post.setHuongDanList(listHuongDan);
//   //     post.setKinhNghiemList(listKinhNghiem);
//        post.setCommentList(listComment);
//        request.setAttribute(Constants.CURRENT_POST, post);
//        request.setAttribute(Constants.PAGE,"view_post");
//        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
//    }
//    private void editPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
//    }
    private void requestNewPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute(Constants.PAGE, "new-topic");
        CategoryDAOService catService = CategoryDAO.getInstance();
        request.setAttribute(Constants.LIST_CATEGORY, catService.getCategories());
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }
}
