/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.CategoryDAO;
import model.dao.PostDAO;
import model.dao.service.CategoryDAOService;
import model.dao.service.PostDAOService;
import model.entities.Post;
import model.entities.User;
import util.Constants;
import util.Support;

/**
 *
 * @author Tuanka
 */
public class PostManagement extends HttpServlet {

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
        String action = request.getParameter(Constants.ACTION);
        if (action != null) {
            switch (action) {
                case "preview":
                    preView(request, response);
                    break;
                case "load":
                    loadTopic(request, response);
                    break;
                case "del":
                    deleteTopic(request, response);
                    break;
                case "enable":
                    activeTopic(request, response, true);
                    break;
                case "disable":
                    activeTopic(request, response, false);
                    break;
                case "search":
                    searchTopic(request, response);
                    break;
                case "new-topic":
                    requestNewPost(request, response);
                    break;
            }
        } else {
            loadTopic(request, response);
        }
    }
    
    private void requestNewPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute(Constants.PAGE, "new-topic");
        CategoryDAOService catService = CategoryDAO.getInstance();
        request.setAttribute(Constants.LIST_CATEGORY, catService.getCategories());
        request.getRequestDispatcher(Constants.URL_ADMIN).forward(request, response);
    }
  private void preView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postID = Integer.valueOf(request.getParameter("id"));
        PostDAOService postService = PostDAO.getInstance();
        request.setAttribute(Constants.LIST_POST, postService.getPostsByID(postID));
        request.setAttribute(Constants.PAGE, "list-post");
        request.getRequestDispatcher(Constants.URL_ADMIN).forward(request, response);
    }
    private void searchTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keySearch = request.getParameter("key-search");
        PostDAOService postService = PostDAO.getInstance();
        List<Post> listResource = postService.searchByTitle(keySearch);
        paging(request, response, listResource, keySearch);
        request.setAttribute(Constants.KEY_SEARCH, keySearch);
        request.setAttribute(Constants.PAGE, "list-post");
        request.getRequestDispatcher(Constants.URL_ADMIN).forward(request, response);
    }

    private void paging(HttpServletRequest request, HttpServletResponse response, List<Post> listResource, String keySearch) {
        String sPage = request.getParameter("page");
        int currentPage = 1;
        int offset = Constants.defaultOffset;
        if (sPage != null) {
            currentPage = Integer.valueOf(sPage);
        }
        int recordBegin = (currentPage - 1) * offset;
        int recordEnd = recordBegin + offset - 1;
        List<Post> listPostPerPage = new ArrayList<>();
        for (int i = 0; i < listResource.size(); i++) {
            if (i >= recordBegin && i <= recordEnd) {
                Post item = listResource.get(i);
                item.setTitle(Support.marker(item.getTitle(), keySearch));
                listPostPerPage.add(item);
            }
        }
        request.setAttribute(Constants.TOTAL_PAGE, Math.ceil(listResource.size() * 1.0 / offset));
        request.setAttribute(Constants.CURRENT_PAGE, currentPage);
        request.setAttribute(Constants.LIST_POST, listPostPerPage);
    }

    private void activeTopic(HttpServletRequest request, HttpServletResponse response, boolean isActive) throws ServletException, IOException {
        String sID = request.getParameter("id");
        PostDAOService postService = PostDAO.getInstance();
        if (sID != null) {
            int postID = Integer.valueOf(sID);
            Post post = new Post();
            post.setPostID(postID);
            post.setActive(isActive);
            if (postService.activePost(post)) {
                request.setAttribute(Constants.MSG_RESULT, isActive ? "Kích hoạt thành công" : " Bài viết đã được vô hiệu hóa");
            } else {
                request.setAttribute(Constants.MSG_RESULT, isActive ? "Kích hoạt không thành công" : " Không thể vô hiệu hóa bài viết");
            }
        }
        reloadListPost(request, response);
    }

    private void deleteTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sID = request.getParameter("id");
        PostDAOService postService = PostDAO.getInstance();
        if (sID != null) {
            int postID = Integer.valueOf(sID);
            if (postService.deletePost(postID)) {
                request.setAttribute(Constants.MSG_RESULT, "Đã xóa");
            } else {
                request.setAttribute(Constants.MSG_RESULT, "Xóa không thành công");
            }
        }
        reloadListPost(request, response);
    }

    private void reloadListPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAOService postService = PostDAO.getInstance();
        User currentUser = (User) request.getSession().getAttribute(Constants.CURRENT_USER);
        request.setAttribute(Constants.LIST_POST, postService.getPostByUserID(currentUser.getUserID()));
        request.setAttribute(Constants.PAGE, "list-post");
        request.getRequestDispatcher(Constants.URL_ADMIN).forward(request, response);
    }

    private void loadTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute(Constants.CURRENT_USER);
        PostDAOService postService = PostDAO.getInstance();
        List<Post> listResource = postService.getPostByUserID(currentUser.getUserID());
        paging(request, response, listResource, null);
        request.setAttribute(Constants.PAGE, "list-post");
        request.getRequestDispatcher(Constants.URL_ADMIN).forward(request, response);
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
        System.out.println("admi post");
    }

}
