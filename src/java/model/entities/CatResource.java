/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entities;

/**
 *
 * @author Thanh
 */
public class CatResource {
    private int catResourceID;
    private String catResourceName;
    private boolean isActive;
    
    public CatResource(){
    }

    public CatResource(int catResourceID, String catResourceName, boolean isActive) {
        this.catResourceID = catResourceID;
        this.catResourceName = catResourceName;
        this.isActive = isActive;
    }

    public int getCatResourceID() {
        return catResourceID;
    }

    public void setCatResourceID(int catResourceID) {
        this.catResourceID = catResourceID;
    }

    public String getCatResourceName() {
        return catResourceName;
    }

    public void setCatResourceName(String catResourceName) {
        this.catResourceName = catResourceName;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }
    
    
}
