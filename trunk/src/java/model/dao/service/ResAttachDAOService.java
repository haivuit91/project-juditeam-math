/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.ResAttach;

/**
 *
 * @author Thanh
 */
public interface ResAttachDAOService {
    List<ResAttach> getResAttachID();
    List<ResAttach> getResAttach(int resourceID);
    boolean insertResAttach(ResAttach resAttach);
    boolean updateResAttach(ResAttach resAttach);
    boolean deleteResAttach(int resAttachID);
   
    
    
}
