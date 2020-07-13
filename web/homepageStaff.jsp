<%-- 
    Document   : homepageCust
    Created on : Jun 23, 2020, 6:55:38 PM
    Author     : iyan
--%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
               response.setHeader("Pragma", "no-cache");
               response.setHeader("Expires", "0");
             %>
<% if(session.getAttribute("userName")==null){
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/loginStaff.jsp");
            requestDispatcher.forward(request, response);}%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>

<html>
	<head>
		<title>Staff Homepage</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
                
	</head>
	<body>
            
		<!-- Header -->
			<header id="header">
				<div class="inner">
                                    <a href="index.html" class="logo">
                                         Welcome <%=session.getAttribute("userName") %>  
					<nav id="nav">
                                                
						<a href="staffProfile.jsp">Profile</a>
						<a href="LogoutServletS">Logout</a>
                                                
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Auto-Rent System</h1>
					</header>

					<div class="flex ">

                                            <div><h3>Fast & Efficient</h3></div>							
					</div>

					<footer>
                                            <a href="viewRental.jsp" class="button">View Rent</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="viewCar.jsp" class="button">View Car</a>
                                          
					</footer>
				</div>
			</section>


		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
