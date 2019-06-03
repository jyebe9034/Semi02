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


	public PreparedStatement pstatForGetTitleImgMain(Connection con, int bNo1, int bNo2, int bNo3) throws Exception {
		String sql = "select * from title_img where t_b_no in (?,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, bNo1);
		pstat.setInt(2, bNo2);
		pstat.setInt(3, bNo3);
		return pstat;
	}
	public List<TitleImgDTO> getTitleImgMain(int bNo1, int bNo2, int bNo3) throws Exception {
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForGetTitleImgMain(con, bNo1, bNo2, bNo3);
				ResultSet rs = pstat.executeQuery();
				){
			List<TitleImgDTO> list = new ArrayList<>();
			for(int i=0; i<3;i++) {
				if(rs.next()) {
					TitleImgDTO dto = new TitleImgDTO(rs.getInt("t_b_no"),rs.getString("t_fileName"), rs.getString("t_filePath"));
					list.add(dto);
				}
			}
			return list;
		}
	}
}


