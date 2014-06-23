/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class ViewPostServlet extends HttpServlet {

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
        String action = request.getParameter(Constants.ACTION);
        if (action != null) {
            switch (action) {
                case "view":
                    viewPost(request, response);
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
        String action = request.getParameter(Constants.ACTION);
       
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

    private void viewPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAOService postService = PostDAO.getInstance();
        CommentDAOService commentService = CommentDAO.getInstance();
        AttachDAOService attachService = AttachDAO.getInstance();
        int postID = Integer.valueOf(request.getParameter("id"));
        Post post = postService.getPostByID(postID);
        post.setCommentList(commentService.getCommentByPostID(postID));
        post.setAttachList(attachService.getAttachByPostID(postID));
        request.setAttribute(Constants.CURRENT_POST, post);
        request.setAttribute(Constants.PAGE, "view-post");
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }
}
