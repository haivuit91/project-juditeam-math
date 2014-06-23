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
    private String link;
    public  Resource(){}
    public Resource(int resID, String title, String link, CatResource cat) {
        this.resID = resID;
        this.title = title;
        this.link = link;
        this.cat = cat;
    }
    
    private CatResource cat;

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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public CatResource getCat() {
        return cat;
    }

    public void setCat(CatResource cat) {
        this.cat = cat;
    }
}
