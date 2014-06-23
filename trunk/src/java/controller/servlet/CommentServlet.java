/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.AttachDAO;
import model.dao.CommentDAO;
import model.dao.PostDAO;
import model.dao.service.AttachDAOService;
import model.dao.service.CommentDAOService;
import model.dao.service.PostDAOService;
import model.entities.Comment;
import model.entities.Post;
import model.entities.User;
import util.Constants;
import util.Support;

/**
 *
 * @author Tuanka
 */
public class CommentServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "comment":
                    addComment(request, response);
                    break;
            }
        }
    }

    private void addComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAOService postService = PostDAO.getInstance();
        CommentDAOService commentService = CommentDAO.getInstance();
        String content = request.getParameter("content");
        int postID = Integer.valueOf(request.getParameter("id"));
        Post post = postService.getPostByID(postID);
        User user = (User) request.getSession().getAttribute(Constants.CURRENT_USER);
        Comment comment = new Comment(0, content, Support.getDatePost(), post, user, true);
        if (commentService.insertComment(comment)) {
            request.setAttribute(Constants.MSG_RESULT, "Bình luận của bạn đã đươc gửi");
        } else {
            request.setAttribute(Constants.MSG_RESULT, "Không thể gửi bình luận");
        }
        refreshViewPost(request, response, postID);
    }

    private void refreshViewPost(HttpServletRequest request, HttpServletResponse response, int postID) throws ServletException, IOException {
        PostDAOService postService = PostDAO.getInstance();
        CommentDAOService commentService = CommentDAO.getInstance();
        AttachDAOService attachService = AttachDAO.getInstance();
        Post post = postService.getPostByID(postID);
        post.setCommentList(commentService.getCommentByPostID(postID));
        post.setAttachList(attachService.getAttachByPostID(postID));
        request.setAttribute(Constants.CURRENT_POST, post);
        request.setAttribute(Constants.PAGE, "view-post");
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }
}
