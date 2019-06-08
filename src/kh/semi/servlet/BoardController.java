package kh.semi.servlet;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.semi.dao.BoardDAO;
import kh.semi.dao.MemberDAO;
import kh.semi.dao.PaymentDAO;
import kh.semi.dto.BoardDTO;
import kh.semi.dto.BoardListDTO;
import kh.semi.dto.CommentDTO;
import kh.semi.dto.PaymentDTO;
import kh.semi.dto.TitleImgDTO;


@WebServlet("*.board")
public class BoardController extends HttpServlet {	
	private int fileIdNo = 1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");// 페이지내에 인코딩 정보가 없는 경우에 필요한 코드(ex. ajax)
		PrintWriter pw = response.getWriter();
		String requestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath();

		String cmd = requestURI.substring(contextPath.length());
		//		System.out.println(cmd);

		MemberDAO mdao = new MemberDAO();
		BoardDAO dao = new BoardDAO();
		PaymentDAO pdao = new PaymentDAO();
		BoardDTO dto = new BoardDTO();
		TitleImgDTO tdto = new TitleImgDTO();

		try {
			if(cmd.contentEquals("/write.board")) {
				request.getRequestDispatcher("/WEB-INF/boards/writer.jsp").forward(request, response);

			}else if(cmd.equals("/writer.board")) { // 사용자가 입력한 값을 받아서 BoardDAO로 보내주는 부분
				request.getSession().setAttribute("flag", "true");
				int maxSize = 10 * 1024 * 1024;

				SimpleDateFormat simpledf = new SimpleDateFormat("yy-MM-dd");
				Long tempTime = System.currentTimeMillis();
				String newDate = simpledf.format(tempTime);

				String rootPath = request.getSession().getServletContext().getRealPath("/");
				String email = (String)request.getSession().getAttribute("loginEmail");
				dto.setEmail(email);

				File tempFile = new File(rootPath+email);
				if(!tempFile.exists()) {
					tempFile.mkdir();
				}

				String savePath = rootPath + email + "/" + newDate;
				tdto.setFilePath(savePath);
				String uploadFile = "";
				String newFileName = "";

				File uploadPath = new File(savePath);
				if(!uploadPath.exists()) {
					uploadPath.mkdir();
				}

				long currentTime = System.currentTimeMillis();
				SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");

				try {
					MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
					uploadFile = multi.getFilesystemName("filename");
					tdto.setOriFileName(uploadFile);
					newFileName = currentTime + "." + uploadFile.substring(uploadFile.lastIndexOf(".")+1);
					tdto.setFileName(newFileName);

					File oldFile = new File(savePath + "/" + uploadFile);
					File newFile = new File(savePath  + "/" + newFileName);

					if(!oldFile.renameTo(newFile)) {
						DataOutputStream dos = new DataOutputStream(new FileOutputStream(newFile));
						DataInputStream dis = new DataInputStream(new FileInputStream(oldFile));

						byte[] fileContents = new byte[(int)oldFile.length()];
						dis.readFully(fileContents);

						dos.write(fileContents);
						dos.flush();
						dos.close();
						dis.close();
						oldFile.delete();
					}
					
					dto.setWriter(multi.getParameter("writer"));
					dto.setAmount(Integer.parseInt(multi.getParameter("amount")));
					String duedate = multi.getParameter("dueDate") + " " + sdf.format(currentTime);
					dto.setDueDate(Timestamp.valueOf(duedate));
					dto.setBank(multi.getParameter("select"));
					dto.setAccount(multi.getParameter("account"));
					
					String content = multi.getParameter("contents");
					content.replaceAll("<.?script>", "");
					dto.setContents(content);
					
					try {
						int result = dao.insertBoard(dto, tdto);
						request.setAttribute("board", result);
					}catch(Exception e) {
						e.printStackTrace();
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("/WEB-INF/boards/alertWrite.jsp").forward(request, response);

			}else if(cmd.equals("/uploadImage.board")) { // 서버 측 이미지 업로드 
				request.getSession().setAttribute("flag", "false");
				int maxSize = 10 * 1024 * 1024;

				SimpleDateFormat simpledf = new SimpleDateFormat("yy-MM-dd");
				Long tempTime = System.currentTimeMillis();
				String newDate = simpledf.format(tempTime);

				String rootPath = request.getSession().getServletContext().getRealPath("/");
				String email = (String)request.getSession().getAttribute("loginEmail");

				File tempFile = new File(rootPath+email);
				if(!tempFile.exists()) {
					tempFile.mkdir();
				}

				String savePath = rootPath + email + "/" + newDate;
				tdto.setFilePath(savePath);
				System.out.println("boardControllerFilePath : " + savePath);
				String uploadFile = "";
				String newFileName = "";

				File uploadPath = new File(savePath);
				if(!uploadPath.exists()) {
					uploadPath.mkdir();
				}

				long currentTime = System.currentTimeMillis();

				try {
					MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());				
					uploadFile = multi.getFilesystemName("file");
					newFileName = currentTime + "." + uploadFile.substring(uploadFile.lastIndexOf(".")+1);
					tdto.setFileName(newFileName);

					File oldFile = new File(savePath + "/" + uploadFile);
					File newFile = new File(savePath  + "/" + newFileName);

					if(!oldFile.renameTo(newFile)) {
						DataOutputStream dos = new DataOutputStream(new FileOutputStream(newFile));
						DataInputStream dis = new DataInputStream(new FileInputStream(oldFile));

						byte[] fileContents = new byte[(int)oldFile.length()];
						dis.readFully(fileContents);

						dos.write(fileContents);
						dos.flush();
						dos.close();
						dis.close();
						oldFile.delete();
					}

					pw.append(email + "/" + newDate + "/"+ newFileName);

				}catch(Exception e) {
					e.printStackTrace();
				}

			}else if(cmd.equals("/deleteImage.board")) { // 서버 측 이미지 삭제
				try {
					Thread.sleep(500);
				}catch(Exception e) {
					e.printStackTrace();
				}

				String test = (String)request.getSession().getAttribute("flag");
				if(test.equals("false")) {
					String rootPath = this.getServletContext().getRealPath("/");
					System.out.println("rootPath: " + rootPath);
					String fileUrl = request.getParameter("src");
					System.out.println("fileUrl: " + fileUrl);
					String filePath = null;
					if(fileUrl.startsWith("http")) {
						filePath = fileUrl.replaceAll("http://.+?/", "");
					}else {
						filePath = fileUrl;
					}
					boolean deleteFile = new File(rootPath+filePath).delete();
					pw.print(deleteFile);
				}
				request.getSession().setAttribute("flag", "false");

			}else if(cmd.equals("/Read.board")) {
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int commentPage = Integer.parseInt(request.getParameter("commentPage"));
				BoardDTO article = dao.selectOneArticle(boardNo);
				List<CommentDTO> comments = dao.selectCommentsByBoardNo(commentPage, boardNo);
				dao.updateViewCount(boardNo);

				double amount = article.getAmount();
				double sumAmount = article.getSumAmount();
				double percentage = Math.floor((double)sumAmount / amount * 100);

				TitleImgDTO titleImg = dao.getTitleImg(boardNo);
				response.setCharacterEncoding("UTF-8");
				request.setCharacterEncoding("UTF-8");

				String str = titleImg.getFilePath();

				//				String result = str.replaceAll("C:.+?2Project.+?",""); // 해용이 집
				//String result = str.replaceAll("D:.+?Project.+?Project.+?",""); // 해용이꺼

				//String result = str.replaceAll("D:.+?mi.+?mi02.+?",""); 재용오빠꺼
				//				String result = str.replaceAll("D:.+?mi.+?",""); //슬기꺼
				String result = str.replaceAll("D.+?4.+?",""); // 지혜

				DecimalFormat Commas = new DecimalFormat("#,###,###");

				request.setAttribute("currentPage", currentPage);
				request.setAttribute("titleImg", result+"/"+titleImg.getFileName());
				request.setAttribute("pageNavi", dao.getCommentNavi(commentPage, dao.selectAllComments(boardNo)));
				request.setAttribute("commentPage", commentPage);
				request.setAttribute("comments", comments);
				request.setAttribute("percentage", percentage);
				request.setAttribute("boardNo", boardNo);
				request.setAttribute("amount", Commas.format(amount));
				request.setAttribute("sumAmount", Commas.format(sumAmount));
				request.setAttribute("result", article);

				request.getRequestDispatcher("WEB-INF/boards/read.jsp").forward(request, response);

			}else if(cmd.equals("/PaymentForm.board")){
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				String title = dao.selectOneArticle(boardNo).getTitle();

				String email = (String)request.getSession().getAttribute("loginEmail");
				List<String> result = mdao.selectByEmail(email);
				request.setAttribute("boardNo", boardNo);
				request.setAttribute("title", title);
				request.setAttribute("result", result);
				request.getRequestDispatcher("WEB-INF/boards/payment.jsp").forward(request, response);
				
			}else if(cmd.equals("/edit.board")) {
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				BoardDTO article = dao.selectOneArticle(boardNo);
				DecimalFormat Commas = new DecimalFormat("#,###,###");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				request.setAttribute("amount", Commas.format(article.getAmount()));
				request.setAttribute("duedate", sdf.format(article.getDueDate()));
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("result", article);
				request.getRequestDispatcher("/WEB-INF/boards/edit.jsp").forward(request, response);
				
			}else if(cmd.equals("/editCompleted.board")) {
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int commentPage = Integer.parseInt(request.getParameter("commentPage"));
				String title = request.getParameter("title");
				String content = request.getParameter("contents");
				int result = dao.updatedEditing(boardNo, title, content);
				request.setAttribute("boardNo", boardNo);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("commentPage", commentPage);
				if(result > 0) {
					request.getRequestDispatcher("Read.board").forward(request, response);
				}else {
					request.setAttribute("fail", 1);
					request.getRequestDispatcher("List.board").forward(request, response);
				}
				
			}else if(cmd.equals("/List.board")){ //후원 게시판 목록
				try {
					String searchOption = request.getParameter("searchOption"); //검색 종류
					String searchWord = request.getParameter("searchWord"); //검색어

					int currentPage = Integer.parseInt(request.getParameter("currentPage")); //현재페이지

					if(searchOption.contains(" ")) { //추가
						searchOption = "b_title || b_contents";
					}
					request.setAttribute("currentPage", currentPage);
					int totalRecordCount = 0; //=recordTotalCount

					List<BoardListDTO> result = new ArrayList<>();
					if(searchOption.equals("allPages")){ //전체 글 목록
						totalRecordCount = dao.totalRecordNum();
						result = dao.selectByPage(currentPage);	

					}else {
						totalRecordCount = dao.totalRecordNumBySearch(searchOption, searchWord);
						request.setAttribute("totalRecordCount", totalRecordCount);	 
						result = dao.searchList(currentPage, searchOption, searchWord);
						request.setAttribute("searchWord", searchWord);
					}

					String[] sumAmountArr = new String[12];
					for(int i = 0; i < result.size(); i++) {
						String path = result.get(i).getFilePath();
						String folder = path.replaceAll("D.+?4.+?",""); //지혜껀가
//						String folder = path.replaceAll("D:.+?mi.+?",""); //슬기꺼
						result.get(i).setNewFilePath(folder + "/" + result.get(i).getFileName());						
						/*progress bar 추가됨*/
						int sumAmount = result.get(i).getSumAmount();
						int goalAmount = result.get(i).getAmount();
						int percentage = (int) Math.floor((double) sumAmount / goalAmount * 100);
						result.get(i).setPercentage(percentage);
						DecimalFormat Commas = new DecimalFormat("#,###,###");
						sumAmountArr[i] = Commas.format(sumAmount);
						request.setAttribute("sumAmount", sumAmountArr);	
					}
					request.setAttribute("board", result);
					request.setAttribute("fail", request.getParameter("fail"));
					request.setAttribute("getNavi", dao.getNavi(currentPage, totalRecordCount, searchOption, searchWord));
					request.getRequestDispatcher("WEB-INF/boards/board.jsp").forward(request, response); 

				}catch(Exception e) {				
					e.printStackTrace();
				}
			}else if(cmd.equals("/TalentDonations.board")){ //재능기부 게시판
				request.getRequestDispatcher("WEB-INF/boards/talentDonations.jsp").forward(request, response);

			}else if(cmd.equals("/Payment.board")) {
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				int amount = Integer.parseInt(request.getParameter("amount"));

				try {
					PaymentDTO pdto = new PaymentDTO(boardNo, name, email, phone, amount, null);
					int result = pdao.insertPayment(pdto);
					int result2 = dao.updateSumAccount(amount, boardNo);

					BoardDTO board = dao.selectOneArticle(boardNo);

					request.setAttribute("boardNo", boardNo);
					request.setAttribute("result", result);
					request.setAttribute("board", board);
					request.setAttribute("payment", pdto);
					request.getRequestDispatcher("/WEB-INF/boards/payCompleted.jsp").forward(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(cmd.equals("/Recommend.board")) {
				String email = (String)request.getSession().getAttribute("loginEmail");
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				String title = request.getParameter("title");

				try {
					dao.updateRecommend(email, boardNo, title);
					int recommend = dao.selectOneArticle(boardNo).getRecommend();
					pw.print(recommend);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(cmd.equals("/RecommendCheck.board")) {
				String email = (String)request.getSession().getAttribute("loginEmail");
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));

				try {
					pw.print(dao.recommendCheck(email, boardNo));
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(cmd.equals("/Comment.board")) {
				String email = (String)request.getSession().getAttribute("loginEmail");
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				String comment = request.getParameter("comment");

				try {
					String name = mdao.selectByEmail(email).get(0);

					dao.insertComment(email, name, boardNo, comment);
					CommentDTO result = dao.selectCommentsByBoardNo(1, boardNo).get(0);
					Gson gson = new Gson();
					pw.print(gson.toJson(result));
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(cmd.equals("/DeleteComment.board")) {
				String email = (String)request.getSession().getAttribute("loginEmail");
				String writeDate = request.getParameter("writeDate");

				int result = dao.deleteComment(email, writeDate);
				pw.print(result);
			}else if(cmd.equals("/ModifyComment.board")) {
				String email = (String)request.getSession().getAttribute("loginEmail");
				String comment = request.getParameter("comment");
				String writeDate = request.getParameter("writeDate");

				try {
					int result = dao.updateComment(email, comment, writeDate);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
