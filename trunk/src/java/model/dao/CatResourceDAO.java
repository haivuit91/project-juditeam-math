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
import model.dao.service.CatResourceDAOService;
import model.entities.CatResource;
import sun.security.jca.GetInstance;

/**
 *
 * @author Thanh
 */
public class CatResourceDAO implements CatResourceDAOService{
    
    private static CatResourceDAO catResourceDAO;
    public static CatResourceDAO getInstance(){
        if(catResourceDAO == null){
            catResourceDAO = new CatResourceDAO();
        }
        return catResourceDAO;
    }

    @Override
    public List<CatResource> getCatResource() {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    List<CatResource> listCatResource = new ArrayList<CatResource>();
        try {
            Connection conn = ConnectionFactory.getConnection();
            String sql ="select * from tbl_cat_resource where isActive = true";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                CatResource catResource = new CatResource();
                catResource.setCatResourceID(rs.getInt("catResourceID"));
                catResource.setCatResourceName(rs.getString("catResourceName"));
                catResource.setIsActive(rs.getBoolean("isActive"));
                listCatResource.add(catResource);
                
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.toString());
        }
        return listCatResource;
    }
    

    @Override
    public CatResource getCatResourceByID(int catResourceID) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        CatResource catResource = new CatResource();
        String sql = "select * from tbl_cat_resource where catResourceID =? and isActive = true ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1,catResourceID);
            ResultSet rs = sm.executeQuery();
            while(rs.next()){
                catResource.setCatResourceID(rs.getInt("catResourceID"));
                catResource.setCatResourceName(rs.getString("catResourceName"));
                catResource.setIsActive(true);
                 
            }
        } catch (ClassNotFoundException|SQLException e) {
            System.out.println(e.toString());
        }
        return catResource;
    } 

    @Override
    public boolean activeCatResource(CatResource catResource) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        
    }
    
}
