/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.CatResource;

/**
 *
 * @author Thanh
 */
public interface CatResourceDAOService {
    List<CatResource> getCatResource();
    CatResource getCatResourceByID(int catResourceID);
    boolean activeCatResource(CatResource catResource);  
}
