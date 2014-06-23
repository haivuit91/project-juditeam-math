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
import model.dao.service.ResourceDAOService;
import model.entities.CatResource;
import model.entities.Resource;
import model.entities.User;

/**
 *
 * @author Thanh
 */
public class ResourceDAO implements ResourceDAOService{
    private static ResourceDAO resourceDAO;
    public static ResourceDAO getInstance(){
    if(resourceDAO == null){
        resourceDAO = new ResourceDAO();
    }
    return resourceDAO;
    }
    

    @Override
    public List<Resource> getResources() {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
       List<Resource> listResource = new ArrayList<>();
       String sql = "select * from tbl_resource";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while(rs.next()){
                Resource resource = new Resource();
                resource.setTitle(rs.getString("title"));
                resource.setDateUpload(rs.getDate("dateUpload"));
                User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
                resource.setUser(user);
                CatResource catResource = CatResourceDAO.getInstance().getCatResourceByID(rs.getInt("catResource"));
                resource.setCatResource(catResource);
                resource.setIsActive(true);
                listResource.add(resource);
              
            }
            
        } catch (ClassNotFoundException|SQLException e) {
            System.out.println(e.toString());
        }
        return listResource;
    }
     @Override
    public Resource getResourceByID(int resID) {
        Resource resource = new Resource();
        String sql = "select * from tbl_resource where resourceID =? and isActive = true ";
         try {
             Connection conn = ConnectionFactory.getConnection();
             PreparedStatement sm = conn.prepareStatement(sql);
             sm.setInt(1, resID);
             ResultSet rs = sm.executeQuery();
             while(rs.next()){
                 resource.setResourceID(rs.getInt("resourceID"));
                 resource.setTitle(rs.getString("title"));
                 resource.setDateUpload(rs.getDate("dateUpload"));
                 User user = UserDAO.getInstance().getUserByUserID(rs.getInt("userID"));
                 resource.setUser(user);
                 CatResource catResource = CatResourceDAO.getInstance().getCatResourceByID(rs.getInt("catResourceID"));
                 resource.setCatResource(catResource);
                 resource.setIsActive(true);
             }
         } catch (ClassNotFoundException|SQLException e) {
             System.out.println(e.toString());
         }
        return resource;
    }


    @Override
    public boolean insertResource(Resource resource) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        boolean isCheck = false;
        String sql = "insert into tbl_resource (title,dateUpload,userID,catResourceID,isActive) values(?,?,?,?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, resource.getTitle());
            pstmt.setDate(2, resource.getDateUpload());
            pstmt.setInt(3, resource.getUser().getUserID());
            pstmt.setInt(4, resource.getCatResource().getCatResourceID());
            pstmt.setBoolean(5, resource.isIsActive());
            return pstmt.executeUpdate() == 1;
        } catch (ClassNotFoundException|SQLException e) {
            System.out.println(e.toString());
        }
        return isCheck;
    }

    @Override
    public boolean updateResource(Resource resource) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        boolean isCheck = false;
        String sql = "update tbl_resource set title=?,dateUpload=?,userID=?,catResourceID=?,isActive=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, resource.getTitle());
            pstmt.setDate(2, resource.getDateUpload());
            pstmt.setInt(3, resource.getUser().getUserID());
            pstmt.setInt(4, resource.getCatResource().getCatResourceID());
            pstmt.setBoolean(5, resource.isIsActive());
            return pstmt.executeUpdate() == 1;
        } catch (ClassNotFoundException|SQLException e) {
            System.out.println(e.toString());
        }
        return isCheck;
    }

    @Override
    public boolean deleteResource(int resID) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
         boolean isCheck = false;
        String sql = "delete from tbl_resource where resourceID =?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, resID);
            return sm.executeUpdate() == 1;
            
        } catch (ClassNotFoundException|SQLException e) {
            System.out.println(e.toString());
        }
        return  isCheck;
    }

   

    
    
    
}
