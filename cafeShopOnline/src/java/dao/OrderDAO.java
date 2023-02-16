/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBcontext;
import entity.Cart;
import entity.CartItem;
import entity.Customer;
import entity.Order;
import entity.OrderDetail;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.Date;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Calendar;

/**
 *
 * @author Nhân
 */
public class OrderDAO {

    //addOrder
    public boolean addOrder(Cart myCart, int customerId) {
        String insertOrderQuery = "INSERT INTO Orders(customerId, total, orderDate, orderStatus) values (?,?,?,?);";
        String insertOrderDetailQuery = "INSERT INTO OrdersDetail(orderId ,productId ,quantity ,price, subtotal) values (?,?,?,?,?);";
        int orderIdValue = 0;
        ArrayList<CartItem> listItem = myCart.getListItem();

        try {
            Date orderDate = (Date) Calendar.getInstance().getTime();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String strDate = dateFormat.format(orderDate);

            //status 0 : dang xu ly; 1: da hoan thanh
            Connection connection = new DBcontext().getConnection();
            PreparedStatement psOrder = connection.prepareStatement(insertOrderQuery, PreparedStatement.RETURN_GENERATED_KEYS);

            psOrder.setInt(1, customerId); //wrong customer id when insert a new cart
            psOrder.setFloat(2, myCart.getTotal());
            psOrder.setString(3, strDate); // lay ngay gio he thong
            psOrder.setInt(4, 0);

            psOrder.execute();

            ResultSet rs = psOrder.getGeneratedKeys();

            if (rs.next()) {
                // Giá trị của ID (Vị trí 1 theo thiết kế của bảng)
                orderIdValue = rs.getInt(1);
            }
            System.out.println(orderIdValue);

            for (int i = 0; i < listItem.size(); i++) {

                PreparedStatement psOrderDetail = connection.prepareStatement(insertOrderDetailQuery);

                psOrderDetail.setInt(1, orderIdValue);
                psOrderDetail.setInt(2, listItem.get(i).getProduct().getProductId());
                psOrderDetail.setInt(3, listItem.get(i).getQuantity());
                psOrderDetail.setFloat(4, listItem.get(i).getProduct().getProductPrice());
                psOrderDetail.setFloat(5, listItem.get(i).getSubtotal());

                psOrderDetail.execute();

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return true;
    }

    // get order by id
    public Order getOrderById(int id) {
        String getOrderByIdQuery = "SELECT * FROM orders WHERE orderId=?;";
        Order order = null;
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(getOrderByIdQuery);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("orderId");
                int customerId = rs.getInt("customerId");
                float orderTotal = rs.getFloat("total");
                Date orderDate = rs.getDate("orderDate");
                int orderStatus = rs.getInt("orderStatus");

                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String strOrderDate = dateFormat.format(orderDate);

                ArrayList<OrderDetail> listItems = this.getOrderDetailByOrderId(orderId);

                order = new Order(orderId, customerId, orderStatus, strOrderDate, listItems);

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return order;
    }
    // get order by userId

    // get all order
    public ArrayList<Order> getAllOrders() {
        String getAllOrderQuery = "SELECT * FROM orders";
        ArrayList<Order> orders = new ArrayList<>();

        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(getAllOrderQuery);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("orderId");
                int customerId = rs.getInt("customerId");
                float orderTotal = rs.getFloat("total");
                Date orderDate = rs.getDate("orderDate");
                int orderStatus = rs.getInt("orderStatus");

                DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                String strOrderDate = dateFormat.format(orderDate);

                ArrayList<OrderDetail> listItems = this.getOrderDetailByOrderId(orderId);
                
                Order newOrder = new Order(orderId, customerId, orderStatus, strOrderDate, listItems);

                orders.add(newOrder);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return orders;
    }

    //get order by customerId
    public ArrayList<Order> getOrderByCustomerId(int id) {
        String getOrderByCustomerIdQuery = "SELECT * FROM orders where customerId=?";
        ArrayList<Order> orders = new ArrayList<>();

        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(getOrderByCustomerIdQuery);

            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("orderId");
                int customerId = rs.getInt("customerId");
                float orderTotal = rs.getFloat("total");
                Date orderDate = rs.getDate("orderDate");
                int orderStatus = rs.getInt("orderStatus");

                DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                String strOrderDate = dateFormat.format(orderDate);

                ArrayList<OrderDetail> listItems = this.getOrderDetailByOrderId(orderId);
                
                Order newOrder = new Order(orderId, customerId, orderStatus, strOrderDate, listItems);

                orders.add(newOrder);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return orders;
    }

    // get order detail by order id
    public ArrayList<OrderDetail> getOrderDetailByOrderId(int id) {
        String getOrderDetailByOrderIdQuery = "SELECT * FROM ordersdetail where orderId=?;";
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();

        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(getOrderDetailByOrderIdQuery);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("orderId");
                int productId = rs.getInt("productId");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                float subTotal = rs.getFloat("subTotal");
                
                OrderDetail newOrderDetail = new OrderDetail(orderId, productId, quantity, price);

                orderDetails.add(newOrderDetail);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return orderDetails;
    }

    // get status order
    public boolean editStatusOrder(int id, int status) {
        boolean result = true;
        String editStatusOrderQuery = "UPDATE orders SET orderStatus=? where orderId=?;";

        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(editStatusOrderQuery);

            ps.setInt(1, status);
            ps.setInt(2, id);
            result = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    //update order
    public boolean updateOrder(Order order) {
        boolean rowUpdated = false;
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement("UPDATE orders set orderStatus=? where orderId=?;");

            ps.setInt(1, order.getOrderStatus());

            ps.setInt(2, order.getOrderId());

            rowUpdated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return rowUpdated;
    }
}
