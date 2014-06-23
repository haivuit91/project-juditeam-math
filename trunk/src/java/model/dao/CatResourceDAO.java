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
import model.dao.service.CatResourceService;
import model.entities.CatResource;
import model.entities.Category;

/**
 *
 * @author Tuanka
 */
public class CatResourceDAO implements CatResourceService{

    private static CatResourceDAO categoryDAO;
    public static CatResourceDAO getInstance(){
        if(categoryDAO == null)
            categoryDAO = new CatResourceDAO();
        return categoryDAO;
    }
    
    @Override
    public CatResource getCatByID(int id) {
        CatResource cat = new CatResource();
        String sql = "SELECT * FROM tbl_cat_resource where catID=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, id);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                cat.setCatID(rs.getInt("catID"));
                cat.setCatName(rs.getString("catName"));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return cat;
    }
    
}
