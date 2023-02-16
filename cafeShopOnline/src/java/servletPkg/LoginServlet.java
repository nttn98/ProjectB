/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletPkg;

import entity.Customer;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import manager.CustomerManager;
import manager.ProductManager;

/**
 *
 * @author Nhân
 */
public class LoginServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {

            // get context path
//			ServletContext servletctx = request.getServletContext();
//			System.out.println("context-----------" + servletctx.getRealPath("/"));
//			String ctxFullPath = servletctx.getRealPath("\\");
//			ConfigInfo.setCtxRealPath(ctxFullPath);
            CustomerManager myCustomerManager = new CustomerManager();
//			int countCust = myCustomerManager.getByteData();

            ArrayList<Customer> listCustomers = myCustomerManager.getListCustomers();

            String mode = request.getParameter("mode");
            String target = "home.jsp";
            String msg = "nothing";

            if (mode.equals("login")) {
                int flag = 0;
                String userName = request.getParameter("userName");
                String userPass = request.getParameter("userPassword");
//				if (userName.equals(adminUser) && userPass.equals(adminPass)) {
//					flag = 1;
////				} else {
////
                int customerId = 0;
                for (int i = 0; i < listCustomers.size(); i++) {
                    String customerUser = listCustomers.get(i).getCustomerUserName();
                    String customerPass = listCustomers.get(i).getCustomerPassword();
                    int customerStatus = listCustomers.get(i).getCustomerStatus();
                    customerId = listCustomers.get(i).getCustomerId();
                    if (userName.equals(customerUser) && userPass.equals(customerPass) && customerStatus == 1) {
                        flag = 2;
                        break;
                    }
                }
//
//				}
//				if (flag == 1) {
//					target = "managePage.jsp";
//					msg = "Login Success";
//					HttpSession mySession = request.getSession();
//					mySession.setAttribute("logedUser", userName);
//				} else {
                if (flag == 2) {
                    target = "viedeli.jsp";
                    msg = "Login Success";
                    HttpSession mySession = request.getSession();
                    mySession.setAttribute("logedUser", userName);
                    mySession.setAttribute("loggedId", customerId);
                } else {
                    target = "login.jsp";
                    msg = "Login Failed";
                }
            }

            if (mode.equals("logout")) {

                HttpSession mySession = request.getSession();
                mySession.removeAttribute("logedUser");

                target = "login.jsp";
                msg = "User loged out";

            }

            if (mode.equals("homeOnly")) {
                target = "viedeli.jsp";
            }
            
            if (mode.equals("product")) {
                target = "product.jsp";
            }

            ProductManager myProductManager = new ProductManager();
            ArrayList<Product> listProduct = myProductManager.getListProduct();
            request.setAttribute("listProduct", listProduct);

            RequestDispatcher reqDispatch = request.getRequestDispatcher(target);
            reqDispatch.forward(request, response);

        } catch (ServletException e) {
            System.out.println(e.getMessage());
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
