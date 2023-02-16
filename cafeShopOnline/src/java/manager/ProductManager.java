package manager;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.ProductDAO;
import entity.Customer;
import entity.Product;

public class ProductManager {

	private ArrayList<Product> listProducts;
	private ProductDAO myProductDAO;

	public ProductManager() {
		myProductDAO = new ProductDAO();
		updateProductData();
	}

	// feed data from DB to ArrayList in Manager
	public void updateProductData() {
		this.listProducts = myProductDAO.selectAllProducts();
	}

	public Product getProductByID(int id) {
		Product tempProduct = null;
		for (int i = 0; i < listProducts.size(); i++) {
			tempProduct = listProducts.get(i);
			if (tempProduct.getProductId() == id) {
				return tempProduct;
			}
		}
		return null;

	}

	public int addProduct(Product product) {
		int idValue = 0;
//		String id = product.getProductID();
//		Product foundProduct = this.getProductByID(id);
//		if (foundProduct == null) {
//
//		}
		if (this.getProductByID(product.getProductId()) == null) {
			idValue = myProductDAO.insertProduct(product);
			this.updateProductData();
		}
		return idValue;
	}

	public boolean disableProductByID(int id) {
		boolean result = true;

		Product foundProduct = this.getProductByID(id);
		foundProduct.setProductStatus(0);
		this.updateProduct(foundProduct);
		this.updateProductData();
		return result;
	}

	public boolean enableProductByID(int id) {
		boolean result = true;

		Product foundProduct = this.getProductByID(id);
		foundProduct.setProductStatus(1);
		this.updateProduct(foundProduct);
		this.updateProductData();
		return result;
	}

	// not use
//	public boolean deleteProductByID(int id) throws Exception {
//		boolean result = false;
//
//		Product foundProduct = this.getProductByID(id);
//		if (foundProduct != null) {
//			this.listProducts.remove(foundProduct);
//			this.myProductDAO.deleteProduct(id);
//			result = true;
//		}
//		return result;
//	}

	public ArrayList getListProduct() {
		return (ArrayList) this.myProductDAO.selectAllProducts();
	}

	public ArrayList getProductByName(String name) {
		ArrayList resultProductList = new ArrayList<>();

		Product tempProduct;
		for (int i = 0; i < listProducts.size(); i++) {
			tempProduct = listProducts.get(i);
			if (tempProduct.getProductName().contains(name.toLowerCase())) {
				resultProductList.add(tempProduct);
			}
		}
		return resultProductList;
	}

	public ArrayList getProductByTitle(String title) {
		ArrayList resultProductList = new ArrayList<>();

		Product tempProduct;
		for (int i = 0; i < listProducts.size(); i++) {
			tempProduct = listProducts.get(i);
			if (tempProduct.getproductBrand().contains(title.toLowerCase())) {
				resultProductList.add(tempProduct);
			}
		}
		return resultProductList;
	}

	public ArrayList getProductByQuantity(int quantity) {
		ArrayList resultProductList = new ArrayList<>();

		Product tempProduct;
		for (int i = 0; i < listProducts.size(); i++) {
			tempProduct = listProducts.get(i);
			if (tempProduct.getProductQuantity() == quantity) {
				resultProductList.add(tempProduct);
			}
		}
		return resultProductList;
	}

	public boolean updateProduct(Product editedProduct) {
		boolean result = false;
		Product oldProduct;
		oldProduct = this.getProductByID(editedProduct.getProductId());
		if (oldProduct != null) {
			int i = this.listProducts.indexOf(oldProduct);
			this.listProducts.remove(i);
			this.listProducts.add(i, editedProduct);
			result = this.myProductDAO.updateProduct(editedProduct);
		}
		updateProductData();
		return result;
	}

//	public int saveByteData() {
//		this.myProductDAO.saveListProductAsByte(this.listProducts);
//		return this.listProducts.size();
//	}
//
//	public int saveCharData() {
//		this.myProductDAO.saveListProductAsChar(this.listProducts);
//		return this.listProducts.size();
//	}
//
//	public int getByteData() {
//		this.listProducts = this.myProductDAO.readListProductAsByte();
//		if (this.listProducts == null) {
//			this.listProducts =new ArrayList<Product>();
//		}
//		return this.listProducts.size();
//	}
}
