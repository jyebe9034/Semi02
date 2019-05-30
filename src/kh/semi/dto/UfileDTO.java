package kh.semi.dto;


public class UfileDTO {
	private int seq;
	private String fileName;
	private String oriFileName;
	private String filePath;
	private long fileSize;
	
	public UfileDTO() {}
	public UfileDTO(int seq, String fileName, String oriFileName, String filePath, long fileSize) {
		super();
		this.seq = seq;
		this.fileName = fileName;
		this.oriFileName = oriFileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
