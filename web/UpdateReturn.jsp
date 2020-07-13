
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
    width: 370px;
    height: 420px;
    background: #000;
    opacity: 0.9;
    color: #fff;
    top: 50%;
    left: 50%;
    position: absolute;
    transform: translate(-50%,-50%);
    box-sizing: border-box;
    padding: 40px 30px;
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
     font-size: 19px;
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
</style>
<title>Update Return</title>
<link rel="icon" type="image/png" href="css/icon1.png"/>
</head>
<body>   
    <div class="loginbox">
        <h1>Update Return Date & Time</h1>
        <form action='UpdateRental' method="post">
            <input type="text" name="rent_id" value="<%=request.getParameter("rent_id")%>" readonly><br><br>
            <p>Return Date</p><br>
            <input type="date" name="Date" placeholder="Enter Date">
            <br><p>Return Time</p><br>
            <input type="time" name="Time" placeholder="Enter Time"><br>
           <br><input type="submit" value="Update">
        </form>
    </div>

        
</body>
</html>
