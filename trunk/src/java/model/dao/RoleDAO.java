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
import model.dao.service.RoleDAOService;
import model.entities.Role;

/**
 *
 * @author Tuanka
 */
public class RoleDAO implements RoleDAOService {

    private static RoleDAO roleDAO;
    public  static RoleDAO getInstance(){
        if(roleDAO == null)
            roleDAO = new RoleDAO();
        return roleDAO;
    }
    @Override
    public List<Role> getRoles() {
        List<Role> listRole = new ArrayList<>();
        String sql = "select * from tbl_role";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                listRole.add(getRoleItem(rs));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO getRoles: " + ex.toString());
        }
        return listRole;
    }

    @Override
    public Role getRoleByID(int roleID) {
        String sql = "select * from tbl_role where roleID=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, roleID);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) {
                return getRoleItem(rs);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO getRoleByID: " + ex.toString());
        }
        return null;
    }

    @Override
    public Role getRoleByName(String roleName) {
        String sql = "select * from tbl_role where roleName=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, roleName);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) {
                return getRoleItem(rs);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO getRoleByID: " + ex.toString());
        }
        return null;
    }

    @Override
    public boolean insertRole(Role role) {
        String sql = "insert into tbl_role (roleName,isActive) values(?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, role.getRoleName());
            sm.setBoolean(2, role.isActive());
            return sm.executeUpdate() == 1;

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO insertRole: " + ex.toString());
        }
        return false;
    }

    @Override
    public boolean updateRole(Role role) {
        String sql = "update tbl_role set roleName=?,isActive=? where roleID=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, role.getRoleName());
            sm.setBoolean(2, role.isActive());
            sm.setInt(3, role.getRoleID());
            return sm.executeUpdate() == 1;

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO updateRole: " + ex.toString());
        }
        return false;
    }

    @Override
    public boolean deleteRole(int roleID) {
        String sql = "delete from tbl_role where roleID=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, roleID);
            return sm.executeUpdate() == 1;

        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("UserDAO deleteRole: " + ex.toString());
        }
        return false;
    }

    private Role getRoleItem(ResultSet rs) {
        Role role = new Role();
        try {
            role.setRoleID(rs.getInt("roleID"));
            role.setRoleName(rs.getString("roleName"));
            role.setActive(rs.getBoolean("isActive"));
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return role;
    }
}
