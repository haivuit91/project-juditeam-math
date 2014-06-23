/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.Resource;

/**
 *
 * @author Thanh
 */
public interface ResourceDAOService {
    List<Resource> getResources();
    Resource getResourceByID(int resID);
    boolean insertResource(Resource resource);
    boolean updateResource(Resource resource);
    boolean deleteResource(int resID);
    
    
}
