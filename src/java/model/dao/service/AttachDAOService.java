/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.Attach;

/**
 *
 * @author Tuanka
 */
public interface AttachDAOService {
    List<Attach> getAttach();
    List<Attach> getAttachByPostID(int postID);
    Attach getAttachByID(int attachID);
    boolean insertAttach(Attach attach);
    boolean updateAttach(Attach attach);
    boolean deleteAttach(int attachID);
    boolean activeAttach(int attachID,boolean isActive);
}
