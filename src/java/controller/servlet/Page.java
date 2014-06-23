/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.CategoryDAO;
import model.dao.PostDAO;
import model.dao.service.PostDAOService;
import model.entities.Post;
import util.Constants;
import util.DataFile;

/**
 *
 * @author Welcomes
 */
public class Page extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        String realPath = getServletContext().getRealPath("/");
        String absolutePath = realPath.replace("build\\web", "");
        ServletContext context = getServletContext();
        boolean isLoaded = false;
        if (context.getAttribute("loaded") != null) {
            isLoaded = (boolean) context.getAttribute("loaded");
        }
        if (!isLoaded) {
            DataFile.loadFile(absolutePath);
            context.setAttribute("loaded", true);
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String page = request.getParameter("p");
        if (page != null) {
            switch (page) {
                case "result-seacher":
                    request.setAttribute(util.Constants.PAGE, "result-seacher");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_HOME).forward(request, response);
                    break;
                case "new-topic":
                    request.setAttribute(util.Constants.PAGE, "new-topic");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_HOME).forward(request, response);
                    break;
                case "login-logout":
                    request.setAttribute(util.Constants.PAGE, "login-logout");
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_HOME).forward(request, response);
                    break;
                case "seach-nc":
                    request.setAttribute(util.Constants.PAGE, "seach-nc");
                    request.setAttribute(Constants.LIST_CATEGORY, CategoryDAO.getInstance().getCategories());
                    request.removeAttribute(util.Constants.MSG_RESULT);
                    request.getRequestDispatcher(util.Constants.URL_HOME).forward(request, response);
                    break;
            }
        } else {
            // default load post by post day
            defaultLoad(request, response);

        }
    }

    private void defaultLoad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> listPost = PostDAO.getInstance().getPostByDate();
        paging(request, response, listPost);
        request.setAttribute(Constants.ACTION,"load-default");
        request.getRequestDispatcher(util.Constants.URL_HOME).forward(request, response);
    }

    private void paging(HttpServletRequest request, HttpServletResponse response, List<Post> listResource) {
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
                listPostPerPage.add(listResource.get(i));
            }
        }
        request.setAttribute(Constants.TOTAL_PAGE, Math.ceil(listResource.size() * 1.0 / offset));
        request.setAttribute(Constants.CURRENT_PAGE, currentPage);
        request.setAttribute(Constants.RESULT_SEARCH, listPostPerPage);
    }
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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
