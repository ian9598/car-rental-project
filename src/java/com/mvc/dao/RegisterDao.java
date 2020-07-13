package com.mvc.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.model.Customer;
import com.mvc.util.DBConnection;
 
public class RegisterDao { 
     public String registerUser(Customer registerBean) throws ClassNotFoundException
     {
         String name = registerBean.getName();
         String userName = registerBean.getUserName();
         String password = registerBean.getPassword();
         
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.createConnection();
             String query = "insert into customer(username,password,name) values (?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data            
             preparedStatement.setString(1, userName);
             preparedStatement.setString(2, password);
             preparedStatement.setString(3, name);
             int i= preparedStatement.executeUpdate();
             
             if (i!=0)  //Just to ensure data has been inserted into the database
             return "SUCCESS"; 
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }       
         return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
     }
}