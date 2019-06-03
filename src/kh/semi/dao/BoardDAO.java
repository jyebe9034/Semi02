package kh.semi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import kh.semi.dto.BoardDTO;
import kh.semi.dto.UfileDTO;


public class BoardDAO {
	static int recordCountPerPage = 10;
	static int naviCountPerPage = 10;
	public static int pageTotalCount;

	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String pw = "semi";
		return DriverManager.getConnection(url,user,pw);
	}

	public PreparedStatement pstatForGetDataForMain(Connection con)throws Exception{
		String sql = "select b_due_date-sysdate as d_day, b_no, b_title, b_amount, "
				+ "b_due_date, b_sum_amount from board order by d_day";
		PreparedStatement pstat = con.prepareStatement(sql);
		return pstat;
	}

	public List<BoardDTO> getDataForMain() throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForGetDataForMain(con);
				ResultSet rs = pstat.executeQuery();
				){
			List<BoardDTO> list = new ArrayList<>();
			for(int i=0; i<3;i++) {
				if(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setBoardNo(rs.getInt("b_no"));
					dto.setTitle(rs.getString("b_title"));
					dto.setAmount(rs.getInt("b_amount"));
					dto.setDueDate(rs.getTimestamp("b_due_date"));
					dto.setSumAmount(rs.getInt("b_sum_amount"));
					list.add(dto);
				}
			}
			return list;
		}

	}

}

