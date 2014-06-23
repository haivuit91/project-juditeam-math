/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.AttachDAO;
import model.dao.CategoryDAO;
import model.dao.PostDAO;
import model.dao.service.AttachDAOService;
import model.dao.service.PostDAOService;
import model.entities.Attach;
import model.entities.Category;
import model.entities.Post;
import model.entities.User;
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
public class AttachServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        System.out.println("action:" + action);
        if (action != null) {
            switch (action) {
                case "del":
                    deleteAttach(request, response);
                    break;
                case "load":
                    load(request, response);
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
        String action = null;
        // String pathImage;
        String imageName = "";
        int postID = 0;
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
                    if (fieldName.equals("id")) {
                        postID =Integer.valueOf(value);
                    }
                } else {
                    String realPath = getServletContext().getRealPath("/");
                    String filePath = realPath.replace("\\build\\web", "\\web\\file\\attach");//Duong dan luu file 
                    imageName = fileItemStream.getName();
                    StringTokenizer token = new StringTokenizer(imageName, ".");
                    String fileNameExtension = "";
                    while (token.hasMoreElements()) {
                        fileNameExtension = token.nextElement().toString();
                    }
                    if (!imageName.equals("")) {
                        imageName = Support.randomString();
                        isUploadSuccess = FileUpload.processFile(filePath, fileItemStream, imageName, fileNameExtension);
                        imageName += "." + fileNameExtension;
                    }
                }
            }
            Post post = new Post();
            post.setPostID(postID);
            Attach attach = new Attach(0, title,"file\\attach\\"+imageName, post, true);
            if (action != null) {
                switch (action) {
                    case "up-load":
                        upLoad(request, response, attach);
                        break;
                    case "finish":
                        finish(request, response,postID);
                        break;
                }
            }
        } catch (IOException | org.apache.tomcat.util.http.fileupload.FileUploadException e) {
            response.getWriter().println(e.toString());
        }
    }
    private void finish(HttpServletRequest request, HttpServletResponse response,int postID) throws ServletException, IOException {
       
        PostDAOService postService = PostDAO.getInstance();
        Post post = new Post();
        post.setPostID(postID);
        post.setActive(true);
        if(postService.activePost(post)){
            response.sendRedirect("postmanage?action=preview&id=" + postID);
        }
    }
    private void upLoad(HttpServletRequest request, HttpServletResponse response,Attach attach) {
        AttachDAOService attachServie = AttachDAO.getInstance();
        if(!attachServie.insertAttach(attach))
            request.setAttribute(Constants.MSG_RESULT,"Lỗi");
        reloadAttach(request, response, attach.getPost().getPostID());
        
        //reloadAttach(request, response,);
    }

    private void deleteAttach(HttpServletRequest request, HttpServletResponse response) {
        AttachDAOService attachService = AttachDAO.getInstance();
        try {
            int attachID = Integer.valueOf(request.getParameter("id"));
            int postID =  Integer.valueOf(request.getParameter("post-id"));
            if (attachService.deleteAttach(attachID)) {
                request.setAttribute(Constants.MSG_RESULT, "Đã xóa");
            } else {
                request.setAttribute(Constants.MSG_RESULT, "Không thẻ xóa");
            }
            reloadAttach(request, response, postID);
        } catch (NumberFormatException e) {
            System.err.println("deleteAttach error:" + e.getMessage());
        }
    }

    private void load(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("id", request.getParameter("id"));
        request.setAttribute(Constants.PAGE, "attach");
        request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
    }

    private void reloadAttach(HttpServletRequest request, HttpServletResponse response, int postID) {
        AttachDAOService attachService = AttachDAO.getInstance();
        try {
            request.setAttribute("id",postID);
            request.setAttribute(Constants.LIST_ATTACH, attachService.getAttachByPostID(postID));
            request.setAttribute(Constants.PAGE, "attach");
            request.getRequestDispatcher(Constants.URL_HOME).forward(request, response);
        } catch (IOException | NumberFormatException | ServletException e) {
            System.err.println("reloadAttach error:" + e.getMessage());
        }
    }
}
