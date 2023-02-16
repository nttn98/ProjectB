/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package manager;

import dao.OrderDAO;
import entity.Order;
import entity.OrderDetail;
import java.util.ArrayList;

/**
 *
 * @author Nhân
 */
public class OrderManager {

    private ArrayList<Order> listOrders;
    private OrderDAO myOrderDAO;
    private CustomerManager myCustomerManager;
    private ProductManager myProductManager;

    public OrderManager() {
        myOrderDAO = new OrderDAO();
        myCustomerManager = new CustomerManager();
        myProductManager = new ProductManager();
        updateOrderData();

    }

    public void updateOrderData() {
        this.listOrders = myOrderDAO.getAllOrders();
        for (int i = 0; i < listOrders.size(); i++) {
            ArrayList<OrderDetail> listOrderDetail = listOrders.get(i).getListItems();
            int custId = listOrders.get(i).getCustomerId();
            listOrders.get(i).setCustomerName(myCustomerManager.getCustomerByID(custId).getCustomerFullName());
            for (int j = 0; j < listOrderDetail.size(); j++) {
                int proId = listOrderDetail.get(j).getProductId();
                listOrderDetail.get(j).setProductName(myProductManager.getProductByID(proId).getProductName());
            }
        }
    }

    public Order getOrderByID(int id) {
        Order tempOrder = null;
        for (int i = 0; i < listOrders.size(); i++) {
            tempOrder = listOrders.get(i);
            if (tempOrder.getOrderId() == id) {
                return tempOrder;
            }
        }
        return null;
    }

    public ArrayList getListOrder() {
        return this.listOrders;
    }

    public ArrayList getListOrderByCustomerId(int id) {
        this.listOrders = myOrderDAO.getOrderByCustomerId(id);
        for (int i = 0; i < listOrders.size(); i++) {
            int custId = listOrders.get(i).getCustomerId();
            listOrders.get(i).setCustomerName(myCustomerManager.getCustomerByID(custId).getCustomerFullName());
        }
        return listOrders;
    }

//    public ArrayList getListOrderDetail(int id){
//        return (ArrayList) this.myOrderDAO.getOrderDetailByOrderId(id);
//    }
//    public boolean orderPending(int id) {
//        boolean result = true;
//
//        Order foundOrder = this.getOrderByID(id);
//        foundOrder.setOrderStatus(0);
//
//        this.updateOrderData();
//        return result;
//    }
    public boolean orderCompleted(int id) {
        boolean result = true;

        Order foundOrder = this.getOrderByID(id);
        foundOrder.setOrderStatus(1);

        this.myOrderDAO.updateOrder(foundOrder);

        this.updateOrderData();
        return result;
    }

}
