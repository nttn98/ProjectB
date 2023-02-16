package manager;

import java.util.ArrayList;

import dao.CustomerDAO;
import entity.Customer;

public class CustomerManager {

    private ArrayList<Customer> listCustomers;
    private CustomerDAO myCustomerDAO;

    public CustomerManager() {

        myCustomerDAO = new CustomerDAO();
        updateCustomerData();
    }

    // feed data from DB to ArrayList in Manager
    public void updateCustomerData() {
        this.listCustomers = myCustomerDAO.selectAllCustomers();

    }

    public Customer getCustomerByID(int id) {
        Customer tempCustomer = null;
        for (int i = 0; i < listCustomers.size(); i++) {
            tempCustomer = listCustomers.get(i);
            if (tempCustomer.getCustomerId() == id) {
                return tempCustomer;
            }
        }
        return null;
    }

    public boolean addCustomer(Customer customer) {
        boolean result = false;
        if (this.getCustomerByID(customer.getCustomerId()) == null) {
            myCustomerDAO.insertCustomer(customer);
            this.updateCustomerData();
            result = true;
        }
        return result;
    }

    public boolean disableCustomerByID(int id) {
        boolean result = true;

        Customer foundCustomer = this.getCustomerByID(id);
        foundCustomer.setCustomerStatus(0);

        this.updateCustomer(foundCustomer);
        this.updateCustomerData();
        return result;
    }

    public boolean enableCustomerByID(int id) {
        boolean result = true;

        Customer foundCustomer = this.getCustomerByID(id);
        foundCustomer.setCustomerStatus(1);
        this.updateCustomer(foundCustomer);
        this.updateCustomerData();

        return result;
    }

    // not use
//	public boolean deleteCustomerByID(int id) {
//		boolean result = false;
//
//		Customer foundCustomer = this.getCustomerByID(id);
//		if (foundCustomer != null) {
//			this.listCustomers.remove(foundCustomer);
//			this.myCustomerDAO.deleteCustomer(id);
//			result = true;
//		}
//		return result;
//	}
    public ArrayList getListCustomers() {
        return this.listCustomers;
    }

    public ArrayList getCustomerByName(String name) {
        ArrayList resultCustomerList = new ArrayList<>();

        Customer tempCustomer;
        for (int i = 0; i < listCustomers.size(); i++) {
            tempCustomer = listCustomers.get(i);
            if (tempCustomer.getCustomerFullName().contains(name.toLowerCase())) {
                resultCustomerList.add(tempCustomer);
            }
        }
        return resultCustomerList;
    }

    public ArrayList getCustomerByPhone(long phone) {
        ArrayList resultCustomerList = new ArrayList<>();

        Customer tempCustomer;
        for (int i = 0; i < listCustomers.size(); i++) {
            tempCustomer = listCustomers.get(i);
            if (tempCustomer.getCustomerPhone() == phone) {
                resultCustomerList.add(tempCustomer);
            }
        }
        return resultCustomerList;
    }

    public ArrayList getCustomerByAddress(String address) {
        ArrayList resultCustomerList = new ArrayList<>();

        Customer tempCustomer;
        for (int i = 0; i < listCustomers.size(); i++) {
            tempCustomer = listCustomers.get(i);
            if (tempCustomer.getCustomerAddress().contains(address.toLowerCase())) {
                resultCustomerList.add(tempCustomer);
            }
        }
        return resultCustomerList;
    }

    public ArrayList getCustomerByUserName(String userName) {
        ArrayList resultCustomerList = new ArrayList<>();

        Customer tempCustomer;
        for (int i = 0; i < listCustomers.size(); i++) {
            tempCustomer = listCustomers.get(i);
            if (tempCustomer.getCustomerAddress().contains(userName.toLowerCase())) {
                resultCustomerList.add(tempCustomer);
            }
        }
        return resultCustomerList;
    }

    public boolean updateCustomer(Customer editedCustomer) {
        boolean result = false;
        Customer oldCustomer;
        oldCustomer = this.getCustomerByID(editedCustomer.getCustomerId());
        if (oldCustomer != null) {
            int i = this.listCustomers.indexOf(oldCustomer);
            System.out.println(i);
            this.listCustomers.remove(i);
            this.listCustomers.add(i, editedCustomer);
            result = this.myCustomerDAO.updateCustomer(editedCustomer);
        }
        updateCustomerData();
        return result;
    }

//	public int saveByteData() {
//		this.myCustomerDAO.saveListCustomerAsByte(listCustomers);
//		return this.listCustomers.size();
//	}
//
//	public int saveCharData() {
//		this.myCustomerDAO.saveListCustomerAsChar(listCustomers);
//		return this.listCustomers.size();
//	}
//
//	public int getByteData() {
//		this.listCustomers = this.myCustomerDAO.readListCustomerAsByte();
//		if (this.listCustomers == null) {
//			this.listCustomers = new ArrayList<Customer>();
//		}
//		return this.listCustomers.size();
//	}
}
