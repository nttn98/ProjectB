package entity;

import java.io.Serializable;

public class Customer implements Serializable {

    private static final long serialVersionUID = 1L;
    private int customerId;
    private String customerFullName;
    private String customerUserName;
    private String customerPassword;
    private String customerAddress;
    private long customerPhone;
    private int customerStatus;

    public Customer(int customerId, String customerFullName, String customerUserName, String customerPassword,
            String customerAddress, long customerPhone, int customerStatus) {
        super();
        this.customerId = customerId;
        this.customerFullName = customerFullName;
        this.customerUserName = customerUserName;
        this.customerPassword = customerPassword;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
        this.customerStatus = customerStatus;
    }

    public Customer(String customerFullName, String customerUserName, String customerPassword, String customerAddress,
            long customerPhone, int customerStatus) {
        super();
        this.customerId = 0;
        this.customerFullName = customerFullName;
        this.customerUserName = customerUserName;
        this.customerPassword = customerPassword;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
        this.customerStatus = customerStatus;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerFullName() {
        return customerFullName;
    }

    public void setCustomerFullName(String customerFullName) {
        this.customerFullName = customerFullName;
    }

    public String getCustomerUserName() {
        return customerUserName;
    }

    public void setCustomerUserName(String customerUserName) {
        this.customerUserName = customerUserName;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public long getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(long customerPhone) {
        this.customerPhone = customerPhone;
    }

    public int getCustomerStatus() {
        return customerStatus;
    }

    public void setCustomerStatus(int customerStatus) {
        this.customerStatus = customerStatus;
    }

}
