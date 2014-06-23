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
public class Post {

    private int postID;
    private String title;
    private String shortTitle;
    private String content;
    private String summary;
    private String link;
    private Date datePost;
    private User user;
    private Category category;
    private boolean isActive;
    private List<Comment> commentList = null;
    private List<Attach> attachList = null;

    public Post() {

    }

    public Post(int postID, String title, String shortTitle, String content,String summary,String link, Date datePost, User user, Category category, boolean isActive) {
        this.postID = postID;
        this.title = title;
        this.shortTitle = shortTitle;
        this.content = content;
        this.summary = summary;
        this.link = link;
        this.datePost = datePost;
        this.user = user;
        this.category = category;
        this.isActive = isActive;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
    
    public int getPostID() {
        return postID;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortTitle() {
        return shortTitle;
    }

    public void setShortTitle(String shortTitle) {
        this.shortTitle = shortTitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDatePost() {
        return datePost;
    }

    public void setDatePost(Date datePost) {
        this.datePost = datePost;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public List<Attach> getAttachList() {
        return attachList;
    }

    public void setAttachList(List<Attach> attachList) {
        this.attachList = attachList;
    }
}
