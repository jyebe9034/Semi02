package kh.semi.servlet;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
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

import kh.semi.dao.UfileDAO;
import kh.semi.dto.UfileDTO;

@WebServlet("*.fund")
public class FundController extends HttpServlet {
	private static int fileIdNo = 1;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter pw = response.getWriter();

		String reqUri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqUri.substring(ctxPath.length());
		
		UfileDAO dao = new UfileDAO();
		if(cmd.contentEquals("/to_write.fund")) {
			request.getRequestDispatcher("/WEB-INF/boards/write_supportme.jsp").forward(request, response);
		
		}else if(cmd.contentEquals("/supportme.fund")) {
			String title = request.getParameter("title");
			int goal_amount = Integer.parseInt(request.getParameter("goal_amount"));
			String end = request.getParameter("end_period");
			String bank = request.getParameter("bank");
			String account = request.getParameter("account");
	
//-----------			
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

			try {
				List<FileItem> items = sfu.parseRequest(request);		
				for(FileItem fi : items) {
					if(fi.getSize()==0) {continue;}

					if(fi.isFormField()) {
						System.out.println(fi.getFieldName()+ ":" + fi.getString());
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
						int result = dao.insert(dto);		

						try {
							fi.write(new File(filePath+"/"+tempFileName)); 
						}catch(FileExistsException f) {
							fi.write(new File(filePath+"/"+fileIdNo++ +"_"+tempFileName));
						}
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
			// 사진 받기

			
		}else if(cmd.contentEquals("/show.fund")) {
			try {
				List<UfileDTO> filelist = dao.show();
				System.out.println(filelist);
				request.setAttribute("filelist", filelist);
				request.getRequestDispatcher("file_list.jsp").forward(request, response);

			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
		}else if(cmd.contentEquals("/download.fund")) {
			try {
				int seq = Integer.parseInt(request.getParameter("seq"));
				UfileDTO dto = dao.selectBySeq(seq);
				// response �쓽 湲곕낯媛�(html) �쓣 吏��슦怨� �뙆�씪�엯�땲�떎. �씪怨� �뜥 以섏빞 �뤌
				response.reset();
				response.setContentType("application/octet-stream"); 	// �궡媛� 吏�湲� 蹂대궡�뒗 嫄� �뙆�씪�쓽 byte[] �엯�땲�떎. response �쓽 header 遺�遺꾩뿉 �엯�젰�븯�뒗 �궡�슜

				String fileName = new String(dto.getOriFileName().getBytes("utf8"),"ISO-8859-1");	// �떎�슫濡쒕뱶 �뙆�씪 �씠由꾩씠 �븳湲��씠�뼱�꽌 源⑥��뒗 寃쎌슦 

				response.setHeader("Content-Disposition", "attachement; filename=\"" + dto.getOriFileName()+ "\"");
				response.setHeader("Content-Length",String.valueOf(dto.getFileSize()));

				File target = new File(dto.getFilePath()+"/"+dto.getFileName());
				byte[] fileContents = new byte[(int)target.length()];
				try(
						DataInputStream fromFile = new DataInputStream(new FileInputStream(target));
						DataOutputStream toClient = new DataOutputStream(response.getOutputStream());	// dataoutputstream �� response媛� 媛뽮퀬 �엳�뒗嫄곗빞.
						){
					fromFile.readFully(fileContents);
					toClient.write(fileContents);
					toClient.flush();

				}

			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
		}
	}
//	double percentage = Math.floor((double)1446000 / 2000000 * 100);
//	//		System.out.println(percentage);
//
//	pw.print(percentage);
//	request.setAttribute("percentage", percentage);
//	request.getRequestDispatcher("main.jsp").forward(request, response);



protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doGet(request, response);
}

}
