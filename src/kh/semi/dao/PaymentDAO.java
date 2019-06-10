package kh.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.semi.dto.PaymentDTO;

public class PaymentDAO {
	private Connection getConnection() throws Exception{
		Context root = new InitialContext();
		Context ctx = (Context)root.lookup("java:/comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc");
		return ds.getConnection();   
	}

	public PreparedStatement pstatForGetSumAmount(Connection con, int b_no)throws Exception {
		String sql = "select b_sum_amount from board where b_no=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, b_no);
		return pstat;
	}
	public int getSumAmount(int b_no)throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForGetSumAmount(con, b_no);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				int sumAmount = rs.getInt(1);
				return sumAmount;
			}
			return -1;
		}
	}

	public PreparedStatement pstatForGetGoalAmount(Connection con, int b_no)throws Exception {
		String sql = "select b_amount from board where b_no=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, b_no);
		return pstat;
	}
	public int getGoalAmount(int b_no)throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForGetGoalAmount(con, b_no);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				int goalAmount = rs.getInt(1);
				return goalAmount;
			}
			return -1;
		}
	}

	public PreparedStatement pstatForGetDueDate(Connection con, int b_no)throws Exception {
		String sql = "select b_due_date from board where b_no=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, b_no);
		return pstat;
	}
	public Timestamp getDueDate(int b_no) throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForGetDueDate(con, b_no);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				Timestamp dueDate = rs.getTimestamp(1);
				return dueDate;
			}
			return null;
		}
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

	public PreparedStatement pstatForGetTotalAmount(Connection con)throws Exception {
		String sql = "select sum(p_amount) from payment";
		PreparedStatement pstat = con.prepareStatement(sql);
		return pstat;
	}

	public int getTotalAmount() throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForGetTotalAmount(con);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				int totalAmount = rs.getInt(1);
				return totalAmount;
			}
			return -1;

		}

	}
	public PreparedStatement pstatForGetNumberOfDonors(Connection con)throws Exception{
		String sql = "select count(p_b_no) from payment";
		PreparedStatement pstat = con.prepareStatement(sql);
		return pstat;
	}

	public int getNumberOfDonors() throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForGetNumberOfDonors(con);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				int countDonors = rs.getInt(1);
				return countDonors;
			}
			return -1;
		}

	}

}
