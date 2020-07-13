<%-- 
    Document   : homepageCust
    Created on : Jun 23, 2020, 6:55:38 PM
    Author     : iyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<% if(session.getAttribute("userName")==null){
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/loginCust.jsp");
            requestDispatcher.forward(request, response);}%>
<!DOCTYPE html>

<html>
	<head>
		<title>Customer Homepage</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
                
	</head>
	<body>
   <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Expires", "0");
   %>
                <a id="home"></a>
		<!-- Header -->
			<header id="header">
				<div class="inner">
                                    <a href="index.html" class="logo">
                                                <!--get session from page before(custPage.jsp)--> 
                                                Welcome <%=session.getAttribute("userName") %>
                                            </a>
					<nav id="nav">
                                                <a href="rentList.jsp">Rent List</a>
                                                <a href="#car">Car</a>
						<a href="custProfile.jsp">Profile</a>
						<a href="LogoutServletC">Logout</a>
                                                
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Welcome to Auto-Rent System</h1>
					</header>

					<div class="flex ">

                                            <div><h3>Fast & Efficient</h3></div>						
					</div>

					<footer>
						<a href="ChooseCar.jsp" class="button">Rent Now</a>
					</footer>
				</div>
			</section>


		<!-- Three -->
                        <a id="car"></a>
			<section id="three" class="wrapper align-center">
				<div class="inner">
					<div class="flex flex-2">
						<article>
							<div class="image round">
								<img src="images/axia.jpg"/>
							</div>
							<header>
								<h3>Perodua Axia</h3>
							</header>
                                                    <footer>
								<a href="ChooseCar.jsp" class="button"><b>RM60/DAY</b></a>
							</footer>
							
						</article>
						<article>
							<div class="image round">
								<img src="images/myvi.jpg"/>
							</div>
							<header>
								<h3>Perodua Myvi</h3>
							</header>
                                                    <footer>
                                                        <a href="ChooseCar.jsp" class="button"><b>RM70/DAY</b></a>
							</footer>
							
						</article>
                                            <article>
							<div class="image round">
								<img src="images/saga.jpg"/>
							</div>
							<header>
								<h3>Proton Saga</h3>
							</header>
							
							<footer>
								<a href="ChooseCar.jsp" class="button"><b>RM90/DAY</b></a>
							</footer>
						</article>
                                            <article>
							<div class="image round">
								<img src="images/exora.jpg"/>
							</div>
							<header>
								<h3>Proton Exora</h3>
							</header>
							
							<footer>
								<a href="ChooseCar.jsp" class="button"><b>RM110/DAY</b></a>
							</footer>
						</article>
                                            <article>
							<div class="image round">
								<img src="images/vios.jpg" alt="Pic 01" />
							</div>
							<header>
								<h3>Toyota Vios</h3>
							</header>
							
							<footer>
								<a href="ChooseCar.jsp" class="button"><b>RM130/DAY</b></a>
							</footer>
						</article>
                                            <article>
							<div class="image round">
								<img src="images/avanza.jpg" alt="Pic 01" />
							</div>
							<header>
								<h3>Toyota Avanza</h3>
							</header>
							
							<footer>
								<a href="ChooseCar.jsp" class="button"><b>RM160/DAY</b></a>
							</footer>
						</article>
					</div>
				</div>
                        </section>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	</body>
</html>
