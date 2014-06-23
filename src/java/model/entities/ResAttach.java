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
public class ResAttach {
    private int resAttachID;
    private String path;
    private Resource resource;
    private boolean isActive;
    public ResAttach(){
    }

    public ResAttach(int resAttachID, String path, Resource resource, boolean isActive) {
        this.resAttachID = resAttachID;
        this.path = path;
        this.resource = resource;
        this.isActive = isActive;
    }

    public int getResAttachID() {
        return resAttachID;
    }

    public void setResAttachID(int resAttachID) {
        this.resAttachID = resAttachID;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

}