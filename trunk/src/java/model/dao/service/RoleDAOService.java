/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.Role;

/**
 *
 * @author Tuanka
 */
public interface RoleDAOService {
    /**
     * get all role from database
     * @return list role
     */
    List<Role> getRoles();
    /**
     * get role by role id
     * @param roleID
     * @return object role
     */
    Role getRoleByID(int roleID);
    /**
     * get role by role name
     * @param roleName role name
     * @return object role
     */
    Role getRoleByName(String roleName);
    /**
     * insert role to database
     * @param role role object
     * @return true if success
     */
    boolean insertRole(Role role);
    /**
     * update role
     * @param role role object
     * @return true if success
     */
    boolean updateRole(Role role);
    /**
     * delete role by role id
     * @param roleID role object
     * @return true if success
     */
    boolean deleteRole(int roleID);
}
