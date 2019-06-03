package kh.semi.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CommentDTO {
	private String email;
	private String name;
	private int boardNo;
	private String comment;
	private Timestamp writeDate;

	// 댓글 보여줄 때만 필요해서 DB에는 없음!
	private String formedTime;
	
	public CommentDTO() {
		super();
	}
	public CommentDTO(String email, String name, int boardNo, String comment, Timestamp writeDate) {
		super();
		this.email = email;
		this.name = name;
		this.boardNo = boardNo;
		this.comment = comment;
		this.writeDate = writeDate;
	}
	public CommentDTO(String email, String name, int boardNo, String comment, Timestamp writeDate, String formedTime) {
		super();
		this.email = email;
		this.name = name;
		this.boardNo = boardNo;
		this.comment = comment;
		this.writeDate = writeDate;
		this.formedTime = formedTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	public String getFormedTime() {
		long currentTime = System.currentTimeMillis();
		long writeTime = this.writeDate.getTime();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
		
		if(currentTime - writeTime < (1000 * 60 * 60)) {
			long time = currentTime - writeTime;
			if(time/1000/60 < 10) {
				return "방금 전";
			}
			return time / 1000 / 60 + " 분 전";
		}
		else if(currentTime - writeTime < (1000 * 60 * 60 * 24)) {
			long time = currentTime - writeTime;
			if(time / 1000 / 60 / 60 < 3) {
				return time / 1000 / 60 / 60 + " 시간 전";
			}
			else {
				return sdf.format(writeTime);
			}
		}
		else {
			return (String)sdf.format(writeTime);
		}
	}
}
