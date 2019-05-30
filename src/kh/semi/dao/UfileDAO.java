package kh.semi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.semi.dto.UfileDTO;

public class UfileDAO {
//	private Connection getConnection() throws Exception {
//		Context root = new InitialContext();
//		Context ctx = (Context)root.lookup("java:/comp/env");
//		DataSource ds = (DataSource)ctx.lookup("jdbc");
//		return ds.getConnection();		
//	}

	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kh";
		String pw = "kh";
		return DriverManager.getConnection(url,user,pw);
	}
	
	public int insert(UfileDTO dto) throws Exception{
		String sql = "insert into ufile values(seq_ufile.nextval,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getFileName());
			pstat.setString(2, dto.getOriFileName());
			pstat.setString(3, dto.getFilePath());
			pstat.setLong(4, dto.getFileSize());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}

	}
	//	private PreparedStatement pstatForShow(Connection con)throws Exception{
	//		
	//		pstat
	//	}


	public List<UfileDTO> show() throws Exception{
		String sql = "select * from ufile";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<UfileDTO> list = new ArrayList<>();
			while(rs.next()) {
				UfileDTO dto = new UfileDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setFileName(rs.getString("fileName"));
				dto.setOriFileName(rs.getString("oriFileName"));
				dto.setFilePath(rs.getString("filePath"));
				dto.setFileSize(rs.getLong("fileSize"));
				list.add(dto);
			}
			return list;
		}

	}

	public UfileDTO selectBySeq(int seq) throws Exception{
		String sql = "select * from ufile where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery()){

				if(rs.next()) {
					UfileDTO dto = new UfileDTO();
					dto.setSeq(rs.getInt("seq"));
					dto.setFileName(rs.getString("fileName"));
					dto.setOriFileName(rs.getString("oriFileName"));
					dto.setFilePath(rs.getString("filePath"));
					dto.setFileSize(rs.getLong("fileSize"));
					return dto;
				}
				return null;
			}
		}
	}
}
