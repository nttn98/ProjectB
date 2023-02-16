/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletPkg;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.CustomerManager;

/**
 *
 * @author Nhân
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateCustomerServlet extends HttpServlet {

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

            String mode = request.getParameter("mode");
            System.out.println(mode);
            String target = "home.jsp";
            // -------------------------------------------------
            if (mode.equals("view")) {

                int id = Integer.valueOf(request.getParameter("id"));
                Customer tempCustomer = myCustomerManager.getCustomerByID(id);

                target = "updateCustomer.jsp";
                request.setAttribute("tempCustomer", tempCustomer);
            }
            
            if (mode.equals("customerView")) {
                
                int id = (int) request.getSession().getAttribute("loggedId");
                Customer tempCustomer = myCustomerManager.getCustomerByID(id);

                target = "updateCustomer.jsp";
                request.setAttribute("tempCustomer", tempCustomer);
            }
            // -----------------------------------------------------------
            if (mode.equals("edit")) {
                int id, status;
                String fullName, userName, password, address;
                long phone;

                id = Integer.valueOf(request.getParameter("customerId"));
                fullName = request.getParameter("customerFullName");
                userName = request.getParameter("customerUserName");
                password = request.getParameter("customerPassword");
                address = request.getParameter("customerAddress");
                phone = Long.valueOf(request.getParameter("customerPhone"));
                status = Integer.valueOf(request.getParameter("customerStatus"));

                Customer editCustomer = new Customer(id, fullName, userName, password, address, phone, status);

                if (myCustomerManager.updateCustomer(editCustomer)) {
                    System.out.println("Update Customer Success");
                } else {
                    System.out.println("Update Customer Unsuccess");
                }

                target = "ManageCustomerServlet?mode=view";
            }
            
            if (mode.equals("customerEdit")) {
                int id, status;
                String fullName, userName, password, address;
                long phone;

                id = Integer.valueOf(request.getParameter("customerId"));
                fullName = request.getParameter("customerFullName");
                userName = request.getParameter("customerUserName");
                password = request.getParameter("customerPassword");
                address = request.getParameter("customerAddress");
                phone = Long.valueOf(request.getParameter("customerPhone"));
                status = Integer.valueOf(request.getParameter("customerStatus"));

                Customer editCustomer = new Customer(id, fullName, userName, password, address, phone, status);

                if (myCustomerManager.updateCustomer(editCustomer)) {
                    System.out.println("Update Customer Success");
                } else {
                    System.out.println("Update Customer Unsuccess");
                }

                target = "LoginServlet?mode=homeOnly";
            }

            RequestDispatcher reqDispatch = request.getRequestDispatcher(target);
            reqDispatch.forward(request, response);
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
