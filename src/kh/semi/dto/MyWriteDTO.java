package kh.semi.dto;

import java.sql.Timestamp;

public class MyWriteDTO {

	private int boardNo;
	private String title;
	private int sumAmount;
	private String writeDate;
	private int viewCount;
	
	public MyWriteDTO() {
		super();
	}
	public MyWriteDTO(int boardNo, String title, int sumAmount, String writeDate, int viewCount) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.sumAmount = sumAmount;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSumAmount() {
		return sumAmount;
	}
	public void setSumAmount(int sumAmount) {
		this.sumAmount = sumAmount;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
}
