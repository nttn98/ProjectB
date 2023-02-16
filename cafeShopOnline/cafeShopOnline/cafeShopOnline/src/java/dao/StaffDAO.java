package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import context.DBcontext;
import entity.Staff;

public class StaffDAO {

    private String INSERT_STAFF_SQL = "INSERT INTO staff"
            + "(staffFullName,staffUserName,staffPassword,staffAddress,staffPhone,staffStatus) VALUES"
            + "(?,?,?,?,?,?);";
    private String SELECT_STAFF_BY_ID = "select * from staff where staffId=?;";
    private String SELECT_ALL_STAFFS = "select * from staff;";
    private String DELETE_STAFF_SQL = "delete from staff where staffId=?;";
    private String UPDATE_STAFF_SQL = "update staff set staffFullName=?, staffUserName=?, staffPassword=?,staffAddress=?, staffPhone=?,staffStatus=? where staffId=?;";

    // Create or insert staff
    public boolean insertStaff(Staff staff) {
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(INSERT_STAFF_SQL);
            ps.setString(1, staff.getStaffFullName());
            ps.setString(2, staff.getStaffUserName());
            ps.setString(3, staff.getStaffPassword());
            ps.setString(4, staff.getStaffAddress());
            ps.setLong(5, staff.getStaffPhone());
            ps.setInt(6, staff.getStaffStatus());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return true;
    }

    // update staff
    public boolean updateStaff(Staff staff) {
        boolean rowUpdated = false;
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(UPDATE_STAFF_SQL);

            ps.setString(1, staff.getStaffFullName());
            ps.setString(2, staff.getStaffUserName());
            ps.setString(3, staff.getStaffPassword());
            ps.setString(4, staff.getStaffAddress());
            ps.setLong(5, staff.getStaffPhone());
            ps.setInt(6, staff.getStaffStatus());

            ps.setInt(7, staff.getStaffId());

            rowUpdated = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e1) {
            System.out.println(e1.getMessage());
        }
        return rowUpdated;
    }

    // select staff by id
    public Staff selectStaff(int id) {
        Staff staff = null;
        // Step 1: Establishing a connection
        try {
            Connection connection = new DBcontext().getConnection(); // Step 2: Create a statement using connection object)
            PreparedStatement ps = connection.prepareStatement(SELECT_STAFF_BY_ID);

            ps.setInt(1, id);

            // Step 3: Execute the query or update query
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object
            while (rs.next()) {
                int staffId = rs.getInt("staffId");
                String staffFullName = rs.getString("staffFullName");
                String staffUserName = rs.getString("staffUserName");
                String staffPassword = rs.getString("staffPassword");
                String staffAddress = rs.getString("staffAddress");
                Long staffPhone = rs.getLong("staffPhone");
                int staffStatus = rs.getInt("staffStatus");

                staff = new Staff(staffId, staffFullName, staffUserName, staffPassword, staffAddress, staffPhone,
                        staffStatus);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e1) {
            System.out.println(e1.getMessage());
        }
        return staff;
    }

    // select staff
    public ArrayList<Staff> selectAllStaffs() {
        ArrayList<Staff> staffs = new ArrayList<>();
        // Step 1: Establishing a connection
        try {
            Connection connection = new DBcontext().getConnection(); // Step 2: Create a statement using connection object)
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_STAFFS);
//				System.out.println(ps);
            // Step 3: Execute the query or update query
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object
            while (rs.next()) {
                int staffId = rs.getInt("staffId");
                String staffFullName = rs.getString("staffFullName");
                String staffUserName = rs.getString("staffUserName");
                String staffPassword = rs.getString("staffPassword");
                String staffAddress = rs.getString("staffAddress");
                Long staffPhone = rs.getLong("staffPhone");
                int staffStatus = rs.getInt("staffStatus");

                staffs.add(new Staff(staffId, staffFullName, staffUserName, staffPassword, staffAddress, staffPhone,
                        staffStatus));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e1) {
            System.out.println(e1.getMessage());
        }
        return staffs;
    }

    // delete staff
    public boolean deleteStaff(int id) {
        boolean rowDeleted = false;
        try {
            Connection connection = new DBcontext().getConnection();
            PreparedStatement ps = connection.prepareStatement(DELETE_STAFF_SQL);

            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e1) {
            System.out.println(e1.getMessage());
        }
        return rowDeleted;
    }

    public boolean editStatusStaff(int id, int status) {
        boolean result = true;
        String command = "update staff set staffStatus=? where staffId=?;";
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
