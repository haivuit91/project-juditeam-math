/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.Date;
import java.util.Random;

/**
 *
 * @author Tuanka
 */
public class Support {

    public static java.sql.Date getDatePost() {
        Date currentDate = new Date();
        return new java.sql.Date(currentDate.getTime());
    }

    public static String marker(String resource, String keySearch) {
        if (keySearch != null && resource!= null) {
            return resource.replaceAll(keySearch, " <span class=\"marker\">" + keySearch + "</span>");
        }
        return resource;
    }

    public static String randomString() 
    {
        int size = 8;
        String str01 = "abcdefghijklmnopqrstuvwxyz";
        String str02 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String str03 = "0123456789";
        String strValid = str01 + str02 + str03;
        Random random = new Random();
        String mystring = "";
        for( int i=0; i<size; i++ ) {
             int randnum = random.nextInt(strValid.length()); 
             mystring = mystring + strValid.charAt(randnum);
        } 
        return mystring;
    }
    public static String getIcon(String fileName){
        String arr[] = fileName.split("\\.");
        String type = arr[arr.length -1];
        System.out.println(type);
        switch (type) {
            case "doc":
            case "DOC":
            case "docx":
            case "DOCX":
                return "image/icon/word-icon.png";
            case "pdf":
            case "PDF":
                return "image/icon/pdf-icon.png";
            case "xlsx":
            case "XSL":
                return "image/icon/excel-icon.png";
            case "zip":
            case "rar":
                return "image/icon/zip-icon.png";
        }
        return "image/icon/other-icon.png";
    }
}
