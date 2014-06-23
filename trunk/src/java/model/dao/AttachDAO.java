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
import model.dao.service.AttachDAOService;
import model.dao.service.PostDAOService;
import model.entities.Attach;

/**
 *
 * @author Tuanka
 */
public class AttachDAO implements AttachDAOService {

    private static AttachDAO attachDAO;

    public static AttachDAO getInstance() {
        if (attachDAO == null) {
            attachDAO = new AttachDAO();
        }
        return attachDAO;
    }

    @Override
    public List<Attach> getAttach() {
        List<Attach> listAttach = new ArrayList<>();
        String sql = "select * from tbl_attach where isActive=True ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                listAttach.add(getItem(rs));
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("getAttach error: " + e.getMessage());
        }
        return listAttach;
    }

    @Override
    public Attach getAttachByID(int attachID) {
        String sql = "select * from tbl_attach where attachID=? and isActive= True ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, attachID);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) {
                return getItem(rs);
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("getAttach error: " + e.getMessage());
        }
        return null;
    }

    @Override
    public boolean insertAttach(Attach attach) {
        String sql = "insert into tbl_attach (title,path,postID,isActive) values(?,?,?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, attach.getTitle());
            sm.setString(2, attach.getPath());
            sm.setInt(3, attach.getPost().getPostID());
            sm.setBoolean(4, attach.isActive());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("insertAttach error: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean updateAttach(Attach attach) {
        String sql = "update tbl_attach set title=?,path=?,postID=?,isActive=? where attachID=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, attach.getTitle());
            sm.setString(2, attach.getPath());
            sm.setInt(3, attach.getPost().getPostID());
            sm.setBoolean(4, attach.getPost().isActive());
            sm.setInt(5, attach.getAttachID());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("updateAttach error: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean deleteAttach(int attachID) {
        String sql = "delete from tbl_attach where attachID=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, attachID);
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("deleteAttach error: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean activeAttach(int attachID,boolean isActive) {
        String sql = "update tbl_attach set isActive=? where attachID=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setBoolean(1, isActive);
            sm.setInt(2, attachID);
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("deleteAttach error: " + e.getMessage());
            return false;
        }
    }

    private Attach getItem(ResultSet rs) {
        Attach attach = new Attach();
        PostDAOService postService = PostDAO.getInstance();
        try {
            attach.setAttachID(rs.getInt("attachID"));
            attach.setTitle(rs.getString("title"));
            attach.setPath(rs.getString("path"));
            attach.setPost(postService.getPostByID(rs.getInt("postID")));
            attach.setActive(true);
        } catch (SQLException e) {
        }
        return attach;
    }

    @Override
    public List<Attach> getAttachByPostID(int postID) {
         List<Attach> listAttach = new ArrayList<>();
        String sql = "select * from tbl_attach where postID=? and isActive=True ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, postID);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                listAttach.add(getItem(rs));
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("getAttachByPostID error: " + e.getMessage());
        }
        return listAttach;
    }
}
