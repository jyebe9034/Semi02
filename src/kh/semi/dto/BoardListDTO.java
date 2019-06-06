package kh.semi.dto;

public class BoardListDTO {
	/*board*/
	private int boardNo; // 숫자 주키 (DB가 만들어 줘)
	private String email;
	private String title;
	private String writer;
	private int amount;
	private String bank;
	private String account;
	private String contents;
	private String dueDate;
	private int viewCount;
	private String writeDate;	
	private int recommend;
	private int sumAmount;
	private int percentage;
	/*title_img*/
	private String fileName;
	private String filePath;
	private String newFilePath;
	//총 18개
	
	public BoardListDTO() {
		super();
	}
	public BoardListDTO(int boardNo, String email, String title, String writer, int amount, String bank, String account,
			String contents, String dueDate, int viewCount, String writeDate, int recommend, int sumAmount,
			String fileName, String filePath) {
		super();
		this.boardNo = boardNo;
		this.email = email;
		this.title = title;
		this.writer = writer;
		this.amount = amount;
		this.bank = bank;
		this.account = account;
		this.contents = contents;
		this.dueDate = dueDate;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.recommend = recommend;
		this.sumAmount = sumAmount;
		this.fileName = fileName;
		this.filePath = filePath;
	}
	public BoardListDTO(int boardNo, String email, String title, String writer, int amount, String bank, String account,
			String contents, String dueDate, int viewCount, String writeDate, int recommend, int sumAmount,
			String fileName, String filePath, String newFilePath) {
		super();
		this.boardNo = boardNo;
		this.email = email;
		this.title = title;
		this.writer = writer;
		this.amount = amount;
		this.bank = bank;
		this.account = account;
		this.contents = contents;
		this.dueDate = dueDate;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.recommend = recommend;
		this.sumAmount = sumAmount;
		this.fileName = fileName;
		this.filePath = filePath;
		this.newFilePath = newFilePath;
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
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getNewFilePath() {
		return newFilePath;
	}
	public void setNewFilePath(String newFilePath) {
		this.newFilePath = newFilePath;
	}
	public int getPercentage() {
		return percentage;
	}
	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}	
}
