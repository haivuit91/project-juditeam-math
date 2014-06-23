/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entities;

import java.sql.Date;

/**
 *
 * @author Thanh
 */
public class Resource {
    private int resourceID;
    private String title;
    private Date dateUpload;
    private User user;
    private CatResource catResource;
    private boolean isActive;
    
    
    public Resource(){
    }

    public Resource(int resourceID, String title, Date dateUpload, User user, CatResource catResource, boolean isActive) {
        this.resourceID = resourceID;
        this.title = title;
        this.dateUpload = dateUpload;
        this.user = user;
        this.catResource = catResource;
        this.isActive = isActive;
    }

    public int getResourceID() {
        return resourceID;
    }

    public void setResourceID(int resourceID) {
        this.resourceID = resourceID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDateUpload() {
        return dateUpload;
    }

    public void setDateUpload(Date dateUpload) {
        this.dateUpload = dateUpload;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public CatResource getCatResource() {
        return catResource;
    }

    public void setCatResource(CatResource catResource) {
        this.catResource = catResource;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    
    
}
