package entity;

import java.util.ArrayList;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Nhân
 */
public class Cart {

    private ArrayList<CartItem> listItem;

    public Cart() {
        this.listItem = new ArrayList<>();
    }

    public boolean addProduct(Product product) {
        boolean result = false;

        CartItem temp = checkProductExist(product.getProductId());

        if (temp == null) {
            CartItem newItem = new CartItem(product, 1);
            this.listItem.add(newItem);
        } else {
            temp.changeQuantity(1);
        }

        return result;
    }

    public CartItem checkProductExist(int productID) {
        CartItem foundCartItem = null;

        for (int i = 0; i < listItem.size(); i++) {
            if (listItem.get(i).getProduct().getProductId() == productID) {
                return listItem.get(i);
            }
        }

        return foundCartItem;

    }

    public void removeItem(int productID) {
        for (int i = 0; i < listItem.size(); i++) {
            if (listItem.get(i).getProduct().getProductId() == productID) {
                this.listItem.remove(i);
            }
        }
    }

    public float getTotal() {
        float total = 0;
        for (int i = 0; i < listItem.size(); i++) {
            total = total + listItem.get(i).getSubtotal();
        }
        return total;
    }

    public ArrayList<CartItem> getListItem() {
        return listItem;
    }

    public void setListItem(ArrayList<CartItem> listItem) {
        this.listItem = listItem;
    }

    public void updateQuan(int productID, int quant) {
        CartItem temp = checkProductExist(productID);
        temp.setQuantity(quant);

    }

}
