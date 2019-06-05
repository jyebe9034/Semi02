package kh.semi.dto;

import java.sql.Timestamp;

public class MyDonateDTO {

	private int boardNo;
	private String boardTitle;
	private int paymentAmount;
	private String paymentDate;
	private String boardWriter;

	public MyDonateDTO() {
		super();
	}
	public MyDonateDTO(int boardNo, String boardTitle, int paymentAmount, String paymentDate, String boardWriter) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.paymentAmount = paymentAmount;
		this.paymentDate = paymentDate;
		this.boardWriter = boardWriter;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	

	
	
	
	
}
