package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

import context.DBcontext;
import entity.Product;

public class ProductDAO {

    private String INSERT_PRODUCT_SQL = "INSERT INTO product"
            + "(productName, productBrand, productDescription, productPrice, productQuantity, productStatus) VALUES"
            + "(?,?,?,?,?,?);";
    private String SELECT_PRODUCT_BY_ID = "select * from product where productId=?;";
    private String SELECT_ALL_PRODUCTS = "select * from product;";
    private String DELETE_PRODUCT_SQL = "delete from product where productId=?;";
    private String UPDATE_PRODUCT_SQL = "update product set productName=?, productBrand=?, productDescription=?,productPrice=?, productQuantity=?, productStatus=? where productId=?;";

    // Create or insert product
    public int insertProduct(Product product) {
        int idValue = 0;
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(INSERT_PRODUCT_SQL, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getproductBrand());
            ps.setString(3, product.getProductDescription());
            ps.setFloat(4, product.getProductPrice());
            ps.setLong(5, product.getProductQuantity());
            ps.setInt(6, product.getProductStatus());

            ps.execute();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {
                // Giá trị của ID (Vị trí 1 theo thiết kế của bảng)
                idValue = rs.getInt(1);
            }

            System.out.println("ID value: -----------------------------------------" + idValue);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return idValue;
    }

    // update product
    public boolean updateProduct(Product product) {
        boolean rowUpdated = false;
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(UPDATE_PRODUCT_SQL);

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getproductBrand());
            ps.setString(3, product.getProductDescription());
            ps.setFloat(4, product.getProductPrice());
            ps.setInt(5, product.getProductQuantity());
            ps.setInt(6, product.getProductStatus());

            ps.setInt(7, product.getProductId());

            rowUpdated = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return rowUpdated;
    }

    // select product by id
    public Product selectProduct(int id) {
        Product product = null;
        // Step 1: Establishing a connection
        try // Step 2: Create a statement using connection object)
        {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            ps.setInt(1, id);
            // Step 3: Execute the query or update query
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object
            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String productBrand = rs.getString("productBrand");
                String productDescription = rs.getString("productDescription");
                float productPrice = rs.getFloat("productPrice");
                int productQuantity = rs.getInt("productQuantity");
                int productStatus = rs.getInt("productStatus");

                product = new Product(productId, productName, productBrand, productDescription, productPrice,
                        productQuantity, productStatus);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e1) {
            System.out.println(e1.getMessage());
        }
        return product;
    }

    // select product
    public ArrayList<Product> selectAllProducts() {
        ArrayList<Product> products = new ArrayList<>();
        // Step 1: Establishing a connection
        try // Step 2: Create a statement using connection object)
        {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_PRODUCTS);
//				System.out.println(ps);
            // Step 3: Execute the query or update query
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object
            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String productBrand = rs.getString("productBrand");
                String productDescription = rs.getString("productDescription");
                float productPrice = rs.getFloat("productPrice");
                int productQuantity = rs.getInt("productQuantity");
                int productStatus = rs.getInt("productStatus");

                products.add(new Product(productId, productName, productBrand, productDescription, productPrice,
                        productQuantity, productStatus));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e1) {
            System.out.println(e1.getMessage());
        }
        return products;
    }

    // delete product
    public boolean deleteProduct(int id) {
        boolean rowDeleted = false;
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(DELETE_PRODUCT_SQL);

            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return rowDeleted;
    }

    public boolean editStatusProduct(int id, int status) {
        boolean result = true;
        String command = "update product set productStatus=? where productId=?;";
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
//
//	public boolean searchNameProductById(int id) {
//		boolean result = true;
//		String command = "select productName from product where productId=?;";
//		try (Connection connection = new DBcontext().getConnection();
//				PreparedStatement ps = connection.prepareStatement(command);) {
//			ps.setInt(1, id);
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
//		return result;
//	}

}
