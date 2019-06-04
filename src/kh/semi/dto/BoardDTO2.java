package kh.semi.dto;

import java.sql.Timestamp;

//새로 만듬!!!!
public class BoardDTO2 {
	private int boardNo; 
	private String email;
	private String title;
	private String writer;
	private int amount;
	private String bank;
	private String account;
	private String contents;
	private Timestamp dueDate;
	private int viewCount;
	private Timestamp writeDate;	
	private int recommend;
	private int sumAmount;	
	private boolean donationResult;
	
	public BoardDTO2(String title, String account) {
		super();
		this.title = title;
		this.account = account;
	}

	public BoardDTO2(String title, String writer, Timestamp dueDate, Timestamp writeDate, int amount, int sumAmount,
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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getDueDate() {
		return dueDate;
	}

	public void setDueDate(Timestamp dueDate) {
		this.dueDate = dueDate;
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
	
	
}
