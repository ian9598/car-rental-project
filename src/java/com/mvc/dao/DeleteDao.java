package com.mvc.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.model.Rental;
import com.mvc.util.DBConnection;
import java.sql.Statement;
 
public class DeleteDao { 
     public String DeleteR(Rental r) throws ClassNotFoundException
     {
         Connection con = null;
         PreparedStatement preparedStatement = null;
         String rent_id = String.valueOf(r.getRent_id());
         try
         {
             con = DBConnection.createConnection();
             String query = "DELETE FROM ROOT.RENTAL WHERE RENT_ID=?"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query);
             preparedStatement.setInt(1,r.getRent_id());
             int i = preparedStatement.executeUpdate(); 
             
             if (i!=0)  //Just to ensure data has been inserted into the database
             return "SUCCESS"; 
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }       
          return "error";
     }
}