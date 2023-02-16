/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author Nhân
 */
public class Order {

    private int orderId;
    private int customerId;
    private int orderStatus;
    private String orderDate;
    private ArrayList<OrderDetail> listItems;
    private String customerName="";

    public Order(int orderId, int customerId, int orderStatus, String orderDate, ArrayList<OrderDetail> listItems) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
        this.listItems = listItems;
    }

//    public Order(int orderId, int customerId, int orderStatus, String orderDate) {
//        this.orderId = orderId;
//        this.customerId = customerId;
//        this.orderStatus = orderStatus;
//        this.orderDate = orderDate;
//    }
    
    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public ArrayList<OrderDetail> getListItems() {
        return listItems;
    }

    public void setListItems(ArrayList<OrderDetail> listItems) {
        this.listItems = listItems;
    }

    public float getTotal() {
        float total = 0;
        for (int i = 0; i < listItems.size(); i++) {
            total += listItems.get(i).getSubTotal();
        }
        return total;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    
}
