/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletPkg;

import context.DBcontext;
import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.CustomerManager;

/**
 *
 * @author Nhân
 */
public class RegisterCustomerServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");

        try ( PrintWriter out = response.getWriter()) {

            CustomerManager myCustomerManager = new CustomerManager();

            String fullName, userName, password, address;
            int status;
            long phone;

            fullName = request.getParameter("customerFullName");
            userName = request.getParameter("customerUserName");
            password = request.getParameter("customerPassword");
            address = request.getParameter("customerAddress");
            phone = Long.valueOf(request.getParameter("customerPhone"));
            status = Integer.valueOf(request.getParameter("customerStatus"));

            Customer newCustomer = new Customer(fullName, userName, password, address, phone, status);

            if (myCustomerManager.addCustomer(newCustomer)) {
                System.out.println("Add Customer Success");
                String target = "checkLoginSuccess.jsp";

                RequestDispatcher requestDispatch = request.getRequestDispatcher(target);
                requestDispatch.forward(request, response);
            } else {
                System.out.println("Add Customer Unsuccess");
            }

            String target = "login.jsp";

            RequestDispatcher requestDispatch = request.getRequestDispatcher(target);
            requestDispatch.forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RegisterCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
