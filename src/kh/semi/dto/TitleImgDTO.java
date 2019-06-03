package kh.semi.dto;

public class TitleImgDTO {
	private int boardNo; // 게시글 번호
	private String fileName;
	private String oriFileName;
	private String filePath;
	private long fileSize;

	public TitleImgDTO() {
		super();
	}
	// 메인 페이지 마감임박 3개 사진 파일 이름과 위치경로 가져오기 위함.
	public TitleImgDTO(int boardNo, String fileName, String filePath) {
		super();
		this.boardNo = boardNo;
		this.fileName = fileName;
		this.filePath = filePath;
	}
	public TitleImgDTO(int boardNo, String fileName, String oriFileName, String filePath, long fileSize) {
		super();
		this.boardNo = boardNo;
		this.fileName = fileName;
		this.oriFileName = oriFileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

}
