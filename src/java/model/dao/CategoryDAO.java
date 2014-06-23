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
import model.dao.service.CategoryDAOService;
import model.entities.Category;

/**
 *
 * @author Tuanka
 */
public class CategoryDAO implements CategoryDAOService {

    private static CategoryDAO categoryDAO;

    public static CategoryDAO getInstance() {
        if (categoryDAO == null) {
            categoryDAO = new CategoryDAO();
        }
        return categoryDAO;
    }
    @Override
    public List<Category> getCategories() {
                List<Category> listCategory = new ArrayList<Category>();
        try {
            Connection conn = ConnectionFactory.getConnection();
            String sql = "select * from tbl_category where isActive = true";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getInt("categoryID"));
                category.setCategoryName(rs.getString("categoryName"));
                category.setActive(rs.getBoolean("isActive"));
                listCategory.add(category);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return listCategory;
    }

    @Override
    public Category getCategoryByID(int catID) {
        Category category = new Category();
        String sql = "select * from tbl_category where categoryID =? and isActive = true ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, catID);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                category.setCategoryID(rs.getInt("categoryID"));
                category.setCategoryName(rs.getString("categoryName"));
                category.setActive(true);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return category;
    }

    @Override
    public Category getCategoryByName(String catName) {
        Category category = new Category();
        String sql = "select * from tbl_category where categoryName =? and isActive = true ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, catName);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                category.setCategoryID(rs.getInt("categoryID"));
                category.setCategoryName(rs.getString("categoryName"));
                category.setActive(true);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return category;
    }

    @Override
    public boolean inserCategory(Category category) {
         boolean isCheck = false;
        String sql = "insert into tbl_category (categoryName,isActive) values(?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, category.getCategoryName());
            sm.setBoolean(2, category.isActive());
            return sm.executeUpdate() == 1;
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.toString());
        }
        return isCheck;
    }

    @Override
    public boolean updateCategory(Category category) {
         boolean iCheck = false;
        String sql = "update tbl_category set categoryName =? ,isActive = ? where categoryID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, category.getCategoryName());
            sm.setBoolean(2, category.isActive());
            sm.setInt(3, category.getCategoryID());
            return sm.executeUpdate() == 1;
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.toString());
        }
        return iCheck;
    }

    @Override
    public boolean deleteCategory(int catID) {
           boolean isCheck = false;
        String sql = "delete tbl_category where categoryID = ?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, catID);
            return pstmt.executeUpdate() == 1;
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.toString());
        }
        return isCheck;
    }

    @Override
    public boolean activeCategory(Category category) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
