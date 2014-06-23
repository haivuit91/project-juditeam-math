/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.dao.service;

import java.util.List;
import model.entities.Category;

/**
 *
 * @author Tuanka
 */
public interface CategoryDAOService {
    /**
     * get all category from database
     * @return list category
     */
    List<Category> getCategories();
    /**
     * get category by category ID
     * @param catID category ID
     * @return Object category
     */
    Category getCategoryByID(int catID);
    /**
     * get category by name
     * @param catName category name
     * @return Object category
     */
    Category getCategoryByName(String catName);
    /**
     * insert category to database
     * @param category object category
     * @return true if insert success
     */
    boolean inserCategory(Category category);
    /**
     * update category to database
     * @param category object category
     * @return true if update success
     */
    boolean updateCategory(Category category);
    /**
     * delete category from database by category id
     * @param catID category id
     * @return true if success
     */
    boolean deleteCategory(int catID);
    /**
     * enable or disable category by category id
     * @param category 
     * @return 
     */
    boolean activeCategory(Category category);
}
