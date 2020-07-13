<%-- 
    Document   : signUp
    Created on : Jul 8, 2020, 12:11:57 PM
    Author     : iyan
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Car List</title>
<link rel="icon" type="image/png" href="css/icon1.png"/>
<style>
body{
    margin: 0;
    padding: 0;
    background: url(css/background1.jpg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;
}

.loginbox{
    width: 600px;
    height: 500px;
    background: #000;
    opacity: 0.9;
    color: #fff;
    top: 50%;
    left: 50%;
    position: absolute;
    transform: translate(-50%,-50%);
    box-sizing: border-box;
    padding: 40px 25px;
}
h1{
    margin: 0;
    padding: 0 0 20px;
    text-align: center;
    font-size: 35px;
}

.loginbox p{
    margin: 0;
    padding: 0;
    font-weight: bold;
}

.loginbox input{
    width: 100%;
    margin-bottom: 20px;
}

.loginbox input[type="text"], input[type="password"]
{
    border: none;
    border-bottom: 1px solid #fff;
    background: transparent;
    outline: none;
    height: 40px;
    color: orange;
    font-size: 16px;
}

td a{
  background-color: orange;
  color: white;
  padding: 0.2em 1.3em;
  text-decoration: none;
  text-transform: uppercase;
  font-size: 15px;
}

table{
   background-color: black; 
   color: white;
   border-color: orange;
   font-size: 16px;
       
}

a:hover {
    background-color: #dc2115;
}

</style>
</head>
<body>
    
       <%

            String driverName = "org.apache.derby.jdbc.ClientDriver";
            String connectionUrl = "jdbc:derby://localhost:1527/AutoRent";
            String userid = "root";
            String password = "root";
            String id = (String) session.getAttribute("userName");
        try {
        Class.forName(driverName);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        %>
    
    <br>
    <div class="loginbox" align="center">
        <h1>Car List</h1>
        <center style="color:red; font-size:20px"><%=(request.getAttribute("successD") == null) ? ""
                : request.getAttribute("successD")%></center><br>
        <a style="color: orange;font-size:20px" href="homepageStaff.jsp">Home</a><br><br>
          <table border='2'>
                <tr>
                    <th>Car Plate Number</th>
                    <th>Car Brand</th>
                    <th>Car Name</th>
                    <th>Charge Per Day (RM)</th>
                </tr>
                <tr>
                     <%
                    try{
                    connection = DriverManager.getConnection(connectionUrl, userid, password);
                    statement=connection.createStatement();
                    String sql ="select * from car ";
                    resultSet = statement.executeQuery(sql);
                   // statement=connection.createStatement();
                   // String sql ="select * from rental where";
                    resultSet = statement.executeQuery(sql);
                    int i=0;
                    while(resultSet.next()){
                    %>
                    <td><%=resultSet.getString("Plate_Num") %></td>
                     <td><%=resultSet.getString("Car_Brand") %></td>
                    <td><%=resultSet.getString("Car_Name") %></td>
                    <td><%=resultSet.getString("Rent_Price") %></td>
                </tr>

                <%
                    i++;
                    }
                    connection.close();
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                    %>
            </table>
            <center><br><a style="color: orange;font-size:20px" href="addCar.jsp">Add Car</a></center><br>
            
    
    </div>

</body>
</html>
  