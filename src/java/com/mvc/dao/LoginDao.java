package com.mvc.dao;

import com.mvc.model.staffLogin;
import com.mvc.model.custLogin;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mvc.util.DBConnection;

public class LoginDao {
  public String authenticateUserC(custLogin L) throws SQLException, ClassNotFoundException
  {
   String userName = L.getUserName(); //Assign user entered values to temporary variables.
   String password = L.getPassword();

   Connection con = null;
   Statement statement = null;
   ResultSet resultSet = null;

   String userNameDB = "";
   String passwordDB = "";

   try{
        con = DBConnection.createConnection(); //Fetch database connection object
        statement = con.createStatement(); //Statement is used to write queries. Read more about it.
        resultSet = statement.executeQuery("select username,password from customer"); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.

        while(resultSet.next()) // Until next row is present otherwise it return false
        {
            userNameDB = resultSet.getString("username"); //fetch the values present in database
            passwordDB = resultSet.getString("password");

            if(userName.equals(userNameDB) && password.equals(passwordDB)){
                return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
            }
        }
    } catch(SQLException e){
        e.printStackTrace();
    }
   
    return "Invalid user credentials"; // Return appropriate message in case of failure
   }
   
  public String authenticateUserS(staffLogin L) throws SQLException, ClassNotFoundException
  {
   String userName = L.getUserName(); //Assign user entered values to temporary variables.
   String password = L.getPassword();

   Connection con = null;
   Statement statement = null;
   ResultSet resultSet = null;

   String userNameDB = "";
   String passwordDB = "";

   try{
        con = DBConnection.createConnection(); //Fetch database connection object
        statement = con.createStatement(); //Statement is used to write queries. Read more about it.
        resultSet = statement.executeQuery("select username,password from staff"); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.

        while(resultSet.next()) // Until next row is present otherwise it return false
        {
            userNameDB = resultSet.getString("username"); //fetch the values present in database
            passwordDB = resultSet.getString("password");

            if(userName.equals(userNameDB) && password.equals(passwordDB)){
                return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
            }
        }
    } catch(SQLException e){
        e.printStackTrace();
    }
   
    return "Invalid user credentials"; // Return appropriate message in case of failure
   }
  
}