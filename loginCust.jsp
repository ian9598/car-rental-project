
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
<title>Customer Login</title>
<link rel="icon" type="image/png" href="css/icon1.png"/>
<link rel="stylesheet" type="text/css" href="css/styleLogin.css">
</head>
<body>
    <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
       response.setHeader("Pragma", "no-cache");
       response.setHeader("Expires", "0");
     %>
         
<div class="titleC"><h1>&nbsp;&nbsp;Customer Login</h1></div>
<div class="staff"><a href=loginStaff.jsp>STAFF LOGIN</a></div>

    <div class="loginbox">
    <img src="css/avatar.png" class="avatar">
        <h1>Login Here</h1>
        <center style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
                : request.getAttribute("errMessage")%></center><br>
        <form name="form" action="LoginServletC" method="post" onsubmit="return VALIDATE()">
            <p>Username</p>
            <input type="text" name="username" placeholder="Enter Username">
            <p>Password</p>
            <input type="password" name="password" placeholder="Enter Password">
            <input type="submit" name="submit" value="Login">
            <a href="signUp.jsp"><h3>Don't have an account?</h3></a>
        </form>
    </div>

</body>
</html>