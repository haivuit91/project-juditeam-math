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
public class Category {
    
    private int categoryID;
    private String categoryName;
    private boolean isActive;
    
    private List<Post> postList = null;
    
    public Category(){
        
    }

    public Category(int categoryID, String categoryName, boolean isActive) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.isActive = isActive;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }
}
