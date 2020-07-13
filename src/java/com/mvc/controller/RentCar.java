/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author iyan
 */
public class RentCar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RentCar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RentCar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
            HttpSession session = request.getSession();
        
           String id = (String) session.getAttribute("userName");
           String carname =  request.getParameter("c");
           String plate = request.getParameter("plate");
           String date = request.getParameter("date");
           String time = request.getParameter("time");
           int day = Integer.parseInt(request.getParameter("day"));
           double total = 0;
           
            Connection connection = null;
            Statement statement = null;
            PreparedStatement ps = null;
            ResultSet resultSet = null;


            try{
                    
                    connection = DBConnection.createConnection();
                    statement=connection.createStatement();
                    String sql ="select rent_price from car where plate_num ='"+plate+"'";
                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next())
                    {           
                        total = day * resultSet.getDouble("rent_price");
                    }
                     
                     String query = "insert into rental(username, plate_num, start_date, start_time, car_name, days, charge) values (?,?,?,?,?,?,?)";
                     ps = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data            
                     ps.setString(1, id);
                     ps.setString(2, plate);
                     ps.setString(3, date);
                     ps.setString(4, time);
                     ps.setString(5, carname);
                     ps.setInt(6, day);
                     ps.setDouble(7, total);
                    
                     int i= ps.executeUpdate();
                     
                     if(i!=0){
                          //request.setAttribute("successD", "Successfully Added");
                          request.getRequestDispatcher("/successRent.jsp").forward(request, response);
                     }
                    
                    }
                    catch (Exception e) {
                    e.printStackTrace();
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
