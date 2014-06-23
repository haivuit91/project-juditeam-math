/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.Comment;

/**
 *
 * @author Tuanka
 */
public interface CommentDAOService {
    
    /**
     * get all comment from database
     * @return list comment
     */
    List<Comment> getComments();
    /**
     * get list comment by user id
     * @param userID
     * @return 
     */
    List<Comment> getCommentByUserID(int userID);
    /**
     * get list comment by post id
     * @param postID
     * @return 
     */
    List<Comment> getCommentByPostID(int postID);
    /**
     * insert comment to database
     * @param comment
     * @return true if success
     */
    boolean insertComment(Comment comment);
    /**
     * update comment to database
     * @param comment
     * @return true if success
     */
    boolean updateComment(Comment comment);
    /**
     * delete comment by comment id
     * @param commentID
     * @return true if delete success
     */
    boolean deleteComment(int commentID);
}
