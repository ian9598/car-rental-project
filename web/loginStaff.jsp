<html>
<head>
<script> 
function VALIDATE()
{ 
  var username = document.form.username.value; 
  var password = document.form.password.value;

  if (username==null || username=="")
  { 
  alert("Username cannot be blank"); 
  return false; 
  }
  else if(password==null || password=="")
  { 
  alert("Password cannot be blank"); 
  return false; 
  } 
}
</script> 
<title>Staff Login</title>
<link rel="icon" type="image/png" href="css/icon1.png"/>
<link rel="stylesheet" type="text/css" href="css/styleLogin.css">
</head>
<body>
<div class="titleS"><h1>&nbsp;&nbsp;Staff Login</h1></div>
<div class="cust"><a href=loginCust.jsp>CUSTOMER LOGIN</a></div>

    <div class="loginbox">
    <img src="css/avatar.png" class="avatar">
        <h1>Login Here</h1>
        <center style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
                : request.getAttribute("errMessage")%></center><br>
        <form name="form" action="LoginServletS" method="post" onsubmit="return VALIDATE()">
            <p>Username</p>
            <input type="text" name="username" placeholder="Enter Username">
            <p>Password</p>
            <input type="password" name="password" placeholder="Enter Password">
            <input type="submit" name="submit" value="Login">
        </form>
    </div>

</body>
</html>