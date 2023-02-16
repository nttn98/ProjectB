/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletPkg;

import configPkg.ConfigInfo;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import manager.ProductManager;

/**
 *
 * @author Nhân
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)

public class AddProductServlet extends HttpServlet {

    ProductManager myProductManager = new ProductManager();

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

            String name, brand, description;
            float price;
            int quantity, status;

            name = request.getParameter("productName");
            brand = request.getParameter("productBrand");
            description = request.getParameter("productDescription");
            price = Float.parseFloat(request.getParameter("productPrice"));
            quantity = Integer.parseInt(request.getParameter("productQuantity"));
            status = Integer.valueOf(request.getParameter("productStatus"));

            Product newProduct = new Product(name, brand, description, price, quantity, status);

            Part imgFilePart = ((HttpServletRequest) request).getPart("fileImg");

            int idValue = 0;
            if ((idValue = myProductManager.addProduct(newProduct)) != 0) {
                System.out.println("Add product success");
                String imgName = idValue + ".jpg";
                String imgLocation = ConfigInfo.getCtxRealPath() + "\\productImage\\";
                imgFilePart.write(imgLocation + imgName);

            } else {
                System.out.println("Add product unsuccess");
            }

            String target = "ManageProductServlet?mode=view";

            RequestDispatcher requestDispatch = request.getRequestDispatcher(target);
            requestDispatch.forward(request, response);
        } catch (Exception e) {
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
