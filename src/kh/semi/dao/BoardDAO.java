package kh.semi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kh.semi.dto.BoardDTO;
import kh.semi.dto.BoardListDTO;
import kh.semi.dto.TitleImgDTO;
import kh.semi.dto.UfileDTO;


public class BoardDAO {
	static int recordCountPerPage = 8;
	static int naviCountPerPage = 5;
	public static int pageTotalCount;

	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//String url = "jdbc:oracle:thin:@192.168.60.23:1521:xe";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String pw = "semi";
		return DriverManager.getConnection(url,user,pw);
	}


	public int insertBoard(BoardDTO dto)throws Exception{
		String sql = "insert into Board values(b_no_seq.nextval,?,?,?,?,?,?,?,?,?,default,default,default,default)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1,dto.getTitle());
			pstat.setString(2,dto.getWriter());
			pstat.setInt(3,dto.getAmount());
			pstat.setString(4,dto.getBank());
			pstat.setString(5,dto.getAccount());
			if(dto.getContents().length()<=4000) {
				pstat.setString(6,dto.getContents());
			}else if(dto.getContents().length() > 4000 && dto.getContents().length()<=8000){
				pstat.setString(6,dto.getContents().substring(0, 3999));
				pstat.setString(7,dto.getContents().substring(4000,7999));
			}else if(dto.getContents().length() > 8000 && dto.getContents().length() <=11999) {
				pstat.setString(6,dto.getContents().substring(0, 3999));
				pstat.setString(7,dto.getContents().substring(4000,7999));
				pstat.setString(8,dto.getContents().substring(8000, 11999));
			}
			pstat.setString(9, dto.getDueDate());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}

	}

	private PreparedStatement pstatForSelectOneArticle(Connection con, int boardNo)throws Exception{
		String sql = "select * from board where b_no=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, boardNo);
		return pstat;
	}

	public BoardDTO selectOneArticle(int boardNo)throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = pstatForSelectOneArticle(con, boardNo);
				ResultSet rs = pstat.executeQuery();
				){
			BoardDTO boardDTO = new BoardDTO();
			if(rs.next()) {
				boardDTO.setBoardNo(rs.getInt("b_no"));
				boardDTO.setTitle(rs.getString("b_title"));
				boardDTO.setWriter(rs.getString("b_writer"));
				boardDTO.setAmount(rs.getInt("b_amount"));
				boardDTO.setBank(rs.getString("b_bank"));
				boardDTO.setAccount(rs.getString("b_account"));
				boardDTO.setDueDate(rs.getString("b_due_date"));
				boardDTO.setContents(rs.getString("b_contents1")+rs.getString("b_contents2")+rs.getString("b_contents3"));
				boardDTO.setViewCount(rs.getInt("b_viewcount"));
				boardDTO.setWriteDate(rs.getString("b_writedate"));
				boardDTO.setRecommend(rs.getInt("b_recommend"));
				boardDTO.setSumAmount(rs.getInt("b_sum_amount"));
				return boardDTO;
			}
			return null;
		}
	}

//*게시판*//=================================================================================================
	//totalCount//
	/*(1)전체 게시글의 개수*/
	public int totalRecordNum() throws Exception{
	//	String sql = "select * from board order by b_no desc";
		String sql = "select row_number() over(order by b_no desc) as rown, t1.*,t2.* from board t1 join title_img t2 on (t1.b_no = t2.t_b_no)";
		try(
				Connection con = this.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();	
				){
			int result = 0;
			while(rs.next()) {
				result++;
			}
			return result;
		}
	}
	/*(2)searchOption으로 검색했을 때 전체 게시글 개수*/
	public PreparedStatement psForSearchOption(Connection con, String searchOption, String searchWord) throws Exception{
		//String sql = "select * from board where " + searchOption + " like ? order by b_no desc";
		String sql = "select * from board t1 join title_img t2 on (t1.b_no = t2.t_b_no) where "+searchOption+" like ? order by b_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "%"+searchWord+"%");
		return ps;
	}
	public int totalRecordNumBySearch(String searchOption, String searchWord) throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement ps = this.psForSearchOption(con, searchOption, searchWord);
				ResultSet rs = ps.executeQuery();	
				){
			int result = 0;
			while(rs.next()) {
				result++;
			}
			return result;
		}
	}
	
	/*(1)전체 게시판 목록*/
	public PreparedStatement psForSelectByPage(Connection con, int currentPage) throws Exception{
		String sql = "select row_number() over(order by b_no desc) as rown, t1.*,t2.* from board t1 join title_img t2 on (t1.b_no = t2.t_b_no)";
		PreparedStatement ps = con.prepareStatement(sql);
		return ps;
	}
	public List<BoardListDTO> selectByPage(int currentPage) throws Exception{

		try(
				Connection con = this.getConnection();
				PreparedStatement ps = this.psForSelectByPage(con, currentPage);
				ResultSet rs = ps.executeQuery();	
				){
			List<BoardListDTO> result = new ArrayList<>();
			while(rs.next()) {

				int boardNo = rs.getInt("b_no");
				String email = rs.getString("b_email");
				String title = rs.getString("b_title");
				String writer = rs.getString("b_writer");
				int amount = rs.getInt("b_amount");
				String bank = rs.getString("b_bank");
				String account = rs.getString("b_account");
				String dueDate = rs.getString("b_due_date");
				String contents = rs.getString("b_contents1")+rs.getString("b_contents2")+rs.getString("b_contents3");
				int viewCount = rs.getInt("b_viewcount");
				String writeDate = rs.getString("b_writedate");
				int recommend = rs.getInt("b_recommend");
				int sumAmount = rs.getInt("b_sum_amount");
				
				String fileName = rs.getString("t_fileName");
				String oriFileName = rs.getString("t_oriFileName");					
				String filePath = rs.getString("t_filePath");
				long fileSize = rs.getLong("t_fileSize");				

				BoardListDTO dto = new BoardListDTO(boardNo,email,title,writer,amount,bank,account,dueDate,contents,viewCount,writeDate,recommend,sumAmount,
						fileName,oriFileName,filePath,fileSize);
				result.add(dto);
			}
			return result;
		}
	}	

	
	/*검색*///검색어=searchWord
	/*(2)searchOption으로 검색했을 때 게시글 목록*/
	public PreparedStatement psForSearchList(Connection con, String searchOption, String searchWord, int currentPage) throws Exception{
		String sql = "select * from board t1 join title_img t2 on (t1.b_no = t2.t_b_no) where "+searchOption+" like ? order by b_no desc";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "%"+searchWord+"%");
		return ps;
	}
	public List<BoardListDTO> searchList(String searchOption, String searchWord, int currentPage) throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement ps = this.psForSearchList(con, searchOption, searchWord, currentPage);
				ResultSet rs = ps.executeQuery();
				){
			List<BoardListDTO> result = new ArrayList<>();
			while(rs.next()) {
				int boardNo = rs.getInt("b_no");
				String email = rs.getString("b_email");
				String title = rs.getString("b_title");
				String writer = rs.getString("b_writer");
				int amount = rs.getInt("b_amount");
				String bank = rs.getString("b_bank");
				String account = rs.getString("b_account");
				String dueDate = rs.getString("b_due_date");
				String contents = rs.getString("b_contents1")+rs.getString("b_contents2")+rs.getString("b_contents3");
				int viewCount = rs.getInt("b_viewcount");
				String writeDate = rs.getString("b_writedate");
				int recommend = rs.getInt("b_recommend");
				int sumAmount = rs.getInt("b_sum_amount");
				String fileName = rs.getString("t_fileName");
				String oriFileName = rs.getString("t_oriFileName");					
				String filePath = rs.getString("t_filePath");
				long fileSize = rs.getLong("t_fileSize");				

				BoardListDTO dto = new BoardListDTO(boardNo,email,title,writer,amount,bank,account,dueDate,contents,viewCount,writeDate,recommend,sumAmount,
						fileName,oriFileName,filePath,fileSize);
				result.add(dto);
			}
			return result;
		}	
	}
	
	/*페이지 네비게이터*/
	public Map<String, Integer> getNavi(int currentPage, int recordTotalCount) {
	      // 가지고 있는 게시글의 수에 맞는 페이지의 개수를 구함.
	      int pageTotalCount = recordTotalCount / recordCountPerPage;
	      if(recordTotalCount % recordCountPerPage > 0) {
	         pageTotalCount++;
	      }
	      // 현재 페이지 오류 검출 및 정정
	      if(currentPage < 1) {
	         currentPage = 1;
	      }
	      else if(currentPage > pageTotalCount) {
	         currentPage = pageTotalCount;
	      }
	      // 네비게이터 시작과 끝
	      int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage + 1;
	      int endNavi = startNavi + (naviCountPerPage - 1);
	      // 네비 끝값이 최대 페이지 번호를 넘어가면 최대 페이지번호로 네비 끝값을 설정한다.
	      if(endNavi > pageTotalCount) {
	         endNavi = pageTotalCount;
	      }
	      int needPrev = 1;   // 1이면 true, -1이면 false
	      int needNext = 1;

	      if(startNavi == 1) {
	         needPrev = -1;
	      }
	      if(endNavi == pageTotalCount) {
	         needNext = -1;
	      }

	      Map<String, Integer> pageNavi = new HashMap<>();
	      pageNavi.put("currentPage", currentPage);
	      pageNavi.put("recordTotalCount", recordTotalCount);
	      pageNavi.put("recordCountPerPage", recordCountPerPage);
	      pageNavi.put("naviCountPerPage", naviCountPerPage);
	      pageNavi.put("pageTotalCount", pageTotalCount);
	      pageNavi.put("startNavi", startNavi);
	      pageNavi.put("endNavi", endNavi);
	      pageNavi.put("needPrev", needPrev);
	      pageNavi.put("needNext", needNext);

	      return pageNavi;
	   }

	/*(2)내용으로 검색*/ //searchContents
//		public PreparedStatement psForSearchContents(Connection con, String searchWord, int startNum, int endNum) throws Exception{
//			String sql = "select * from (select row_number() over(order by b_no desc) as rown, board.* from board where B_contents1 || b_contents2 ||b_contents3 like '%?%') where rown between ? and ?";
//			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setString(1, searchWord);
//			ps.setInt(2, startNum);
//			ps.setInt(3, endNum);
//			return ps;
//		}
//		public List<BoardListDTO> searchContents(String searchWord, int startNum, int endNum) throws Exception{
//			try(
//					Connection con = this.getConnection();
//					PreparedStatement ps = this.psForSearchContents(con, searchWord, startNum, endNum);
//					ResultSet rs = ps.executeQuery();
//					){
//				List<BoardListDTO> result = new ArrayList<>();
//				while(rs.next()) {
//					int boardNo = rs.getInt("b_no");
//					String email = rs.getString("b_email");
//					String title = rs.getString("b_title");
//					String writer = rs.getString("b_writer");
//					int amount = rs.getInt("b_amount");
//					String bank = rs.getString("b_bank");
//					String account = rs.getString("b_account");
//					String dueDate = rs.getString("b_due_date");
//					String contents = rs.getString("b_contents1")+rs.getString("b_contents2")+rs.getString("b_contents3");
//					int viewCount = rs.getInt("b_viewcount");
//					String writeDate = rs.getString("b_writedate");
//					int recommend = rs.getInt("b_recommend");
//					int sumAmount = rs.getInt("b_sum_amount");
//					int fileSeq = rs.getInt("t_fileSeq");
//					String fileName = rs.getString("t_fileName");
//					String oriFileName = rs.getString("t_oriFileName");					
//					String filePath = rs.getString("t_filePath");
//					long fileSize = rs.getLong("t_fileSize");				
//
//					BoardListDTO dto = new BoardListDTO(boardNo,email,title,writer,amount,bank,account,dueDate,contents,viewCount,writeDate,recommend,sumAmount,fileSeq,
//							fileName,oriFileName,filePath,fileSize);
//				}
//				return result;
//			}		
//		}	
	/*(3)제목+내용으로 검색*/ //searchAll
//		public PreparedStatement psForSearchAll(Connection con, String searchOption, String searchWord, int startNum, int endNum) throws Exception{
//			String sql = "select * from (select row_number() over(order by b_no desc) as rown, board.* from board where "+searchOption+" like '%?%') where rown between ? and ?";
//			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setString(1, searchWord);
//			ps.setInt(2, startNum);
//			ps.setInt(3, endNum);
//			return ps;
//		}
//		public List<BoardListDTO> searchAll(String searchWord, int startNum, int endNum) throws Exception{
//			try(
//					Connection con = this.getConnection();
//					PreparedStatement ps = this.psForSearchContents(con, searchWord, startNum, endNum);
//					ResultSet rs = ps.executeQuery();
//					){
//				List<BoardListDTO> result = new ArrayList<>();
//				while(rs.next()) {
//					int boardNo = rs.getInt("b_no");
//					String email = rs.getString("b_email");
//					String title = rs.getString("b_title");
//					String writer = rs.getString("b_writer");
//					int amount = rs.getInt("b_amount");
//					String bank = rs.getString("b_bank");
//					String account = rs.getString("b_account");
//					String dueDate = rs.getString("b_due_date");
//					String contents = rs.getString("b_contents1")+rs.getString("b_contents2")+rs.getString("b_contents3");
//					int viewCount = rs.getInt("b_viewcount");
//					String writeDate = rs.getString("b_writedate");
//					int recommend = rs.getInt("b_recommend");
//					int sumAmount = rs.getInt("b_sum_amount");
//					int fileSeq = rs.getInt("t_fileSeq");
//					String fileName = rs.getString("t_fileName");
//					String oriFileName = rs.getString("t_oriFileName");					
//					String filePath = rs.getString("t_filePath");
//					long fileSize = rs.getLong("t_fileSize");				
//
//					BoardListDTO dto = new BoardListDTO(boardNo,email,title,writer,amount,bank,account,dueDate,contents,viewCount,writeDate,recommend,sumAmount,fileSeq,
//							fileName,oriFileName,filePath,fileSize);
//				}
//				return result;
//			}		
//		}	

	
}

