/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servletPkg;

import entity.Cart;
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
import manager.ProductManager;

/**
 *
 * @author Nhân
 */
public class CartServlet extends HttpServlet {

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

            ProductManager myProductManager = new ProductManager();

            HttpSession mySession = request.getSession();
            Cart myCart = (Cart) mySession.getAttribute("myCart");

            String mode = request.getParameter("mode");
//            System.out.println(mode);
            String target = "home.jsp";

            // check mode value = view
            if (mode.equals("viewCart")) {
                target = "viewCart.jsp";
            }

            if (mode.equals("addCartItem")) {

                int productId = Integer.parseInt(request.getParameter("productId"));
                Product addProduct = myProductManager.getProductByID(productId);
                myCart.addProduct(addProduct);
                mySession.setAttribute("myCart", myCart);

                target = "LoginServlet?mode=homeOnly";
            }
            if (mode.equals("removeCartItem")) {

                int productId = Integer.parseInt(request.getParameter("productId"));
                
                myCart.removeItem(productId);
                mySession.setAttribute("myCart", myCart);

                target = "viewCart.jsp";
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
