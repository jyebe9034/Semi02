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
import kh.semi.dao.TitleImgDAO;
import kh.semi.dto.BoardDTO;
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

		MemberDAO mdao = new MemberDAO();
		BoardDAO dao = new BoardDAO();
		PaymentDAO pdao = new PaymentDAO();
		TitleImgDAO tdao = new TitleImgDAO();
		BoardDTO dto = new BoardDTO();
		TitleImgDTO tdto = new TitleImgDTO();

		try {
			if(cmd.contentEquals("/titleImagesMain.board")) {
//				List<BoardDTO> list1 = dao.getDataForMain();
//				int bNo1 = list1.get(0).getBoardNo();
//				int bNo2 = list1.get(1).getBoardNo();
//				int bNo3 = list1.get(2).getBoardNo();
//				
//				List<TitleImgDTO> list2 = tdao.getTitleImgMain(bNo1, bNo2, bNo3);
//				String fName1 = list2.get(0).getFileName();
//				String fPath1 = list2.get(0).getFilePath();
//				String imgTag1 = fPath1 + fName1;
//				
//				String fName2 = list2.get(1).getFileName();
//				String fPath2 = list2.get(1).getFilePath();
//				String imgTag2 = fPath2 + fName2;
//				
//				String fName3 = list2.get(2).getFileName();
//				String fPath3 = list2.get(2).getFilePath();
//				String imgTag3 = fPath3 + fName3;
				
			}else if(cmd.contentEquals("/card1.board")) {
				List<BoardDTO> list = dao.getDataForMain();
							
				String title1 = list.get(0).getTitle();
				int goalAmount1 = list.get(0).getAmount();
				
				Timestamp dueDate1 = list.get(0).getDueDate();
				long dueTime1 = dueDate1.getTime();
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				String dueDateStr1 = sdf1.format(dueTime1);
				
				int sumAmount1 = list.get(0).getSumAmount();
				double percentage1 = Math.floor((double)sumAmount1 / goalAmount1 * 100);
				// 마감 임박 1

				JsonObject obj1 = new JsonObject();
				obj1.addProperty("title1", title1);
				obj1.addProperty("dueDate1",dueDateStr1);
				obj1.addProperty("percentage1",percentage1);
				pw.print(obj1.toString());
			}else if(cmd.contentEquals("/card2.board")) {
				List<BoardDTO> list = dao.getDataForMain();
				
				String title2 = list.get(1).getTitle();
				int goalAmount2 = list.get(1).getAmount();
				Timestamp dueDate2 = list.get(1).getDueDate();
				long dueTime2 = dueDate2.getTime();
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
				String dueDateStr2 = sdf2.format(dueTime2);
				int sumAmount2 = list.get(1).getSumAmount();
				double percentage2 = Math.floor((double)sumAmount2 / goalAmount2 * 100);
				 // 마감 임박2
				
				JsonObject obj2 = new JsonObject();
				obj2.addProperty("title2", title2);
				obj2.addProperty("dueDate2",dueDateStr2);
				obj2.addProperty("percentage2",percentage2);
				pw.print(obj2.toString());
			}else if(cmd.contentEquals("/card3.board")) {
				List<BoardDTO> list = dao.getDataForMain();
				
				String title3 = list.get(2).getTitle();
				int goalAmount3 = list.get(2).getAmount();
				Timestamp dueDate3 = list.get(2).getDueDate();
				long dueTime3 = dueDate3.getTime();
				SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
				String dueDateStr3 = sdf3.format(dueTime3);
				int sumAmount3 = list.get(2).getSumAmount();
				double percentage3 = Math.floor((double)sumAmount3 / goalAmount3 * 100);
				 // 마감 임박 3
				
				JsonObject obj3 = new JsonObject();
				obj3.addProperty("title3", title3);
				obj3.addProperty("dueDate3",dueDateStr3);
				obj3.addProperty("percentage3",percentage3);
				pw.print(obj3.toString());
			}else if(cmd.contentEquals("/totalAmountDonors.board")) {
				
				int totalAmount = pdao.getTotalAmount();
				int countDonors = pdao.getNumberOfDonors();
				
				JsonObject obj = new JsonObject();
				obj.addProperty("totalAmount", totalAmount);
				obj.addProperty("countDonors", countDonors);
				pw.print(obj.toString());

			}else if(cmd.contentEquals("/write.board")) {
				request.getRequestDispatcher("/writer.jsp").forward(request, response);
				
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
					
					dto.setTitle(multi.getParameter("title"));
					dto.setWriter(multi.getParameter("writer"));
					dto.setAmount(Integer.parseInt(multi.getParameter("amount")));
					String duedate = multi.getParameter("dueDate") + " " + sdf.format(currentTime);
					dto.setDueDate(Timestamp.valueOf(duedate));
					dto.setBank(multi.getParameter("select"));
					dto.setAccount(multi.getParameter("account"));
					dto.setContents(multi.getParameter("contents"));
					try {
						int result = dao.insertBoard(dto);
						System.out.println("result : "+result);
					}catch(Exception e) {
						e.printStackTrace();
					}
					int result = dao.insertTitleImg(tdto);
					System.out.println("titleresult : " + result);
				}catch(Exception e) {
					e.printStackTrace();
				}
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
				System.out.println("test : " + test);
				if(test.equals("false")) {
					String rootPath = this.getServletContext().getRealPath("/");
					String fileUrl = request.getParameter("src");
					System.out.println("fileUrl : " + fileUrl);
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
				int commentPage = Integer.parseInt(request.getParameter("commentPage"));
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				BoardDTO article = dao.selectOneArticle(boardNo);
				List<CommentDTO> comments = dao.selectCommentsByBoardNo(commentPage, boardNo);
				
				double amount = article.getAmount();
				double sumAmount = article.getSumAmount();
				double percentage = Math.floor((double)sumAmount / amount * 100);

//				TitleImgDTO titleImg = dao.getTitleImg(boardNo);
				//				response.setCharacterEncoding("UTF-8");
				//				request.setCharacterEncoding("UTF-8");
				//				request.setAttribute("titleImg", "files\\" + titleImg.getFileName());
				//				System.out.println("files\\" + titleImg.getFileName());

				DecimalFormat Commas = new DecimalFormat("#,###,###");

				request.setAttribute("comments", comments);
				request.setAttribute("percentage", percentage);
				request.setAttribute("boardNo", boardNo);
				request.setAttribute("amount", Commas.format(amount));
				request.setAttribute("sumAmount", Commas.format(sumAmount));
				request.setAttribute("result", article);

				request.getRequestDispatcher("read.jsp").forward(request, response);

			}else if(cmd.equals("/PaymentForm.board")){
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				String title = dao.selectOneArticle(boardNo).getTitle();

				String email = (String)request.getSession().getAttribute("loginEmail");
				List<String> result = mdao.selectByEmail(email);
				request.setAttribute("boardNo", boardNo);
				request.setAttribute("title", title);
				request.setAttribute("result", result);
				request.getRequestDispatcher("payment.jsp").forward(request, response);
				
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
					request.setAttribute("payment", dto);
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
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
				try {
					String name = mdao.selectByEmail(email).get(0);
					
					dao.insertComment(email, name, boardNo, comment);
					CommentDTO result = dao.selectCommentsByBoardNo(currentPage, boardNo).get(0);
					Gson gson = new Gson();
					pw.print(gson.toJson(result));
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(cmd.equals("/DeleteComment.board")) {
				String email = (String)request.getSession().getAttribute("loginEmail");
				String writeDate = request.getParameter("writeDate");
				System.out.println(email + " : " + writeDate);
				
				int result = dao.deleteComment(email, writeDate);
				System.out.println(result);
				pw.print(result);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
