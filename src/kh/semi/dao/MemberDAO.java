package kh.semi.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.semi.dto.MemberDTO;

public class MemberDAO {
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String pw = "semi";
		return DriverManager.getConnection(url, user, pw);
	}

	public static String testSHA256(String str){
		String SHA = ""; 
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes()); 
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
	}


	public int insertNaverMember(MemberDTO param) throws Exception{

		String sql = "insert into members (m_email,m_name,m_joindate,m_ipaddress,m_admin) values(?,?,default,?,'n')";

		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, param.getEmail());
			pstat.setString(2, param.getName());
			pstat.setString(3, param.getIpAddress());

			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}

	public boolean isIdExist(MemberDTO param) throws Exception{

		String sql = "select * from members where m_email = ?";

		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, param.getEmail());

			try(ResultSet rs = pstat.executeQuery();){

				return rs.next();
			}
		}

	}

	public MemberDTO NaverContentsParse(String res, String ipaddr) throws Exception{

		JsonParser parser = new JsonParser();
		JsonObject ob = (JsonObject) parser.parse(res.toString());
		String access_t = ob.get("access_token").getAsString();

		String token = access_t;// 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가

		String apiURL1 = "https://openapi.naver.com/v1/nid/me";
		URL url1 = new URL(apiURL1);
		HttpURLConnection con1 = (HttpURLConnection)url1.openConnection();
		con1.setRequestMethod("GET");
		con1.setRequestProperty("Authorization", header);
		int responseCode1 = con1.getResponseCode();
		BufferedReader br1;
		if(responseCode1==200) { // 정상 호출
			br1 = new BufferedReader(new InputStreamReader(con1.getInputStream()));
		} else {  // 에러 발생
			br1 = new BufferedReader(new InputStreamReader(con1.getErrorStream()));
		}
		String inputLine1;
		StringBuffer response1 = new StringBuffer();
		while ((inputLine1 = br1.readLine()) != null) {
			response1.append(inputLine1);
		}
		br1.close();

		String ob2 = response1.toString();
		JsonObject Jsonob2 = parser.parse(ob2).getAsJsonObject();
		JsonObject Json_response = Jsonob2.get("response").getAsJsonObject();

		String id = Json_response.get("id").getAsString();
		String name = Json_response.get("name").getAsString();
		String email = Json_response.get("email").getAsString();

		System.out.println(id +  name + email);

		MemberDTO dto = new MemberDTO();
		dto.setEmail(email);
		dto.setIpAddress(ipaddr);
		dto.setName(name);

		return dto;
	}



	public int insertMember(MemberDTO dto) throws Exception {
		String sql = "insert into members values (?,?,?,?,?,?,?,default,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getEmail());
			pstat.setString(2, testSHA256(dto.getPw()));
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getPhone());
			pstat.setString(5, dto.getZipCode());
			pstat.setString(6, dto.getAddress1());
			pstat.setString(7, dto.getAddress2());
			pstat.setString(8, dto.getIpAddress());
			pstat.setString(9, dto.getAdmin());	
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public List<MemberDTO> selectAll() throws Exception {
		String sql = "select * from members";
		List<MemberDTO> result = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setEmail(rs.getString(1));
				dto.setPw(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPhone(rs.getString(4));
				dto.setZipCode(rs.getString(5));
				dto.setAddress1(rs.getString(6));
				dto.setAddress2(rs.getString(7));
				dto.setJoinDate(rs.getTimestamp(8));
				dto.setIpAddress(rs.getString(9));
				dto.setAdmin(rs.getString(10));
				result.add(dto);
			}
			return result;
		}
	}
	
	public List<String> selectByEmail(String email) throws Exception {
		String sql = "select m_name, m_email, m_phone from members where m_email='"+email+"'";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				List<String> result = new ArrayList<>();
				result.add(rs.getString(1));
				result.add(rs.getString(2));
				result.add(rs.getString(3));
				return result;
			}
			return null;
		}
	}

	public PreparedStatement pstatForIsLoginOk(Connection con, String email, String pw) throws Exception {
		String sql = "select * from members where m_email=? and m_pw=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, email);
		pstat.setString(2, testSHA256(pw));

		return pstat;
	}

	public boolean isLoginOk(String email, String pw) throws Exception {
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForIsLoginOk(con, email, pw);
				ResultSet rs = pstat.executeQuery();
				){
			return rs.next();
		}
	}

	public PreparedStatement pstatForEmailDuplCheck(Connection con, String email) throws Exception {
		String sql = "select * from members where m_email=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, email);
		return pstat;
	}
	public boolean emailDuplCheck(String email) throws Exception {
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForEmailDuplCheck(con, email);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				return false;
			}
			else {
				return true;
			}
		}
	}
	public static int sendMail(String email) {
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
		p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
		p.put("mail.smtp.port", "587");                 // gmail 포트

		Authenticator auth = new MyAuthentication();

		//session 생성 및  MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);
		int ranNum = getRandomNum();
		try{
			//편지보낸시간
			msg.setSentDate(new Date());

			InternetAddress from = new InternetAddress() ;

			// 이메일 발신자
			from = new InternetAddress("RUN UP <//email>");
			msg.setFrom(from);

			// 이메일 수신자
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);

			// 이메일 제목
			msg.setSubject("*도움닿기* 회원가입 인증 메일", "UTF-8");

			// 이메일 내용
			msg.setText("<h3>\"도움닿기\" 회원가입 인증 메일입니다.</h3><br>"
					+ "아래 인증번호를 입력창에 입력해주세요.<br>"
					+ "인증번호는 " + ranNum + "입니다.", "UTF-8");

			// 이메일 헤더

			msg.setHeader("content-Type", "text/html");

			//메일보내기
			javax.mail.Transport.send(msg);

		}catch (AddressException addr_e) {
			addr_e.printStackTrace();
			return 0;
		}catch (MessagingException msg_e) {
			msg_e.printStackTrace();
			return 0;
		}
		return ranNum;
	}

	public static int getRandomNum() {

		int ranNum = (int)(Math.random()*(999999-100000+1)+100000);

		return ranNum;
	}
}

class MyAuthentication extends Authenticator {

	PasswordAuthentication pa;
	public MyAuthentication(){
		String id = "@gmail.com";       // 구글 ID
		String pw = "";          // 구글 비밀번호
		// ID와 비밀번호를 입력한다.
		pa = new PasswordAuthentication(id, pw);
	}
	// 시스템에서 사용하는 인증정보
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
