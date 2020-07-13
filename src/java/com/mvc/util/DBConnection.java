package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection createConnection() throws SQLException, ClassNotFoundException{
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
        String url = "jdbc:derby://localhost:1527/AutoRent;create=true;user=root;password=root";
        Connection con = DriverManager.getConnection(url);
        return con; 
    } 
}