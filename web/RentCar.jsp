
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
    width: 650px;
    height: 600px;
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
    font-size: 30px;
    color: white;
}

.loginbox p{
    margin: 0;
    padding: 0;
    font-weight: bold;
     font-size: 20px;
}

.loginbox input{
    width: 100%;
    margin-bottom: 20px;
}
.loginbox input[type="date"], input[type="time"], input[type="number"], input[type="text"]
{
    font-size: 20px;
    text-align: center;
}
.loginbox input[type="text"]
{
    border: none;
    border-bottom: 1px solid #fff;
    background: transparent;
    outline: none;
    height: 40px;
    font-size: 20px;
    text-align: center;
    color:orange;
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
  background-color: white;
  width: 180px;
  font-size: 19px;
  text-align: center;
}
</style>
<title>Rent Car</title>
<link rel="icon" type="image/png" href="css/icon1.png"/>
</head>
<body> 
    <div class="loginbox">
        <h1>Rental</h1>
        <form action='RentCar' method="post">
            <p>Car Name</p>
            <input type="text" name="c" value="<%=request.getParameter("car")%>" readonly><br>
            <p>Plate Number</p><br>
            <c:set var="c" value="${param.car}"/>
            <select name="plate">
            <sql:query var="result" dataSource="${myDatasource}">SELECT PLATE_NUM FROM CAR WHERE CAR_NAME = ?
            <sql:param value="${c}"/>
            </sql:query>
            
            <c:forEach var="row" items="${result.rowsByIndex}">
            <c:forEach var="column" items="${row}">
            <option value='${column}'> <c:out value="${column}"/></option>
            </c:forEach>
            </c:forEach>
            </select><br><br>
            <p>Start Date</p><br>
            <input type="date" name="date"><br>
            <p>Start Time</p><br>
            <input type="time" name="time"><br>
            <p>Days</p><br>
            <input type="number" name="day"><br>
            <br><input type='submit' value="Confirm Rent">
        </form>
    </div>

        
</body>
</html>
