package kh.semi.dto;

import java.sql.Timestamp;

public class MyDonateDTO {

	private int b_no;
	private String b_title;
	private int p_amount;
	private String p_payment_date;
	private String writer;
	
	public MyDonateDTO() {
		super();
	}
	public MyDonateDTO(int b_no, String b_title, int p_amount, String p_payment_date, String writer) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.p_amount = p_amount;
		this.p_payment_date = p_payment_date;
		this.writer = writer;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public String getP_payment_date() {
		return p_payment_date;
	}
	public void setP_payment_date(String p_payment_date) {
		this.p_payment_date = p_payment_date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	
	
	
}
