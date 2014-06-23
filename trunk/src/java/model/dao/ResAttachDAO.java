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
import model.dao.service.ResAttachDAOService;
import model.entities.ResAttach;
import model.entities.Resource;


/**
 *
 * @author Thanh
 */
public class ResAttachDAO implements ResAttachDAOService{
    
    private static ResAttachDAO resAttachDAO;
    public static ResAttachDAO getInstance(){
        if(resAttachDAO == null){
           resAttachDAO = new ResAttachDAO();
              
        }
        return resAttachDAO;
    }

    @Override
    public List<ResAttach> getResAttachID() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        List<ResAttach> listResAttach = new ArrayList<>();
         String sql = "select * from tb_res_attach";
         try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while(rs.next()){
                ResAttach resAttach = new ResAttach();
                resAttach.setPath(rs.getString("path"));
                Resource resource = ResourceDAO.getInstance().getResourceByID(rs.getInt("resourceID"));
                resAttach.setResource(resource);
                resAttach.setIsActive(true);
                listResAttach.add(resAttach);
                
                
            }
        } catch (Exception e) {
        }
         return listResAttach;
    }

    @Override
    public List<ResAttach> getResAttach(int resourceID) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        List<ResAttach> listResAttach = new ArrayList<>();
        String sql = "select * from tb_res_attach where isActive = ? and resourceID =?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            pstmt.setInt(1, resourceID);
            while(rs.next()){
                ResAttach resAttach = new ResAttach();
                resAttach.setPath(rs.getString("path"));
                Resource resource = ResourceDAO.getInstance().getResourceByID(rs.getInt("resourceID"));
                resAttach.setResource(resource);
                resAttach.setIsActive(true);
                listResAttach.add(resAttach);
                
            }
        } catch (ClassNotFoundException|SQLException e) {
            System.out.println(e.toString());
        }
        return listResAttach;
    }

    @Override
    public boolean insertResAttach(ResAttach resAttach) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        boolean isCheck = false;
        String sql = "insert into tb_res_attach (path,resourceID,isActive) values(?,?,?)";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, resAttach.getPath());
            sm.setInt(2, resAttach.getResource().getResourceID());
            sm.setBoolean(3, resAttach.isIsActive());
            return sm.executeUpdate() == 1;
            
        } catch (ClassNotFoundException|SQLException e) {
            System.out.println(e.toString());
        }
        return isCheck = true;
    }

    @Override
    public boolean updateResAttach(ResAttach resAttach) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        boolean iCheck = false;
        String sql = "update tb_res_attach set path =? ,resourceID = ?,isActive = ? where resAttachID=? ";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1, resAttach.getPath());
            sm.setInt(2, resAttach.getResource().getResourceID());
            sm.setBoolean(3, resAttach.isIsActive());
            sm.setInt(4, resAttach.getResAttachID());
            return sm.executeUpdate() == 1;
        } catch (ClassNotFoundException|SQLException e) {
            System.out.println(e.toString());
        }
        return iCheck;
    }

    @Override
    public boolean deleteResAttach(int resAttachID) {
       //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        boolean isCheck = false;
        String sql = "delete tb_res_attach where resAttachID = ?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, resAttachID);
            return pstmt.executeUpdate() == 1;
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.toString());
        }
        return isCheck;
    }
    
}
