/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import model.entities.CatResource;

/**
 *
 * @author Tuanka
 */
public interface CatResourceService {
    CatResource getCatByID(int id);
}
