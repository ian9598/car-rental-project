package com.mvc.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.model.Rental;
import com.mvc.util.DBConnection;
 
public class UpdateDao { 
    public String UpdateR(Rental r) throws ClassNotFoundException
     {
         int id = r.getRent_id();
         String datee = r.getReturn_Date();
         String timee = r.getReturn_Time();
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.createConnection();
             String sql = "Update rental set return_date=?, return_time=? where rent_id=?";  
             preparedStatement = con.prepareStatement(sql); //Making use of prepared statements here to insert bunch of data
             preparedStatement.setString(1, datee);
             preparedStatement.setString(2, timee);
             preparedStatement.setInt(3,id);
             
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