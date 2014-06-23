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
public class Attach {
    private int attachID;
    private String title;
    private String path;
    private Post post;
    private boolean isActive;

    public  Attach(){
    }
    
    public Attach(int attachID, String title, String path, Post post, boolean isActive) {
        this.attachID = attachID;
        this.title = title;
        this.path = path;
        this.post = post;
        this.isActive = isActive;
    }
    
    public int getAttachID() {
        return attachID;
    }

    public void setAttachID(int attachID) {
        this.attachID = attachID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }
    
}
