package kh.semi.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.semi.dto.BoardDTO;
import kh.semi.dto.MemberDTO;
import kh.semi.dto.PaymentDTO;
import kh.semi.dto.TimePersonCountDTO;
import kh.semi.servlet.MembersController;


public class ManagerDAO {
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String pw = "semi";
		return DriverManager.getConnection(url,user,pw);
	}
	
	
	
	public int visitPersonCount()throws Exception{
		String sql = "update visitpersoncount set personcount=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, MembersController.visitPerson);
			int result = pstat.executeUpdate();
			return result;
		}
		
	}
	
	public String totalMoney()throws Exception{
		String sql = "select to_char(sum(b_sum_amount),'999,999,999') from board";
		try(	
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			String result = rs.getString(1);
			return result;
		}
	}
	
	public int nowingProjectCount() throws Exception { //현재 진행중인 프로젝트 갯수
		String sql = "select count(*) from board";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			int result = rs.getInt(1);
			return result;
		}
	}
	
	public int joinMemberCount()throws Exception{
		String sql = "select count(*) from members";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			int result = rs.getInt(1);
			return result;
		}
	}

	public List<BoardDTO> recommendTopFour() throws Exception{
		String sql = "SELECT b_title,b_recommend FROM(SELECT b_recommend,b_title FROM board ORDER BY b_recommend DESC)where rownum<=3";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<BoardDTO> li = new ArrayList<>();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO(rs.getString("b_title"),rs.getInt("b_recommend"));
				li.add(dto);
			}
			return li;
		}
	}
	
	public List<Object> bestRecommendCount()throws Exception{
		String sql = "select b_title,max(b_recommend)from board group by b_title";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<Object> li = new ArrayList<>();
			while(rs.next()) {
				li.add(rs.getString(1));
				li.add(rs.getInt(2));
			}
			return li;
		}
	}
	
	public List<Object> worstRecommendCount()throws Exception{
		String sql = "select b_title,min(b_recommend)from board group by b_title";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<Object> li = new ArrayList<>();
			while(rs.next()) {
				li.add(rs.getString(1));
				li.add(rs.getInt(2));
			}
			return li;
		}
	}
	
	public List<Object> bestViewCount()throws Exception{
		String sql = "select b_title,max(b_viewcount)from board group by b_title";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<Object> li = new ArrayList<>();
			while(rs.next()) {
				li.add(rs.getString(1));
				li.add(rs.getInt(2));
			}
			return li;
		}
	}
	
	public List<Object> worstViewCount()throws Exception{
		String sql = "select b_title,min(b_viewcount)from board group by b_title";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<Object> li = new ArrayList<>();
			while(rs.next()) {
				li.add(rs.getString(1));
				li.add(rs.getInt(2));
			}
			return li;
		}
	}
	
	public List<PaymentDTO> donationTopThree()throws Exception{
		String sql = "select num, P_name, sumamount from (select row_number() over (order by sum(p_amount) desc) as num "
				+ ", p_name,sum(p_amount) as sumamount from payment  group by p_name) where num between 1 and 3";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<PaymentDTO> li = new ArrayList<>();
			while(rs.next()) {
				PaymentDTO dto = new PaymentDTO(rs.getString("p_name"),rs.getInt("sumamount"));
				li.add(dto);
			}
			return li;
		}
	}
	
	public List<MemberDTO> memberInfo()throws Exception{
		String sql = "select m_email,m_name,m_phone,m_joindate,m_ipaddress from members";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<MemberDTO> li = new ArrayList<>();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getTimestamp(4),rs.getString(5));
				li.add(dto);
			}
			return li;
		}
	}

	public int timePerson(int timePerson, int realtime)throws Exception{
		String sql = "update timepersoncount set time"+realtime+"=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, timePerson);
			int result = pstat.executeUpdate();
			con.commit();
			return result;	
		}
	}
	
	public List<TimePersonCountDTO> timePersonCount()throws Exception{
		String sql = "select * from timepersoncount";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<TimePersonCountDTO> li = new ArrayList<>();
			rs.next();
			TimePersonCountDTO dto = new TimePersonCountDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6)
					,rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11),rs.getInt(12),rs.getInt(13),rs.getInt(14),rs.getInt(15)
					,rs.getInt(16),rs.getInt(17),rs.getInt(18),rs.getInt(19),rs.getInt(20),rs.getInt(21),rs.getInt(22)
					,rs.getInt(23),rs.getInt(24));
			li.add(dto);
			return li;
		}
	}//line차트 전부 가져오기	
	
	public int allTimeUpdate()throws Exception{ //00시 되면 모든 시간 0으로 만들기!
		String sql = "update timepersoncount set time1=0,time2=0,time3=0,time4=0,time5=0,time6=0,time7=0,time8=0,time9=0,time10=0,\r\n" + 
				"time11=0,time12=0,time13=0,time14=0,time15=0,time16=0,time17=0,time18=0,time19=0,time20=0,\r\n" + 
				"time21=0,time22=0,time23=0,time24=0";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat =con.prepareStatement(sql);
				){
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<BoardDTO> totalDonationProject()throws Exception{//모든 기부프로젝트 테이블
		String sql = "select b_title,b_writer,b_due_date,b_writedate,b_sum_amount,b_amount from board";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<BoardDTO> li = new ArrayList<>();
			while(rs.next()) {
				if(rs.getInt("b_sum_amount")==rs.getInt("b_amount")) {
					BoardDTO dto = new BoardDTO(rs.getString(1),rs.getString(2),rs.getTimestamp(3),rs.getTimestamp(4),rs.getInt(5),rs.getInt(6),true);
					li.add(dto);
				}else {
					BoardDTO dto = new BoardDTO(rs.getString(1),rs.getString(2),rs.getTimestamp(3),rs.getTimestamp(4),rs.getInt(5),rs.getInt(6),false);
					li.add(dto);
				}
			}
			return li;		
		}
	}
	
	public int BoardWriteDelete(String value)throws Exception{
		String sql = "delete from board where b_no=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, value);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	
	
}
