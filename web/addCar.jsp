<%-- 
    Document   : signUp
    Created on : Jul 8, 2020, 12:11:57 PM
    Author     : iyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Car</title>
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
    width: 320px;
    height: 520px;
    background: #000;
    opacity: 0.9;
    color: #fff;
    top: 50%;
    left: 50%;
    position: absolute;
    transform: translate(-50%,-50%);
    box-sizing: border-box;
    padding: 25px 30px;
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
    font-size: 22px;
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

.loginbox input[type="text"], input[type="number"]
{
    border: none;
    border-bottom: 1px solid #fff;
    background: transparent;
    outline: none;
    height: 40px;
    color: orange;
    font-size: 16px;
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
</style>
</head>
<body>
    <div class="loginbox">
        <h1>Add Car</h1>
        <form action="carAdd">
            <p>Plate Number</p>
            <input type="text" name="car_p" placeholder="Enter Plate Number">
            <p>Car Brand</p>
            <input type="text" name="car_b" placeholder="Enter Brand">
            <p>Car Name</p>
            <input type="text" name="car_n" placeholder="Enter Name">
            <p>Rent Price (Per Day)</p>
            <input type="number" name="price" placeholder="Enter Price">
            <input type="submit" name="submit" value="Add Car">
        </form>
        
    </div>

</body>
</html>
