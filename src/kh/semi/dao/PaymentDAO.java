package kh.semi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import kh.semi.dto.MemberDTO;
import kh.semi.dto.PaymentDTO;

public class PaymentDAO {
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String pw = "semi";
		return DriverManager.getConnection(url, user, pw);
	}
	
	public int insertPayment(PaymentDTO dto) throws Exception {
		String sql = "insert into payment values (?, ?, ?, ?, ?, default)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getBoardNo());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getEmail());
			pstat.setString(4, dto.getPhone());
			pstat.setInt(5, dto.getAmount());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
}
