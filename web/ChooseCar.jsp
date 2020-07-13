
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
driver="org.apache.derby.jdbc.ClientDriver"
url="jdbc:derby://localhost:1527/AutoRent" user="root"
password="root"/>
<html>
<head>
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
    width: 300px;
    height: 200px;
    background: #000;
    opacity: 0.9;
    color: #fff;
    top: 50%;
    left: 50%;
    position: absolute;
    transform: translate(-50%,-50%);
    box-sizing: border-box;
    padding: 20px 30px;
}
h1{
    margin: 0;
    padding: 0 0 20px;
    text-align: center;
    font-size: 25px;
}

.loginbox p{
    margin: 0;
    padding: 0;
    font-weight: bold;
     font-size: 15px;
}

.loginbox input{
    width: 100%;
    margin-bottom: 20px;
}
.loginbox input[type="date"], input[type="time"]
{
    font-family:monospace;
    font-size: 17px;
    text-align: center;
}
.loginbox input[type="text"]
{
    border: none;
    border-bottom: 1px solid #fff;
    background: transparent;
    outline: none;
    height: 40px;
    color: orange;
    font-size: 20px;
    text-align: center;
}

.loginbox input[type="submit"]
{
    border: none;
    outline: none;
    height: 40px;
    background: orange;
    color: #fff;
    font-size: 18px;
    border-radius: 20px;
}
.loginbox input[type="submit"]:hover
{
    cursor: pointer;
    background: orangered;
    color: #000;
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
select {
  background-color: orange;
  width: 235px;
  font-size: 19px;
  text-align: center;
  color: white;
}
</style>
<title>Choose Car</title>
<link rel="icon" type="image/png" href="css/icon1.png"/>
</head>
<body>  
    <br><br><br><br><br><br><br><br><br><br><h1 style="color:Black">Choose Car Name</h1>
    <div class="loginbox">
       
        <form action='RentCar.jsp' method="post">
            <br>
            <select name="car" >
            <sql:query var="result" dataSource="${myDatasource}">SELECT DISTINCT CAR_NAME FROM CAR</sql:query>
            
            <c:forEach var="row" items="${result.rowsByIndex}">  
            <c:forEach var="column" items="${row}">
             <option value='${column}'> <c:out value="${column}"/></option>
            </c:forEach> 
            </c:forEach>
            </select>
            <br><br><br><br><input type='submit' value="Go">
        </form>
    </div>

        
</body>
</html>
