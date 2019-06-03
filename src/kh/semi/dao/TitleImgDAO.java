package kh.semi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.semi.dto.BoardDTO;
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
	
	/*대표사진 한개만 꺼내기*/
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

	
	
/*대표사진 8개씩 꺼내기*/
	public PreparedStatement psForGetTitleImages(Connection con, int startNum, int endNum) throws Exception{
		String sql = "select * from (select row_number() over(order by b_no desc) as rown, board.* from board) where rown between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, startNum);
		ps.setInt(2, endNum);
		return ps;
	}
	public List<TitleImgDTO> getTitleImages(int startNum, int endNum) throws Exception{

		try(
				Connection con = this.getConnection();
				PreparedStatement ps = this.psForGetTitleImages(con, startNum, endNum);
				ResultSet rs = ps.executeQuery();	
				){
			List<TitleImgDTO> result = new ArrayList<>();
			while(rs.next()) {
			TitleImgDTO dto = new TitleImgDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
			result.add(dto);
		}
			return result;
		}
	}
	
	
}


