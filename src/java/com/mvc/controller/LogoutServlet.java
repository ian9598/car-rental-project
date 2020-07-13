package com.mvc.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
    //private static final long serialVersionUID = 1L;
  
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    { 
      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Expires", "0");
      
      String userPath = request.getServletPath();
      HttpSession session = request.getSession(false); //Fetch session object

            session.invalidate(); //removes all session attributes bound to the session
            request.setAttribute("errMessage", "You have logged out successfully");
            
            if(userPath.equals("/LogoutServletC")){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/loginCust.jsp");
            requestDispatcher.forward(request, response);
            }
            else if(userPath.equals("/LogoutServletS")){
            RequestDispatcher view = request.getRequestDispatcher("/loginStaff.jsp");
            view.forward(request, response);
           }
           
            System.out.println("Logged out");
            
        
    }
}