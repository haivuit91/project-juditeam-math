/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entities;

/**
 *
 * @author Tuanka
 */
public class Resource {
    private int resID;
    private String title;

    public Resource(){
        
    }
    public Resource(int resID, String title, CatResource catRes) {
        this.resID = resID;
        this.title = title;
        this.catRes = catRes;
    }
    
    private CatResource catRes;

    public int getResID() {
        return resID;
    }

    public void setResID(int resID) {
        this.resID = resID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public CatResource getCatRes() {
        return catRes;
    }

    public void setCatRes(CatResource catRes) {
        this.catRes = catRes;
    }
}
