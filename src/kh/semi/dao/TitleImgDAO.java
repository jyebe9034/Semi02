package kh.semi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kh.semi.dto.TitleImgDTO;

public class TitleImgDAO {
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String pw = "semi";
		return DriverManager.getConnection(url, user, pw);
	}
	
	public int insertTitleImg(TitleImgDTO dto) throws Exception {
		String sql = "insert into title_img values(?, t_fileSeq_seq.nextval, ?, ?, ?, ?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getBoardNo());
			pstat.setString(2, dto.getFileName());
			pstat.setString(3, dto.getOriFileName());
			pstat.setString(4, dto.getFilePath());
			pstat.setLong(5, dto.getFileSize());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
//	public PreparedStatement pstatForGetTitleImg(Connection con, int boardNo) throws Exception {
//		String sql = "select * from title_img where t_b_no=?";
//		PreparedStatement pstat = con.prepareStatement(sql);
//		pstat.setInt(1, boardNo);
//		return pstat;
//	}
//	public TitleImgDTO getTitleImg(int boardNo) throws Exception {
//		try(
//				Connection con = this.getConnection();
//				PreparedStatement pstat = this.pstatForGetTitleImg(con, boardNo);
//				ResultSet rs = pstat.executeQuery();
//				){
//			if(rs.next()) {
//				TitleImgDTO dto = new TitleImgDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
//				return dto;
//			}
//		}
//		return null;
//	}
}
