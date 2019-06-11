package kh.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.semi.dto.BoardDTO;
import kh.semi.dto.BoardListDTO;
import kh.semi.dto.CommentDTO;
import kh.semi.dto.TitleImgDTO;

public class BoardDAO {

	static int recordCountPerPage = 10;
	static int boardRecordCountPerPage = 12;
	static int naviCountPerPage = 5;
	public static int pageTotalCount;
	static String goBoard = "List.board";

	private Connection getConnection() throws Exception{
		Context root = new InitialContext();
		Context ctx = (Context)root.lookup("java:/comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc");
		return ds.getConnection();   
	}

	// read 페이지에서 필요함
	private PreparedStatement pstatForGetTitleImg(Connection con, int boardNo) throws Exception {
		String sql = "select * from title_img where t_b_no=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, boardNo);
		return pstat;
	}
	public TitleImgDTO getTitleImg(int boardNo) throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForGetTitleImg(con, boardNo);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				int boardNoResult = rs.getInt(1);
				String fileName = rs.getString(2);
				String oriFileName = rs.getString(3);
				String filePath = rs.getString(4);
				long fileSize = rs.getLong(5);
				TitleImgDTO dto = new TitleImgDTO(boardNoResult, fileName, oriFileName, filePath, fileSize);
				return dto;
			}
			return null;
		}
	}


	public PreparedStatement pstatForGetDataForMain(Connection con)throws Exception{
		String sql = "select b_due_date-sysdate as d_day, b_no, b_title, b_amount, "
				+ "b_due_date, b_sum_amount from board where b_due_date-sysdate like '+%' order by d_day";
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
			for(int i=0; i<4;i++) {
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

	public int insertBoard(BoardDTO dto, TitleImgDTO tdto)throws Exception{
		String sql = "insert into Board values(b_no_seq.nextval,?,?,?,?,?,?,?,?,default,default,default,default)";
		String sql2 = "insert into title_img values(b_no_seq.currval, ?, ?, ?, ?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				PreparedStatement pstat2 = con.prepareStatement(sql2);
				){
			// board 테이블에 insert!!
			pstat.setString(1,dto.getTitle());
			pstat.setString(2,dto.getEmail());
			pstat.setString(3,dto.getWriter());
			pstat.setInt(4,dto.getAmount());
			pstat.setString(5,dto.getBank());
			pstat.setString(6,dto.getAccount());
			pstat.setTimestamp(7, dto.getDueDate());
			pstat.setString(8, dto.getContents());
			int result = pstat.executeUpdate();

			// title_img 테이블에 insert!!
			pstat2.setString(1, tdto.getFileName());
			pstat2.setString(2, tdto.getOriFileName());
			pstat2.setString(3, tdto.getFilePath());
			pstat2.setLong(4, tdto.getFileSize());
			int result2 = pstat2.executeUpdate();

			con.commit();

			if(result>0 && result2>0) {
				return 1;
			}
			return 0;
		}
	}

	public int deleteClosedBoard() throws Exception {
		String sql = "delete from board where b_no in (select b_no from board where b_due_date-sysdate like '%-%')";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
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
	private PreparedStatement pstatForSelectOneClosedArticle(Connection con, int boardNo)throws Exception{
		String sql = "select * from closed where cl_b_no=?";
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
				boardDTO.setEmail(rs.getString("b_email"));
				boardDTO.setWriter(rs.getString("b_writer"));
				boardDTO.setAmount(rs.getInt("b_amount"));
				boardDTO.setBank(rs.getString("b_bank"));
				boardDTO.setAccount(rs.getString("b_account"));
				boardDTO.setContents(rs.getString("b_contents"));
				boardDTO.setDueDate(rs.getTimestamp("b_due_date"));
				boardDTO.setViewCount(rs.getInt("b_viewcount"));
				boardDTO.setWriteDate(rs.getTimestamp("b_writedate"));
				boardDTO.setRecommend(rs.getInt("b_recommend"));
				boardDTO.setSumAmount(rs.getInt("b_sum_amount"));
				return boardDTO;
			}
			return null;
		}
	}
	/**
	 * closed list  불러올때 사용
	 * @param boardNo
	 * @param closedParam
	 * @return
	 * @throws Exception
	 */
	public BoardDTO selectOneArticle(int boardNo,String closedParam)throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = pstatForSelectOneClosedArticle(con, boardNo);
				ResultSet rs = pstat.executeQuery();
				){
			BoardDTO boardDTO = new BoardDTO();
			if(rs.next()) {
				boardDTO.setBoardNo(rs.getInt(1));
				boardDTO.setTitle(rs.getString(2));
				boardDTO.setEmail(rs.getString(3));
				boardDTO.setWriter(rs.getString(4));
				boardDTO.setAmount(rs.getInt(5));
				boardDTO.setBank(rs.getString(6));
				boardDTO.setAccount(rs.getString(7));
				boardDTO.setContents(rs.getString(9));
				boardDTO.setDueDate(rs.getTimestamp(8));
				boardDTO.setViewCount(rs.getInt(10));
				boardDTO.setWriteDate(rs.getTimestamp(11));
				boardDTO.setRecommend(rs.getInt(12));
				boardDTO.setSumAmount(rs.getInt(13));
				return boardDTO;
			}
			return null;
		}
	}

	public int updatedEditing(int boardNo, String title, String content) throws Exception {
		String sql = "update board set b_title=?, b_contents=? where b_no=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, title);
			pstat.setString(2, content);
			pstat.setInt(3, boardNo);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	//*게시판*//==============================================================================================================================
	//totalCount//전체글개수----------------
	/*(1)전체 게시글의 개수*/
	public int totalRecordNum() throws Exception{
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
	/*(3) 마감된 게시글 전체 개수*/
	public int totalClosedRecordNum() throws Exception{
		String sql = "select row_number() over(order by cl_b_no desc) as rown, t1.*,t2.* from closed t1 join title_img t2 on (t1.cl_b_no = t2.t_b_no)";
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
	/*(4) 마감된 게시글에서 검색했을 때 전체 글 개수*/
	public PreparedStatement psForSearchOptionClosed(Connection con, String searchOption, String searchWord) throws Exception{
		String sql = "select * from closed t1 join title_img t2 on (t1.cl_b_no = t2.t_b_no) where "+searchOption+" like ? order by cl_b_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "%"+searchWord+"%");
		return ps;
	}
	public int totalClosedRecordNumBySearch(String searchOption, String searchWord) throws Exception{
		try(
				Connection con = this.getConnection();
				PreparedStatement ps = this.psForSearchOptionClosed(con, searchOption, searchWord);
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
	public PreparedStatement psForSelectByPage(Connection con, int startNum, int endNum) throws Exception{
		String sql = "select * from (select row_number() over(order by b_no desc) as rown, t1.*,t2.* from board t1 join title_img t2 on (t1.b_no = t2.t_b_no)) where rown between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, startNum);
		ps.setInt(2, endNum);
		return ps;
	}

	public List<BoardListDTO> selectByPage(int currentPage) throws Exception{
		int endNum = currentPage *boardRecordCountPerPage;
		int startNum = endNum - (boardRecordCountPerPage-1);
		try(
				Connection con = this.getConnection();
				PreparedStatement ps = this.psForSelectByPage(con, startNum, endNum);
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
				String contents = rs.getString("b_contents");
				int viewCount = rs.getInt("b_viewcount");
				String writeDate = rs.getString("b_writedate");
				int recommend = rs.getInt("b_recommend");
				int sumAmount = rs.getInt("b_sum_amount");

				String fileName = rs.getString("t_fileName");				
				String filePath = rs.getString("t_filePath");	

				BoardListDTO dto = new BoardListDTO(boardNo,email,title,writer,amount,bank,account,dueDate,contents,viewCount,writeDate,recommend,sumAmount,
						fileName,filePath);
				result.add(dto);
			}
			return result;
		}
	}	

	/*검색*///검색어=searchWord
	/*(2)searchOption으로 검색했을 때 게시글 목록*/
	public PreparedStatement psForSearchList(Connection con, String searchOption, String searchWord, int startNum, int endNum) throws Exception{
		String sql = "select * from (select row_number() over(order by b_no desc) as rown, t1.*,t2.* from board t1 join title_img t2 on (t1.b_no = t2.t_b_no) where "+searchOption+" LIKE ?) where rown between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "%"+searchWord+"%");
		ps.setInt(2, startNum);
		ps.setInt(3, endNum);	
		return ps;
	}

	public List<BoardListDTO> searchList(int currentPage, String searchOption, String searchWord) throws Exception{		
		int endNum = currentPage *boardRecordCountPerPage;
		int startNum = endNum - (boardRecordCountPerPage-1);

		try(
				Connection con = this.getConnection();
				PreparedStatement ps = this.psForSearchList(con, searchOption, searchWord, startNum, endNum);
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
				String contents = rs.getString("b_contents");
				int viewCount = rs.getInt("b_viewcount");
				String writeDate = rs.getString("b_writedate");
				int recommend = rs.getInt("b_recommend");
				int sumAmount = rs.getInt("b_sum_amount");
				String fileName = rs.getString("t_fileName");				
				String filePath = rs.getString("t_filePath");		

				BoardListDTO dto = new BoardListDTO(boardNo,email,title,writer,amount,bank,account,dueDate,contents,viewCount,writeDate,recommend,sumAmount,
						fileName,filePath);
				result.add(dto);
			}
			return result;
		}	
	}

	/*(3) 마감된 게시글 목록*/
	public PreparedStatement psForSelectByClosedPage(Connection con, int startNum, int endNum) throws Exception{
		String sql = "select * from (select row_number() over(order by cl_b_no desc) as rown, t1.*,t2.* from closed t1 join title_img t2 on (t1.cl_b_no = t2.t_b_no)) where rown between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, startNum);
		ps.setInt(2, endNum);
		return ps;
	}

	public List<BoardListDTO> selectByClosedPage(int currentPage) throws Exception{
		int endNum = currentPage *boardRecordCountPerPage;
		int startNum = endNum - (boardRecordCountPerPage-1);
		try(
				Connection con = this.getConnection();
				PreparedStatement ps = this.psForSelectByClosedPage(con, startNum, endNum);
				ResultSet rs = ps.executeQuery();	
				){
			List<BoardListDTO> result = new ArrayList<>();
			while(rs.next()) {

				int boardNo = rs.getInt("cl_b_no");
				String email = rs.getString("cl_b_email");
				String title = rs.getString("cl_b_title");
				String writer = rs.getString("cl_b_writer");
				int amount = rs.getInt("cl_b_amount");
				String bank = rs.getString("cl_b_bank");
				String account = rs.getString("cl_b_account");
				String dueDate = rs.getString("cl_b_due_date");
				String contents = rs.getString("cl_b_contents");
				int viewCount = rs.getInt("cl_b_viewcount");
				String writeDate = rs.getString("cl_b_writedate");
				int recommend = rs.getInt("cl_b_recommend");
				int sumAmount = rs.getInt("cl_b_sum_amount");

				String fileName = rs.getString("t_fileName");				
				String filePath = rs.getString("t_filePath");	

				BoardListDTO dto = new BoardListDTO(boardNo,email,title,writer,amount,bank,account,dueDate,contents,viewCount,writeDate,recommend,sumAmount,
						fileName,filePath);
				result.add(dto);
			}
			return result;
		}
	}	

	/*(4)마감된 페이지에서 searchOption으로 검색했을 때 게시글 목록*/
	public PreparedStatement psForClosedSearchList(Connection con, String searchOption, String searchWord, int startNum, int endNum) throws Exception{
		String sql = "select * from (select row_number() over(order by cl_b_no desc) as rown, t1.*,t2.* from closed t1 join title_img t2 on (t1.cl_b_no = t2.t_b_no) where "+searchOption+" LIKE ?) where rown between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "%"+searchWord+"%");
		ps.setInt(2, startNum);
		ps.setInt(3, endNum);	
		return ps;
	}

	public List<BoardListDTO> closedSearchList(int currentPage, String searchOption, String searchWord) throws Exception{		
		int endNum = currentPage *boardRecordCountPerPage;
		int startNum = endNum - (boardRecordCountPerPage-1);

		try(
				Connection con = this.getConnection();
				PreparedStatement ps = this.psForClosedSearchList(con, searchOption, searchWord, startNum, endNum);
				ResultSet rs = ps.executeQuery();
				){
			List<BoardListDTO> result = new ArrayList<>();
			while(rs.next()) {
				int boardNo = rs.getInt("cl_b_no");
				String email = rs.getString("cl_b_email");
				String title = rs.getString("cl_b_title");
				String writer = rs.getString("cl_b_writer");
				int amount = rs.getInt("cl_b_amount");
				String bank = rs.getString("cl_b_bank");
				String account = rs.getString("cl_b_account");
				String dueDate = rs.getString("cl_b_due_date");
				String contents = rs.getString("cl_b_contents");
				int viewCount = rs.getInt("cl_b_viewcount");
				String writeDate = rs.getString("cl_b_writedate");
				int recommend = rs.getInt("cl_b_recommend");
				int sumAmount = rs.getInt("cl_b_sum_amount");
				String fileName = rs.getString("t_fileName");				
				String filePath = rs.getString("t_filePath");		

				BoardListDTO dto = new BoardListDTO(boardNo,email,title,writer,amount,bank,account,dueDate,contents,viewCount,writeDate,recommend,sumAmount,
						fileName,filePath);
				result.add(dto);
			}
			return result;
		}	
	}


	/*페이지 네비게이터*/
	public String getNavi(int currentPage, int totalRecordCount, String searchOption, String searchWord, String classification) throws Exception {

		int recordTotalCount = totalRecordCount;
		int recordCountPerPage = 12; //12개의 글이 보이게 한다.	
		int naviCountPerPage = 5; //5개의 네비가 보이게 한다.

		int pageTotalCount = recordTotalCount / recordCountPerPage;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount++;
		}

		//현재  페이지 오류 검출 및 정정
		/*보안코드 : 현재페이지가 1보다 작다면 1로, 전체페이지보다 크다면 전체페이지(pageTotalCount)로 표시하겠다*/
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage - 1)/naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1); 

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) { 
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();
		if(searchOption.contains(" ")&classification.equals("ongoing")) { 
			searchOption = "b_title or b_contents";
		}else if(classification.equals("closed")) {
			if(searchOption.contains(" ")) {
				searchOption = "cl_b_title or cl_b_contents";
			}else if(searchOption.equals("b_title")) {
				searchOption = "cl_b_title";
			}else if(searchOption.equals("b_contents")) {
				searchOption = "cl_b_contents";
			}
		}

		if(classification.equals("ongoing")) {
			goBoard = "List.board";
		}else{
			goBoard = "ClosedList.board";
		}
		if(needPrev) {
			int prevStartNavi = startNavi-1;
			sb.append("	<li class=\"page-item\"><a class=\"page-link\" href=\""+goBoard+"?searchOption="+searchOption+"&searchWord="+searchWord+"&currentPage="+ prevStartNavi +"&classification="+classification+"\"" + 
					"							aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>" + 
					"						</a></li>");		
		}
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<li class=\"page-item\"><a class=\"page-link pageNumber\" href=\""+goBoard+"?searchOption="+searchOption+"&searchWord="+searchWord+"&currentPage="+i+"&classification="+classification+"\">" + i + "</a></li>");
		}
		if(needNext) {
			int nextEndNavi = endNavi+1;
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\""+goBoard+"?searchOption="+searchOption+"&searchWord="+searchWord+"&currentPage="+ nextEndNavi++ +"&classification="+classification+"\""+ 
					"							aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>" + 
					"						</a></li>");
		}

		return sb.toString();
	}
	//============================================================================================================================	


	public int updateSumAccount(int amount, int boardNo) throws Exception {
		String sql = "update board set b_sum_amount=b_sum_amount+? where b_No=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, amount);
			pstat.setInt(2, boardNo);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	private PreparedStatement pstatForRecommendCheck(Connection con, String email, int boardNo) throws Exception {
		String sql = "select * from recommend where r_email=? and r_b_no=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, email);
		pstat.setInt(2, boardNo);
		return pstat;
	}
	public boolean recommendCheck(String email, int boardNo) throws Exception {
		String sql = "select * from recommend where r_email=? and r_b_no=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatForRecommendCheck(con, email, boardNo);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				return false;
			}
			return true;
		}
	}

	public boolean updateRecommend(String email, int boardNo, String title) throws Exception{
		String sql1 = "update board set b_recommend=b_recommend+1 where b_no=?";
		String sql2 = "insert into recommend values(?, ?, ?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat1 = con.prepareStatement(sql1);
				PreparedStatement pstat2 = con.prepareStatement(sql2);
				){
			pstat1.setInt(1, boardNo);

			pstat2.setString(1, email);
			pstat2.setInt(2, boardNo);
			pstat2.setString(3, title);

			int result = pstat1.executeUpdate();
			int result2 = pstat2.executeUpdate();
			con.commit();

			if(result>0 && result2>0) {
				return true;
			}
			return false;
		}
	}

	public int updateViewCount(int boardNo) throws Exception {
		String sql = "update board set b_viewcount=b_viewcount+1 where b_no=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, boardNo);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public int insertComment(String email, String name, int boardNo, String comment) throws Exception {
		String sql = "insert into comments values(?, ?, ?, ?, default)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, email);
			pstat.setString(2, name);
			pstat.setInt(3, boardNo);
			pstat.setString(4, comment);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int selectAllComments(int boardNo) throws Exception {
		String sql = "select * from comments where c_b_no=" + boardNo + " order by c_write_date desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			int commentsSize = 0;
			while(rs.next()) {
				commentsSize++;
			}
			return commentsSize;
		}
	}
	public List<CommentDTO> selectCommentsByBoardNo(int commentPage, int boardNo) throws Exception {
		String sql = "select * from comments where c_b_no=" + boardNo + " order by c_write_date desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<CommentDTO> result = new ArrayList<>();
			while(rs.next()) {
				result.add(new CommentDTO(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getTimestamp(5)));
			}

			int fromIndex = (commentPage*recordCountPerPage)-(recordCountPerPage-1);
			int toIndex = commentPage*recordCountPerPage;

			if(toIndex > result.size()) {
				toIndex = result.size();
			}
			return result.subList(fromIndex-1, toIndex);
		}
	}

	public int deleteComment(String email, String writeDate) throws Exception {
		String sql = "delete comments where c_email=? and c_write_date=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, email);
			pstat.setTimestamp(2, Timestamp.valueOf(writeDate));
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int deleteComment(int boardNo, String writeDate) throws Exception {
		String sql = "delete comments where c_b_no=? and c_write_date=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, boardNo);
			pstat.setTimestamp(2, Timestamp.valueOf(writeDate));
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int updateComment(String email, String comment, String writeDate) throws Exception {
		String sql = "update comments set c_comment=? where c_email=? and c_write_date=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, comment);
			pstat.setString(2, email);
			pstat.setTimestamp(3, Timestamp.valueOf(writeDate));
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public Map<String, Integer> getCommentNavi(int currentPage, int recordTotalCount) { //해용 페이지
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
		int needPrev = 1;	// 1이면 true, -1이면 false
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


}
