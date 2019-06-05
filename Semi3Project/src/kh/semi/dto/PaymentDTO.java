package kh.semi.dto;

import java.sql.Timestamp;

public class PaymentDTO {
	private int boardNo;
	private String name;
	private String email;
	private String phone;
	private int amount;
	private Timestamp paymentDate;
	private int sumAmount;
	
	public PaymentDTO() {}
	
	public PaymentDTO(String name, int sumAmount) {
		super();
		this.name = name;
		this.sumAmount = sumAmount;
	}
	public PaymentDTO(int boardNo, String name, String email, String phone, int amount, Timestamp paymentDate) {
		super();
		this.boardNo = boardNo;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.amount = amount;
		this.paymentDate = paymentDate;
	}
	
	public PaymentDTO(int boardNo, String name, String email, String phone, int amount, Timestamp paymentDate,
			int sumAmount) {
		super();
		this.boardNo = boardNo;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.amount = amount;
		this.paymentDate = paymentDate;
		this.sumAmount = sumAmount;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Timestamp getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Timestamp paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getSumAmount() {
		return sumAmount;
	}

	public void setSumAmount(int sumAmount) {
		this.sumAmount = sumAmount;
	}
	
}
