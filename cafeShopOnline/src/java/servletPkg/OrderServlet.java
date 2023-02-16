/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servletPkg;

import com.sun.org.apache.bcel.internal.generic.AALOAD;
import dao.OrderDAO;
import entity.Cart;
import entity.Order;
import entity.OrderDetail;
import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import manager.OrderManager;

/**
 *
 * @author Nhân
 */
public class OrderServlet extends HttpServlet {

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

            OrderManager myOrderManager = new OrderManager();

            OrderDAO myOrderDAO = new OrderDAO();

            HttpSession mySession = request.getSession();

            String mode = request.getParameter("mode");
//            System.out.println(mode);
            String target = "home.jsp";

            //add order using DAO directly
            if (mode.equals("addOrder")) {
                Cart myCart = (Cart) mySession.getAttribute("myCart");
                int customerId = (int) mySession.getAttribute("loggedId");
                myOrderDAO.addOrder(myCart, customerId);

                myCart.getListItem().clear();

                mySession.setAttribute("myCart", myCart);
                target = "orderSuccess.jsp";
            }
            //add order error
            if (mode.equals("addOrderError")) {
                Cart myCart = (Cart) mySession.getAttribute("myCart");
                int customerId = (int) mySession.getAttribute("loggedId");
                myOrderDAO.addOrder(myCart, customerId);

                myCart.getListItem().clear();

                mySession.setAttribute("myCart", myCart);
                target = "Error.jsp";
            }

            if (mode.equals("manage")) {
                ArrayList<Order> listOrder = myOrderManager.getListOrder();

                System.out.println("Servlet get " + listOrder.size() + " orders");

                target = "manageOrder.jsp";
                request.setAttribute("listOrder", listOrder);
            }

            if (mode.equals("viewOrderDetail")) {
                int id = Integer.valueOf(request.getParameter("orderId"));

                Order selectedOrder = myOrderManager.getOrderByID(id);

                System.out.println("Servlet get " + selectedOrder.getListItems().size() + " items");

                target = "viewOrderDetail.jsp";

                request.setAttribute("selectedOrder", selectedOrder);
            }
            
            //view order detail of customer
            if (mode.equals("viewOrderDetailCustomer")) {
                int id = Integer.valueOf(request.getParameter("orderId"));

                Order selectedOrder = myOrderManager.getOrderByID(id);

                System.out.println("Servlet get " + selectedOrder.getListItems().size() + " items");

                target = "viewOrderDetailCustomer.jsp";

                request.setAttribute("selectedOrder", selectedOrder);
            }

//            if (mode.equals("orderPending")) {
//                int id = Integer.valueOf(request.getParameter("orderId"));
//
//                if (myOrderManager.orderPending(id)) {
//                    System.out.println("Pending Success");
//                    System.out.println(id);
//
//                } else {
//                    System.out.println("Pending Unsuccess");
//                }
//                target = "OrderServlet?mode=view";
//            }
            if (mode.equals("orderCompleted")) {
                int id = Integer.valueOf(request.getParameter("orderId"));
                if (myOrderManager.orderCompleted(id)) {
                    System.out.println("Complete Success");
                } else {
                    System.out.println("Complete Unsuccess");
                }
                target = "OrderServlet?mode=manage";
            }

            if (mode.equals("customerHistoryOrder")) {
                int id = Integer.valueOf(request.getParameter("customerId"));
                ArrayList<Order> listOrder = myOrderManager.getListOrderByCustomerId(id);
                System.out.println(listOrder.get(0).getCustomerName());
                System.out.println(listOrder.get(0).getCustomerId());
                target = "manageOrderCustomer.jsp";
                request.setAttribute("listOrder", listOrder);
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
