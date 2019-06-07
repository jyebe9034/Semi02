package kh.semi.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDTO {
	private int boardNo; // 숫자 주키 (DB가 만들어 줘)
	private String title;
	private String email;
	private String writer;
	private int amount;
	private String bank;
	private String account;
	private Timestamp dueDate;
	private String contents;
	private int viewCount;
	private Timestamp writeDate;	
	private int recommend;
	private int sumAmount;	
	private boolean donationResult;
	// 총
	
	
	public BoardDTO() {
		super();
	}
	public BoardDTO(String title, int recommend) {
		this.title = title;
		this.recommend = recommend;
	}	
	public BoardDTO(String title, String account) {
		super();
		this.title = title;
		this.account = account;
	}
	public BoardDTO(String title, String writer, Timestamp dueDate, Timestamp writeDate, int amount, int sumAmount,
			boolean donationResult) {
		super();
		this.title = title;
		this.writer = writer;
		this.amount = amount;
		this.dueDate = dueDate;
		this.writeDate = writeDate;
		this.sumAmount = sumAmount;
		this.donationResult = donationResult;
	}
	public BoardDTO(int boardNo, String title, String email, String writer, int amount, String bank, String account,
			Timestamp dueDate, String contents, int viewCount, Timestamp writeDate, int recommend, int sumAmount) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.email = email;
		this.writer = writer;
		this.amount = amount;
		this.bank = bank;
		this.account = account;
		this.dueDate = dueDate;
		this.contents = contents;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.recommend = recommend;
		this.sumAmount = sumAmount;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Timestamp getDueDate() {
		return dueDate;
	}
	public void setDueDate(Timestamp dueDate) {
		this.dueDate = dueDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getSumAmount() {
		return sumAmount;
	}
	public void setSumAmount(int sumAmount) {
		this.sumAmount = sumAmount;
	}
	public boolean isDonationResult() {
		return donationResult;
	}

	public void setDonationResult(boolean donationResult) {
		this.donationResult = donationResult;
	}

	public String getFormedDate() {
		long writeTime = this.writeDate.getTime();
		long dueTime = this.dueDate.getTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(writeTime) + " ~ " + sdf.format(dueTime);
	}


	
}
