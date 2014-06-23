/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.service;

import java.util.List;
import model.entities.Post;

/**
 *
 * @author Tuanka
 */
public interface PostDAOService {

    /**
     * get Post by post id
     *
     * @param postID
     * @return post object
     */
    Post getPostByID(int postID);

    /**
     * get all post from database
     *
     * @return list post
     */
    List<Post> getPosts();

    /**
     * get list post by user id
     *
     * @param userID id of user
     * @return list post
     */
    List<Post> getPostByUserID(int userID);
    /**
     * get post newest
     * @return 
     */
    List<Post> getPostByDate();
    
    /**
     * get list post by category id
     *
     * @param catID id of category
     * @return list post
     */
    List<Post> getPostByCatID(int catID);

    /**
     * insert post to database
     *
     * @param post
     * @return true if success
     */
    boolean insertPost(Post post);

    /**
     * update post to database
     *
     * @param post
     * @return true if success
     */
    boolean updatePost(Post post);

    /**
     * delete post by post id
     *
     * @param postID id of post
     * @return true if success
     */
    boolean deletePost(int postID);

    /**
     * search title like key
     *
     * @param key value search
     * @return list Post
     */
    List<Post> searchByTitle(String key);

    /**
     * search short title like key
     *
     * @param key
     * @return
     */
    List<Post> searchByHuongDan(String key);

    List<Post> searchByAdvance(String title, String content, String baiTap, String huongDan, String kinhNghiem);

    List<Post> searchByBaiTap(String key);

    List<Post> searchByKinhNghiem(String key);

    List<Post> searchByShortTitle(String key);
    List<Post> searchByCatID(int catID, String keySearch);

    /**
     * enable or disable post
     *
     * @param post
     * @return true if success
     */
    boolean activePost(Post post);

    /**
     * search content like key
     *
     * @param key value search
     * @return list post
     */
    List<Post> searchByContent(String key);

    /**
     * search by person post
     *
     * @param key
     * @return
     */
    List<Post> searchByUserName(String key);

    /**
     * check exit post
     *
     * @param post
     * @return true if exit
     */
    boolean exitPost(Post post);
    int nextID();
    List<Post> getPostsByID(int postID);
}
