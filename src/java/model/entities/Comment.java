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
public class Comment {

    private int commentID;
    private String content;
    private Date dateComment;
    private Post post;
    private User user;
    private boolean isActive;
    
    private List<User> userList = null;

    public Comment() {
    }

    public Comment(int commentID, String content, Date dateComment, Post post, User user, boolean isActive) {
        this.commentID = commentID;
        this.content = content;
        this.dateComment = dateComment;
        this.post = post;
        this.user = user;
        this.isActive = isActive;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDateComment() {
        return dateComment;
    }

    public void setDateComment(Date dateComment) {
        this.dateComment = dateComment;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
