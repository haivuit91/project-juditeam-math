/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.dao.service.CommentDAOService;
import model.dao.service.PostDAOService;
import model.dao.service.UserDAOService;
import model.entities.Comment;

/**
 *
 * @author Tuanka
 */
public class CommentDAO implements CommentDAOService {

    private static CommentDAO commentDAO;

    public static CommentDAO getInstance() {
        if (commentDAO == null) {
            commentDAO = new CommentDAO();
        }
        return commentDAO;
    }

    @Override
    public List<Comment> getComments() {
        return null;
    }

    @Override
    public List<Comment> getCommentByUserID(int userID) {
        List<Comment> list = new ArrayList<>();
        String sql = "select * from tbl_comment where userID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, userID);
            ResultSet rs = sm.executeQuery();
            while(rs.next()){
                list.add(getCommentItem(rs));
            }
        } catch (ClassNotFoundException | SQLException ex) {
        }
        return list;
    }

    @Override
    public List<Comment> getCommentByPostID(int postID) {
        List<Comment> list = new ArrayList<>();
        String sql = "select * from tbl_comment where postID=? and isActive = true ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, postID);
            ResultSet rs = sm.executeQuery();
            while(rs.next()){
                list.add(getCommentItem(rs));
            }
        } catch (ClassNotFoundException | SQLException ex) {
        }
        return list;
    }

    @Override
    public boolean insertComment(Comment comment) {
        String sql = "insert into tbl_comment(content,dateComment,postID,userID,isActive) VALUES (?,?,?,?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, comment.getContent());
            sm.setDate(2, comment.getDateComment());
            sm.setInt(3, comment.getPost().getPostID());
             sm.setInt(4, comment.getUser().getUserID());
            sm.setBoolean(5, comment.isActive());
            return sm.executeUpdate() == 1;

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO insertComment: " + ex.toString());
        }
        return false;
    }

    @Override
    public boolean updateComment(Comment comment) {
        String sql ="update tbl_comment set content=?,dateComment=?,postID=?,userID=?,isActive=? where commentID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, comment.getContent());
            sm.setDate(2, comment.getDateComment());
            sm.setInt(3, comment.getPost().getPostID());
            sm.setInt(4, comment.getUser().getUserID());
            sm.setBoolean(5, comment.isActive());
            sm.setInt(6, comment.getCommentID());
            return sm.executeUpdate() == 1;

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO updateComment: " + ex.toString());
        }
        return false;
    }

    @Override
    public boolean deleteComment(int commentID) {
         String sql ="delete from tbl_user where postID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, commentID);
            return sm.executeUpdate() == 1;

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO deleteComment: " + ex.toString());
        }
        return false;
    }

    private Comment getCommentItem(ResultSet rs) {
        Comment comment = new Comment();
        UserDAOService userService = UserDAO.getInstance();
        //  PostDAOService postService = PostDAO.class
        try {
            comment.setCommentID(rs.getInt("commentID"));
            comment.setContent(rs.getString("content"));
            comment.setDateComment(rs.getDate("dateComment"));
            comment.setPost(null);
            comment.setUser(userService.getUserByUserID(rs.getInt("userID")));
            comment.setActive(rs.getBoolean("isActive"));

        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comment;
    }

}
