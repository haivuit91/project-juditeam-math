/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.entities;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author Tuanka
 */
public class User {
    
    private int userID;
    private String userName;
    private String password;
    private String fullName;
    private boolean gender;
    private Date birthDay;
    private String email;
    private String address;
    private Role role;
    private boolean isActive;
    
    private List<Post> postList = null;
    private List<Comment> commentList = null;
    
    public User(){
        
    }
    public User(int userID, String userName, String password, String fullName, boolean gender, Date birthDay, String email, String address, Role role, boolean isActive){
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.gender = gender;
        this.birthDay = birthDay;
        this.email = email;
        this.address = address;
        this.role = role;
        this.isActive = isActive;
        
    }
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
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

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }
}
