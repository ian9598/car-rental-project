<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String id = (String) session.getAttribute("userName");
String USERNAME = "";
String PASSWORD = "";
String NAME = "";
String PHONE_NO = "";

try{
    //Class.forName("org.apache.derby.jdbc.ClientDriver");
//connection = DriverManager.getConnection("jdbc:derby://localhost:1527/AutoRent","root","root");
connection = DBConnection.createConnection();
statement=connection.createStatement();
String sql ="select * from customer where username ='"+id+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next())
        {    
            USERNAME = resultSet.getString("username");
            PASSWORD = resultSet.getString("password");
            NAME = resultSet.getString("name");
            
            if(resultSet.getString("phone_no") == null)
                PHONE_NO = "";
            else
                PHONE_NO = resultSet.getString("phone_no");
  
         }
        connection.close();
        } catch (Exception e) {
        e.printStackTrace();
        }
%>         
       

<html>
<head>
   
<title>Customer Profile</title>
<link rel="icon" type="image/png" href="css/icon1.png"/>
<link rel="stylesheet" type="text/css" href="css/styleLogin.css">

</head>
<body>

<div class="titleC"><h1>Customer Profile</h1></div>

    <div class="loginbox">
    <img src="css/avatar.png" class="avatar">
    <center style="color:red"><%=(request.getAttribute("phone_num") == null) ? ""
                : request.getAttribute("phone_num")%></center><br>
       
    <p>Username :<i style="color: orange"><%=" " + USERNAME %></i></p><br>
    <p>Password :<i style="color: orange"><%=" " + PASSWORD %></i></p><br>
    <p>Name :<i style="color: orange"><%=" " + NAME %></i></p><br>
        <form name="form" action="CustProfileUpdate" method="post">
            <p>Phone-NO:</p>
            <input type="text" name="phone_no" value="<%= PHONE_NO %>" >
            <input type="submit" name="submit" value="Update Phone Number">
        </form>
        <a href="homepageCust.jsp"><h1>Home</h1></a>
    </div>

</body>
</html>
