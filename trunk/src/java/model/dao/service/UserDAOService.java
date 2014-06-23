/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.User;

/**
 *
 * @author Tuanka
 */
public interface UserDAOService {
    /**
     * get all user from database
     * @return 
     */
    List<User> getUser();
    /**
     * get list user active
     * @param active
     * @return 
     */
    List<User> getUser(boolean active);
    /**
     * get list user by role id
     * @param roleID
     * @return 
     */
    List<User> getUserByRoleID(int roleID);
    /**
     * insert user to database
     * @param user
     * @return true if success
     */
    boolean insertUser(User user);
    /**
     * get user by user id
     * @param userID
     * @return user object if exit
     */
    User getUserByUserID(int userID);
    /**
     * get user by user name
     * @param userName
     * @return user object if exit
     */
    User getUserByUserName(String userName);
    /**
     * update user by user id
     * @param user
     * @return true if update success
     */
    boolean updateUser(User user);
    /**
     * delete user by user id
     * @param userID
     * @return true if delete success
     */
    boolean deleteUser(int userID);
    /**
     * check exit user by user name
     * @param userName 
     * @return true if exit
     */
    boolean exitUser(String userName);
    /**
     * check exit user by email
     * @param email
     * @return true if exit
     */
    boolean exitEmail(String email);
    /**
     * check login
     * @param user
     * @return true if user and password correct
     */
    boolean checkLogin(User user);
    /**
     * check login correct
     * @param userName
     * @param password no encryptMD5
     * @return 
     */
    User checkLogin(String userName, String password);
}
