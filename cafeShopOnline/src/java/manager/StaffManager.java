package manager;

import java.util.ArrayList;

import dao.StaffDAO;
import entity.Staff;

public class StaffManager {
	private ArrayList<Staff> listStaffs;
	private StaffDAO myStaffDAO;

	public StaffManager() {
		myStaffDAO = new StaffDAO();
		updateStaffData();
	}

	// feed data from DB to ArrayList in Manager
	public void updateStaffData() {
		this.listStaffs = myStaffDAO.selectAllStaffs();

	}

	public Staff getStaffByID(int id) {
		Staff tempStaff = null;
		for (int i = 0; i < listStaffs.size(); i++) {
			tempStaff = listStaffs.get(i);
			if (tempStaff.getStaffId() == id) {
				return tempStaff;
			}
		}
		return null;
	}

	public boolean addStaff(Staff staff) {
		boolean result = false;
		if (this.getStaffByID(staff.getStaffId()) == null) {
			myStaffDAO.insertStaff(staff);
			this.updateStaffData();
			result = true;
		}
		return result;
	}

	public boolean disableStaffByID(int id) {
		boolean result = true;

		Staff foundStaff = this.getStaffByID(id);
		foundStaff.setStaffStatus(0);
		this.updateStaff(foundStaff);
		this.updateStaffData();
		return result;
	}

	public boolean enableCustomerByID(int id) {
		boolean result = true;

		Staff foundStaff = this.getStaffByID(id);
		foundStaff.setStaffStatus(1);
		this.updateStaff(foundStaff);
		this.updateStaffData();

		return result;
	}

//	public boolean deleteStaffByID(int id) {
//		boolean result = false;
//
//		Staff foundStaff = this.getStaffByID(id);
//		if (foundStaff != null) {
//			this.listStaffs.remove(foundStaff);
//			this.myStaffDAO.deleteStaff(id);
//			result = true;
//		}
//		return result;
//	}

	public ArrayList getListStaffs() {
		return this.listStaffs;
	}

	public ArrayList getStaffByName(String name) {
		ArrayList resultStaffList = new ArrayList<>();

		Staff tempStaff;
		for (int i = 0; i < listStaffs.size(); i++) {
			tempStaff = listStaffs.get(i);
			if (tempStaff.getStaffFullName().contains(name.toLowerCase())) {
				resultStaffList.add(tempStaff);
			}
		}
		return resultStaffList;
	}

	public ArrayList getStaffByPhone(long phone) {
		ArrayList resultStaffList = new ArrayList<>();

		Staff tempStaff;
		for (int i = 0; i < listStaffs.size(); i++) {
			tempStaff = listStaffs.get(i);
			if (tempStaff.getStaffPhone() == phone) {
				resultStaffList.add(tempStaff);
			}
		}
		return resultStaffList;
	}

	public ArrayList getStaffByAddress(String address) {
		ArrayList resultStaffList = new ArrayList<>();

		Staff tempStaff;
		for (int i = 0; i < listStaffs.size(); i++) {
			tempStaff = listStaffs.get(i);
			if (tempStaff.getStaffAddress().contains(address.toLowerCase())) {
				resultStaffList.add(tempStaff);
			}
		}
		return resultStaffList;
	}

	public ArrayList getStaffByUserName(String userName) {
		ArrayList resultStaffList = new ArrayList<>();

		Staff tempStaff;
		for (int i = 0; i < listStaffs.size(); i++) {
			tempStaff = listStaffs.get(i);
			if (tempStaff.getStaffAddress().contains(userName.toLowerCase())) {
				resultStaffList.add(tempStaff);
			}
		}
		return resultStaffList;
	}

	public boolean updateStaff(Staff editedStaff) {
		boolean result = false;
		Staff oldStaff;
		oldStaff = this.getStaffByID(editedStaff.getStaffId());
		if (oldStaff != null) {
			int i = this.listStaffs.indexOf(oldStaff);
			this.listStaffs.remove(i);
			this.listStaffs.add(i, editedStaff);
			result = this.myStaffDAO.updateStaff(editedStaff);
		}
		updateStaffData();
		return result;
	}

//	public int saveByteData() {
//		this.myStaffDAO.saveListStaffAsByte(listStaffs);
//		return this.listStaffs.size();
//	}
//
//	public int saveCharData() {
//		this.myStaffDAO.saveListStaffAsByte(listStaffs);
//		return this.listStaffs.size();
//	}
//
//	public int getByteData() {
//		this.listStaffs= this.myStaffDAO.readListStaffAsByte();
//		if (this.listStaffs == null) {
//			this.listStaffs = new ArrayList<Staff>();
//		}
//		return this.listStaffs.size();
//	}

}
