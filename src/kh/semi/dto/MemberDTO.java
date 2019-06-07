package kh.semi.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private String email;
	private String pw;
	private String name;
	private String phone;
	private String zipCode;
	private String address1;
	private String address2;
	private Timestamp joinDate;
	private String ipAddress;
	private String admin;
	
	
	public MemberDTO() {}
	
	public MemberDTO(String email, String name, String ipAddress) {
		this.email = email;
		this.name = name;
		this.ipAddress = ipAddress;
	}

	public MemberDTO(String email, String pw, String phone, String zipCode,
			String address1, String address2) {
		this.email = email;
		this.pw = pw;
		this.phone = phone;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
	}
	public MemberDTO(String email, String phone, String zipCode,
			String address1, String address2) {
		this.email = email;
		this.phone = phone;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;

	}
	
	public MemberDTO(String email, String name, Timestamp joinDate, String ipAddress, String admin) {
		this.email = email;
		this.name = name;
		this.joinDate = joinDate;
		this.ipAddress = ipAddress;
		this.admin = admin;
	}
	
	

	public MemberDTO(String email, String name, String phone, Timestamp joinDate, String ipAddress) {
		super();
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.joinDate = joinDate;
		this.ipAddress = ipAddress;
	}

	public MemberDTO(String email, String pw, String name, String phone, String zipCode,
			String address1, String address2, Timestamp joinDate, String ipAddress, String admin) {
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.joinDate = joinDate;
		this.ipAddress = ipAddress;
		this.admin = admin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
}
