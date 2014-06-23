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
import model.dao.service.UserDAOService;
import model.entities.User;
import util.MD5;

/**
 *
 * @author Tuanka
 */
public class UserDAO implements UserDAOService {

    private static UserDAO userDAO;

    public static UserDAO getInstance() {
        if (userDAO == null) {
            userDAO = new UserDAO();
        }
        return userDAO;
    }

    @Override
    public List<User> getUser() {
        List<User> listUser = new ArrayList<>();
        String sql = "select * from tbl_user";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                listUser.add(getUserItem(rs));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO getUser: " + ex.toString());
        }
        return listUser;
    }

    @Override
    public List<User> getUser(boolean active) {
        List<User> listUser = new ArrayList<>();
        String sql = "select * from tbl_user where isActive =? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setBoolean(1, active);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                listUser.add(getUserItem(rs));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO getUser active: " + ex.toString());
        }
        return listUser;
    }

    @Override
    public List<User> getUserByRoleID(int roleID) {
        List<User> listUser = new ArrayList<>();
        String sql = "select * from tbl_user where roleID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, roleID);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                listUser.add(getUserItem(rs));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO getUserByRoleID: " + ex.toString());
        }
        return listUser;
    }

    @Override
    public boolean insertUser(User user) {
        String sql = "insert into tbl_user (userName,password,fullName,gender,birthDay,email,address,roleID,isActive) values(?,?,?,?,?,?,?,?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, user.getUserName());
            sm.setString(2, user.getPassword());
            sm.setString(3, user.getFullName());
            sm.setBoolean(4, user.isGender());
            sm.setDate(5, user.getBirthDay());
            sm.setString(6, user.getEmail());
            sm.setString(7, user.getAddress());
            sm.setInt(8, user.getRole().getRoleID());
            sm.setBoolean(9, user.isActive());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO insertUser: " + ex.toString());
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        String sql = "update tbl_user set userName=?,password=?,fullName=?,gender=?,birthDay=?,email=?,address=?,roleID=?,isActive=? where userID = ?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, user.getUserName());
            sm.setString(2, user.getPassword());
            sm.setString(3, user.getFullName());
            sm.setBoolean(4, user.isGender());
            sm.setDate(5, user.getBirthDay());
            sm.setString(6, user.getEmail());
            sm.setString(7, user.getAddress());
            sm.setInt(8, user.getRole().getRoleID());
            sm.setBoolean(9, user.isActive());
            sm.setInt(10, user.getUserID());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException ex) {
            System.err.println("UserDAO updateUser: " + ex.toString());
        } catch (SQLException e) {
        }
        return false;
    }

    @Override
    public boolean deleteUser(int userID) {
        String sql = "select * from tbl_user where userID = ?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, userID);
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException ex) {
            System.err.println("UserDAO deleteUser: " + ex.toString());
        } catch (SQLException e) {
        }
        return false;
    }

    @Override
    public User getUserByUserID(int userID) {
        String sql = "select * from tbl_user where userID =? ";
        User user = null;
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, userID);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) 
                user = getUserItem(rs);
        } catch (ClassNotFoundException ex) {
            System.err.println("UserDAO deleteUser: " + ex.toString());
        } catch (SQLException e) {
        }
        return user;
    }

    @Override
    public User getUserByUserName(String userName) {
        String sql = "select * from tbl_user where userName =? ";
        User user = null;
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, userName);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) 
                user = getUserItem(rs);
        } catch (ClassNotFoundException ex) {
            System.err.println("UserDAO getUserByUserName: " + ex.toString());
        } catch (SQLException e) {
        }
        return user;
    }

    @Override
    public boolean exitUser(String userName) {
        String sql = "select userID from tbl_user where userName =? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, userName);
            ResultSet rs = sm.executeQuery();
            return rs.next();
        } catch (ClassNotFoundException ex) {
            System.err.println("UserDAO exitUser: " + ex.toString());
        } catch (SQLException e) {
        }
        return false;
    }

    @Override
    public boolean exitEmail(String email) {
        String sql = "select userID from tbl_user where email =? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, email);
            ResultSet rs = sm.executeQuery();
            return rs.next();
        } catch (ClassNotFoundException ex) {
            System.err.println("UserDAO exitEmail: " + ex.toString());
        } catch (SQLException e) {
        }
        return false;
    }

    @Override
    public boolean checkLogin(User user) {
        String sql = "select userID from tbl_user where userName=? and password=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, user.getUserName());
            sm.setString(2,MD5.encryptMD5(user.getPassword()));
            ResultSet rs = sm.executeQuery();
            return rs.next();
        } catch (ClassNotFoundException ex) {
            System.err.println("UserDAO checkLogin: " + ex.toString());
        } catch (SQLException e) {
        }
        return false;
    }

    private User getUserItem(ResultSet rs) {
        User user = new User();
        try {
            user.setUserID(rs.getInt("userID"));
            user.setUserName(rs.getString("userName"));
            user.setPassword(rs.getString("password"));
            user.setFullName(rs.getString("fullName"));
            user.setGender(rs.getBoolean("gender"));
            user.setBirthDay(rs.getDate("birthDay"));
            user.setEmail(rs.getString("email"));
            user.setAddress(rs.getString("address"));
            user.setRole(RoleDAO.getInstance().getRoleByID(rs.getInt("roleID")));
            user.setActive(rs.getBoolean("isActive"));

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    @Override
    public User checkLogin(String userName, String password) {
        String sql = "select * from tbl_user where userName=? and password=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, userName);
            sm.setString(2,MD5.encryptMD5(password));
            ResultSet rs = sm.executeQuery();
            if(rs.next())
                return getUserItem(rs);
        } catch (ClassNotFoundException ex) {
            System.err.println("UserDAO checkLogin: " + ex.toString());
        } catch (SQLException e) {
        }
        return null;
    }

}
