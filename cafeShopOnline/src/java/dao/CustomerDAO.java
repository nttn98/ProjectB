    package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import context.DBcontext;
import entity.Customer;

public class CustomerDAO {

    private String INSERT_CUSTOMER_SQL = "INSERT INTO customer"
            + "(customerFullName,customerUserName,customerPassword,customerAddress,customerPhone,customerStatus) VALUES"
            + "(?,?,?,?,?,?);";
    private String SELECT_CUSTOMER_BY_ID = "select * from customer where customerId=?;";
    private String SELECT_ALL_CUSTOMERS = "select * from customer;";
    private String DELETE_CUSTOMER_SQL = "delete from customer where customerId=?;";
    private String UPDATE_CUSTOMER_SQL = "update customer set customerFullName=?, customerUserName=?, customerPassword=?,customerAddress=?, customerPhone=?, customerStatus=? where customerId=?;";

    // Create or insert customer
    public boolean insertCustomer(Customer customer) {
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(INSERT_CUSTOMER_SQL);

            ps.setString(1, customer.getCustomerFullName());
            ps.setString(2, customer.getCustomerUserName());
            ps.setString(3, customer.getCustomerPassword());
            ps.setString(4, customer.getCustomerAddress());
            ps.setLong(5, customer.getCustomerPhone());
            ps.setInt(6, customer.getCustomerStatus());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return true;
    }

    // update customer
    public boolean updateCustomer(Customer customer) {
        boolean rowUpdated = false;
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(UPDATE_CUSTOMER_SQL);

            ps.setString(1, customer.getCustomerFullName());
            ps.setString(2, customer.getCustomerUserName());
            ps.setString(3, customer.getCustomerPassword());
            ps.setString(4, customer.getCustomerAddress());
            ps.setLong(5, customer.getCustomerPhone());
            ps.setInt(6, customer.getCustomerStatus());

            ps.setInt(7, customer.getCustomerId());

            rowUpdated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return rowUpdated;
    }

    // select customer by id
    public Customer selectCustomer(int id) {
        Customer customer = null;
        // Step 1: Establishing a connection
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);

            ps.setInt(1, id);
            // Step 3: Execute the query or update query
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object
            while (rs.next()) {
                int customerId = rs.getInt("customerId");
                String customerFullName = rs.getString("customerFullName");
                String customerUserName = rs.getString("customerUserName");
                String customerPassword = rs.getString("customerPassword");
                String customerAddress = rs.getString("customerAddress");
                Long customerPhone = rs.getLong("customerPhone");
                int customerStatus = rs.getInt("customerStatus");
               
                customer = new Customer(customerId, customerFullName, customerUserName, customerPassword,
                        customerAddress, customerPhone, customerStatus);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e1) {
            System.out.println(e1.getMessage());
        }
        return customer;
    }

    // select customer
    public ArrayList<Customer> selectAllCustomers() {
        ArrayList<Customer> customers = new ArrayList<>();
        // Step 1: Establishing a connection
        try // Step 2: Create a statement using connection object)
        {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
//			System.out.println(ps);
            // Step 3: Execute the query or update query
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object
            while (rs.next()) {
                int customerId = rs.getInt("customerId");
                String customerFullName = rs.getString("customerFullName");
                String customerUserName = rs.getString("customerUserName");
                String customerPassword = rs.getString("customerPassword");
                String customerAddress = rs.getString("customerAddress");
                Long customerPhone = rs.getLong("customerPhone");
                int customerStatus = rs.getInt("customerStatus");

                customers.add(new Customer(customerId, customerFullName, customerUserName, customerPassword,
                        customerAddress, customerPhone, customerStatus));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return customers;
    }

    // delete customer
    public boolean deleteCustomer(int id) {
        boolean rowDeleted = false;
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(DELETE_CUSTOMER_SQL);
            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return rowDeleted;
    }

    public boolean editStatusCustomer(int id, int status) {
        boolean result = true;
        String command = "update customer set customerStatus=? where customerId=?;";
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(command);

            ps.setInt(1, status);
            ps.setInt(2, id);
            result = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return result;

    }

}
