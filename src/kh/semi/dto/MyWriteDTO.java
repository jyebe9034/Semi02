package kh.semi.dto;

import java.sql.Timestamp;

public class MyWriteDTO {

	private int b_no;
	private String b_title;
	private int b_sum_amount;
	private String b_writedate;
	private int b_viewcount;

	public MyWriteDTO() {
		super();
	}
	public MyWriteDTO(int b_no, String b_title, int b_sum_amount, String b_writedate, int b_viewcount) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_sum_amount = b_sum_amount;
		this.b_writedate = b_writedate;
		this.b_viewcount = b_viewcount;
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
	public int getB_sum_amount() {
		return b_sum_amount;
	}
	public void setB_sum_amount(int b_sum_amount) {
		this.b_sum_amount = b_sum_amount;
	}
	public String getB_writedate() {
		return b_writedate;
	}
	public void setB_writedate(String b_writedate) {
		this.b_writedate = b_writedate;
	}
	public int getB_viewcount() {
		return b_viewcount;
	}
	public void setB_viewcount(int b_viewcount) {
		this.b_viewcount = b_viewcount;
	}
	
	
	
}
