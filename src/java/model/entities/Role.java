/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entities;

import java.util.List;

/**
 *
 * @author Tuanka
 */
public class Role {
    
    private int roleID;
    private String roleName;
    private boolean isActive;
    
    List<User> userList = null;
    
    public Role(){
        
    }
    
    public Role(int roleID, String roleName, boolean isActive){
        this.roleID = roleID;
        this.roleName = roleName;
        this.isActive = isActive;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
}
