package com.mvc.controller;

import com.mvc.model.staffLogin;
import com.mvc.model.custLogin;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.dao.LoginDao;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginServlet extends HttpServlet {

    public LoginServlet() // default constructor
    {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
     //Here username and password are the names which I have given in the input box in Login.jsp page. Here I am retrieving the values entered by the user and keeping in instance variables for further use.
        PrintWriter out = response.getWriter();
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String userPath = request.getServletPath();
        
        HttpSession session = request.getSession();
        
        if(userPath.equals("/LoginServletC")){
        custLogin L = new custLogin(); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.

        L.setUserName(userName); //setting the username and password through the L object then only you can get it in future.
        L.setPassword(password);

        LoginDao loginDao = new LoginDao(); //creating object for LoginDao. This class contains main logic of the application.
        //out.println("BBB");
        String userValidate = "";
        try {
            try {
                userValidate = loginDao.authenticateUserC(L); //Calling authenticateUser function
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if(userValidate.equals("SUCCESS")){ //If function returns success string then user will be rooted to Home page
            session.setAttribute("userName", userName); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
            request.setAttribute("userName", userName);
            response.sendRedirect("homepageCust.jsp");
            //request.getRequestDispatcher("/homepageCust.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
        }
        else {
            session.setAttribute("errMessage", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
            request.setAttribute("errMessage", userValidate);
            request.getRequestDispatcher("/loginCust.jsp").forward(request, response);//forwarding the request
        }
      }
        else if(userPath.equals("/LoginServletS")){
             staffLogin L = new staffLogin(); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.

        L.setUserName(userName); //setting the username and password through the L object then only you can get it in future.
        L.setPassword(password);

        LoginDao loginDao = new LoginDao(); //creating object for LoginDao. This class contains main logic of the application.
        //out.println("BBB");
        String userValidate = "";
        try {
            try {
                userValidate = loginDao.authenticateUserS(L); //Calling authenticateUser function
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if(userValidate.equals("SUCCESS")){ //If function returns success string then user will be rooted to Home page
            session.setAttribute("userName", userName); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
            request.setAttribute("userName", userName);
            request.getRequestDispatcher("/homepageStaff.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
        }
        else {
            session.setAttribute("errMessage", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
            request.setAttribute("errMessage", userValidate);
            request.getRequestDispatcher("/loginStaff.jsp").forward(request, response);//forwarding the request
        }
      
        }
    }
}