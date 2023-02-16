package entity;

import java.io.Serializable;

public class Staff implements Serializable {

    private static final long serialVersionUID = 1L;
    private int staffId;
    private String staffFullName;
    private String staffUserName;
    private String staffPassword;
    private String staffAddress;
    private long staffPhone;
    private int staffStatus;

    public Staff(int staffId, String staffFullName, String staffUserName, String staffPassword, String staffAddress,
            long staffPhone, int staffStatus) {
        super();
        this.staffId = staffId;
        this.staffFullName = staffFullName;
        this.staffUserName = staffUserName;
        this.staffPassword = staffPassword;
        this.staffAddress = staffAddress;
        this.staffPhone = staffPhone;
        this.staffStatus = staffStatus;
    }

    public Staff(String staffFullName, String staffUserName, String staffPassword, String staffAddress, long staffPhone,
            int staffStatus) {
        super();
        this.staffId = 0;
        this.staffFullName = staffFullName;
        this.staffUserName = staffUserName;
        this.staffPassword = staffPassword;
        this.staffAddress = staffAddress;
        this.staffPhone = staffPhone;
        this.staffStatus = staffStatus;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getStaffFullName() {
        return staffFullName;
    }

    public void setStaffFullName(String staffFullName) {
        this.staffFullName = staffFullName;
    }

    public String getStaffUserName() {
        return staffUserName;
    }

    public void setStaffUserName(String staffUserName) {
        this.staffUserName = staffUserName;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }

    public long getStaffPhone() {
        return staffPhone;
    }

    public void setStaffPhone(long staffPhone) {
        this.staffPhone = staffPhone;
    }

    public int getStaffStatus() {
        return staffStatus;
    }

    public void setStaffStatus(int staffStatus) {
        this.staffStatus = staffStatus;
    }

}
