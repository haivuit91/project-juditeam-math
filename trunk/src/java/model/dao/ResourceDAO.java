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
import util.Support;

/**
 *
 * @author Tuanka
 */
public class ResourceDAO implements ResourceDAOService {

    private static ResourceDAO resourceDAO;

    public static ResourceDAO getInstace() {
        if (resourceDAO == null) {
            resourceDAO = new ResourceDAO();
        }
        return resourceDAO;
    }

    @Override
    public List<Resource> getResoureByCatID(int id) {
        List<Resource> list = new ArrayList<>();
        String sql = "SELECT * FROM tbl_resource where catID=?";
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setInt(1, id);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                list.add(getItem(rs));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.toString());
        }
        return list;
    }

    private Resource getItem(ResultSet rs) {
        Resource item = new Resource();
        try {
            item.setResID(rs.getInt("resourceID"));
            item.setTitle(rs.getString("title"));
            String link = rs.getString("link");
            item.setLink(link);
            item.setIcon(Support.getIcon(link));
            item.setCat(CatResourceDAO.getInstance().getCatByID(rs.getInt("catID")));

        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
        return item;
    }

}
