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
public class CatResource {
    private int catID;
    private String catName;
    public  CatResource(){}
    public CatResource(int catID, String catName) {
        this.catID = catID;
        this.catName = catName;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }
    
}
