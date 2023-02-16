/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletPkg;

import entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.StaffManager;

/**
 *
 * @author Nhân
 */
public class ManageStaffServlet extends HttpServlet {

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
            StaffManager myStaffManager = new StaffManager();
            String mode = request.getParameter("mode");
            String target = "home.jsp";

            // check mode value = view
            if (mode.equals("view")) {
                ArrayList<Staff> listStaffs = myStaffManager.getListStaffs();
                System.out.println("Servlet get " + listStaffs.size() + " staffs");
                target = "manageStaff.jsp";
                request.setAttribute("listStaffs", listStaffs);

            }

            // check mode value = delete
//			if (mode.equals("delete")) {
//				int id = Integer.valueOf(request.getParameter("id"));
//				if (myStaffManager.deleteStaffByID(id)) {
//					System.out.println("Delete Staff Success");
//				} else {
//					System.out.println("Delete Staff Unsuccess");
//				}
//
//				target = "ManageStaffServlet?mode=view";
//			}
            if (mode.equals("disable")) {
                int id = Integer.valueOf(request.getParameter("id"));

                if (myStaffManager.disableStaffByID(id)) {
                    System.out.println("Disable Staff Success");
                } else {
                    System.out.println("Disable Staff Unsuccess");
                }
                target = "ManageStaffServlet?mode=view";
            }
            // check mode value = enable
            if (mode.equals("enable")) {
                int id = Integer.valueOf(request.getParameter("id"));

                if (myStaffManager.enableCustomerByID(id)) {
                    System.out.println("Enable Staff Success");
                } else {
                    System.out.println("Enable Staff Unsuccess");
                }
                target = "ManageStaffServlet?mode=view";
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
