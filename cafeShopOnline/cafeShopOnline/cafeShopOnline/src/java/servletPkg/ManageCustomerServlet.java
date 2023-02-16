/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletPkg;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class ManageCustomerServlet extends HttpServlet {

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
            String target = "home.jsp";

            // check mode value = view
            if (mode.equals("view")) {
                ArrayList<Customer> listCustomers = myCustomerManager.getListCustomers();
                System.out.println("Servlet get " + listCustomers.size() + " customers");
                target = "manageCustomer.jsp";
                request.setAttribute("listCustomers", listCustomers);
            }
            // check mode value = delete
//			if (mode.equals("delete")) {
//				int id = Integer.valueOf(request.getParameter("id"));
//
//				if (myCustomerManager.deleteCustomerByID(id)) {
//					System.out.println("Delete Customer Success");
//				} else {
//					System.out.println("Delete Customer Unsuccess");
//				}
//				target = "ManageCustomerServlet?mode=view";
//			}

            // check mode value = disable
            if (mode.equals("disable")) {
                int id = Integer.valueOf(request.getParameter("id"));

                if (myCustomerManager.disableCustomerByID(id)) {
                    System.out.println("Disable Customer Success");
                } else {
                    System.out.println("Disable Customer Unsuccess");
                }
                target = "ManageCustomerServlet?mode=view";
            }
            // check mode value = enable
            if (mode.equals("enable")) {
                int id = Integer.valueOf(request.getParameter("id"));

                if (myCustomerManager.enableCustomerByID(id)) {
                    System.out.println("Enable Customer Success");
                } else {
                    System.out.println("Enable Customer Unsuccess");
                }
                target = "ManageCustomerServlet?mode=view";
            }

            RequestDispatcher requestDispatch = request.getRequestDispatcher(target);
            requestDispatch.forward(request, response);
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
