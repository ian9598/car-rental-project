
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
String sql ="select * from staff where username ='"+id+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next())
        {    
            USERNAME = resultSet.getString("username");
            PASSWORD = resultSet.getString("password");
            NAME = resultSet.getString("name");
            PHONE_NO = resultSet.getString("phone_no");
         }
        connection.close();
        } catch (Exception e) {
        e.printStackTrace();
        }
%>         
       

<html>
<head>
   
<title>Staff Profile</title>
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
.titleC{
    width: 50px;
    height: 50px;
    background: transparent;
    color: #fff;
    top: 10%;
    left: 50%;
    position: absolute;
    transform: translate(-50%,-50%);
    box-sizing: border-box;
    padding: 10px 200px;
}
.titleC h1{
    position: absolute;
    padding: 5px 10px;
    top: 10%;
    left: 27%;
    font-size: 20px;
}


.loginbox{
    width: 400px;
    height: 350px;
    background: #000;
    opacity: 0.9;
    color: #fff;
    top: 60%;
    left: 50%;
    position: absolute;
    transform: translate(-50%,-50%);
    box-sizing: border-box;
    padding: 80px 30px;
}

.avatar{
    width: 100px;
    height: 100px;
    border-radius: 50%;
    position: absolute;
    top: -50px;
    left: calc(50% - 50px);
}

h1{
    margin: 0;
    padding: 0 0 20px;
    text-align: center;
    font-size: 20px;
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

.loginbox a{
    text-decoration: none;
    font-size: 12px;
    line-height: 20px;
    color: darkgrey;
}

.loginbox a:hover
{
    color: #ffc107;
}
  
</style>
</head>
<body>

    <div class="titleC"><center><h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Staff Profile</h1></center></div>

    <div class="loginbox">
    <img src="css/avatar.png" class="avatar">
    <br><br>
    <p>Username :<i style="color: orange"><%=" " + USERNAME %></i></p><br>
    <p>Password :<i style="color: orange"><%=" " + PASSWORD %></i></p><br>
    <p>Name :<i style="color: orange"><%=" " + NAME %></i></p><br>
    <p>Phone-NO :<i style="color: orange"><%=" " + PHONE_NO %></i></p><br>  
    <br><br><br>
        <a href="homepageStaff.jsp"><h1>Home</h1></a>
    </div>

</body>
</html>
