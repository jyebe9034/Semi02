package kh.semi.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileExistsException;

import kh.semi.dao.BoardDAO;
import kh.semi.dao.PaymentDAO;
import kh.semi.dao.TitleImgDAO;
import kh.semi.dto.BoardDTO;
import kh.semi.dto.PaymentDTO;
import kh.semi.dto.TitleImgDTO;
import kh.semi.dto.UfileDTO;


@WebServlet("*.board")
public class BoardController extends HttpServlet {	
	private int fileIdNo = 1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		String requestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath();

		String cmd = requestURI.substring(contextPath.length());
		BoardDAO dao = new BoardDAO();
		PaymentDAO pdao = new PaymentDAO();
		TitleImgDAO tdao = new TitleImgDAO();
		
		try {
			if(cmd.contentEquals("/write.board")) {
				request.getRequestDispatcher("/WEB-INF/boards/writer.jsp").forward(request, response);
			}else if(cmd.contentEquals("/supportMe.board")) {
				String rootPath = this.getServletContext().getRealPath("/");	
				String filePath = rootPath + "files";	

				File uploadPath = new File(filePath);
				if(!uploadPath.exists()) {
					uploadPath.mkdir();	
				}

				System.out.println(rootPath);

				DiskFileItemFactory diskFactory = new DiskFileItemFactory();		
				diskFactory.setRepository(new File(rootPath + "/WEB-INF/temp"));   

				ServletFileUpload sfu = new ServletFileUpload(diskFactory);
				sfu.setSizeMax(10 * 1024 * 1024); 

				BoardDTO boardDTO = new BoardDTO();
				try {
					List<FileItem> items = sfu.parseRequest(request);		
					for(FileItem fi : items) {
						if(fi.getSize()==0) {continue;}

						if(fi.isFormField()) {
							
							if(fi.getFieldName().contentEquals("title")) {
								boardDTO.setTitle(fi.getString());
							}else if(fi.getFieldName().contentEquals("writer")) {
								boardDTO.setWriter(fi.getString());
							}else if(fi.getFieldName().contentEquals("amount")) {
								boardDTO.setAmount(Integer.parseInt(fi.getString()));
							}else if(fi.getFieldName().contentEquals("select")) {
								boardDTO.setBank(fi.getString());
							}else if(fi.getFieldName().contentEquals("account")) {
								boardDTO.setAccount(fi.getString());
							}else if(fi.getFieldName().contentEquals("mycontent")) {
								boardDTO.setContents(fi.getString());
								System.out.println(fi.getString());
							}
							
						}else {	
							//	
							UfileDTO dto = new UfileDTO();
							dto.setOriFileName(fi.getName());
							//					dto.setFileName(tempFileName);
							dto.setFileSize(fi.getSize());
							dto.setFilePath(filePath);

							String tempFileName = null;
							while(true) {
								try {
									long tempTime = System.currentTimeMillis();
									tempFileName = tempTime+"_"+fi.getName();
									fi.write(new File(filePath+"/"+tempFileName));
									dto.setFileName(tempFileName);
									break;
								}catch(Exception e) {
									System.out.println("rename file");
								}
							}
							response.setCharacterEncoding("UTF-8");
							response.getWriter().append("files/"+dto.getFileName());
							//							int result = dao.insert(dto);		

							try {
								fi.write(new File(filePath+"/"+tempFileName)); 
							}catch(FileExistsException f) {
								fi.write(new File(filePath+"/"+fileIdNo++ +"_"+tempFileName));
							}
						}
					}
					int result = dao.insertBoard(boardDTO);
					request.setAttribute("result", result);
					request.getRequestDispatcher("writer.jsp").forward(request, response);
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.jsp");
				}
			}else if(cmd.equals("/Read.board")) {
//				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
//				TitleImgDTO titleImg = tdao.getTitleImg(boardNo);
//				request.setAttribute("titleImg", titleImg.getFilePath());
				
//				BoardDTO article = dao.selectOneArticle(boardNo);
//				request.setAttribute("result", article);
				
				request.getRequestDispatcher("/WEB-INF/boards/read.jsp").forward(request, response);
				
			}else if(cmd.equals("/Payment.board")) {
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				int amount = Integer.parseInt(request.getParameter("amount"));
				
				try {
					PaymentDTO dto = new PaymentDTO(boardNo, name, email, phone, amount, null);
					int result = pdao.insertPayment(dto);
					request.setAttribute("result", result);
					request.setAttribute("payment", dto);
					request.getRequestDispatcher("/WEB-INF/boards/payCompleted.jsp").forward(request, response);
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
