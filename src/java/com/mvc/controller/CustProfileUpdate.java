/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.dao.ProfileUpd;
import com.mvc.model.Customer;
import com.mvc.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author iyan
 */
public class CustProfileUpdate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         try {
            //Copying all the input parameters in to local variables
             HttpSession session = request.getSession();
        
             String phone_NO = request.getParameter("phone_no");
             String id = (String) session.getAttribute("userName");
             String userPath = request.getServletPath();
            
            Customer profile = new Customer();
            //Using Java Beans - An easiest way to play with group of related data
            profile.setPhone_no(phone_NO);
            profile.setID(id);
            
            ProfileUpd upd = new ProfileUpd();
            
            //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
            String updateP = upd.profileUpdate(profile);
            
            if(updateP.equals("SUCCESS"))   //On success, you can display a message to user on Home page
            {
                request.setAttribute("phone_num", "Successfully Update");
                request.getRequestDispatcher("/custProfile.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
          
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
