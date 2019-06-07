package kh.semi.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.dao.BoardDAO;
import kh.semi.dao.MemberDAO;
import kh.semi.dao.PaymentDAO;
import kh.semi.dto.BoardDTO;
import kh.semi.dto.MemberDTO;
import kh.semi.dto.TitleImgDTO;
import kh.semi.scheduler.TimeVisiterCount;

@WebServlet("*.members")
public class MembersController extends HttpServlet {
	public static int visitPerson;
	public static int timePerson;
	public static int oneStart;
	public static int count;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");


		if(oneStart<1) {
			oneStart++;
			TimeVisiterCount visiterCount = new TimeVisiterCount();
			Timer timer1 = new Timer();
			Calendar date1 = Calendar.getInstance();
			date1.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			date1.set(Calendar.AM_PM, Calendar.PM);
			date1.set(Calendar.HOUR, 0);
			date1.set(Calendar.MINUTE, 0);
			date1.set(Calendar.SECOND, 0);
			date1.set(Calendar.MILLISECOND, 0);
			timer1.schedule(visiterCount,1000,1000*10);//60초마다 저장
			System.out.println("10초마다");

		}

		PrintWriter printWriter = response.getWriter();
		String reqUri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqUri.substring(ctxPath.length());
		MemberDAO dao = new MemberDAO();
		BoardDAO bdao = new BoardDAO();
		PaymentDAO pdao = new PaymentDAO();

		System.out.println(cmd);

		if (cmd.equals("/First.members")) {
			visitPerson++;
			timePerson++;
			request.getRequestDispatcher("Main.members").forward(request, response);;
		}
		else if (cmd.equals("/Main.members")) {
			request.getServletContext().setAttribute("visitPerson", visitPerson);
			request.getServletContext().setAttribute("timePerson", timePerson);
			List<BoardDTO> list;
			try {
				list = bdao.getDataForMain();

				request.setAttribute("list", list);
				request.setAttribute("listSize", list.size());
				String[] strArr = new String[3];
				int[] intArr = new int[3];		
				List<TitleImgDTO> imgList = new ArrayList<>();
				for(int i = 0; i < list.size(); i++) {
					int goalAmount = list.get(i).getAmount();
					Timestamp dueDate = list.get(i).getDueDate();
					long dueTime = dueDate.getTime();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					strArr[i] = sdf.format(dueTime);
					int sumAmount = list.get(i).getSumAmount();
					intArr[i] = (int)Math.floor((double)sumAmount / goalAmount * 100);
					imgList.add(bdao.getTitleImg(list.get(i).getBoardNo()));
				}
				request.setAttribute("duedate", strArr);
				request.setAttribute("percentage", intArr);

				String[] imgSrc = new String[3];
				for(int i=0; i < imgList.size(); i++) {
					String str = imgList.get(i).getFilePath();
					//					String result = str.replaceAll("D:.+?mi.+?mi.+?",""); 재용오빠꺼
					//					String result = str.replaceAll("D:.+?Project.+?Project.+?",""); 해용이꺼
//					String result = str.replaceAll("D.+?3.+?","");
					//String result = str.replaceAll("D.+?3.+?", "");
					String result = str.replaceAll("D:.+?mi.+?",""); //슬기
					imgSrc[i] = result + "/" + imgList.get(i).getFileName();
				}

				request.setAttribute("imgSrc", imgSrc);
				
				int totalAmount = pdao.getTotalAmount();
				int countDonors = pdao.getNumberOfDonors();
				request.setAttribute("totalAmount", totalAmount);
				request.setAttribute("countDonors", countDonors);

				request.getRequestDispatcher("/WEB-INF/basics/main.jsp").forward(request, response);

			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(cmd.equals("/Introduce.members")) {
			request.getRequestDispatcher("/WEB-INF/basics/introduce.jsp").forward(request, response);

		}else if (cmd.equals("/JoinForm.members")) {
			request.getRequestDispatcher("/WEB-INF/basics/joinForm.jsp").forward(request, response);

		} else if (cmd.equals("/EmailDuplCheck.members")) {
			String email = request.getParameter("email");
			try {
				boolean result = dao.emailDuplCheck(email);
				printWriter.print(result);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (cmd.equals("/SendMail.members")) {
			String email = request.getParameter("email");
			try {
				int ranNum = dao.sendMail(email);
				printWriter.print(ranNum);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (cmd.equals("/Join.members")) {
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String zipCode = request.getParameter("zip");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");

			MemberDTO dto = new MemberDTO(email, pw, name, phone, zipCode, address1, address2, null, request.getRemoteAddr(), "n");
			try {
				int result = dao.insertMember(dto);
				request.setAttribute("result", result);
				request.getRequestDispatcher("/WEB-INF/basics/alertJoin.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(cmd.contentEquals("/LoginForm.members")) {
			request.getRequestDispatcher("/WEB-INF/basics/loginForm.jsp").forward(request, response);

		} else if (cmd.equals("/Login.members")) {
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			try {
				boolean result = dao.isLoginOk(email, pw);
				if (result) {
					request.getSession().setAttribute("loginEmail", email);
					String admin = dao.managerOrVisiter(email);
					if(admin.equals("y")) {
						request.getSession().setAttribute("admin", admin);
						System.out.println(admin);
					}
				}
				request.setAttribute("result", result);
				request.getRequestDispatcher("/WEB-INF/basics/alertLogin.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (cmd.equals("/Logout.members")) {
			request.getSession().invalidate();
			request.getRequestDispatcher("/WEB-INF/basics/alertLogout.jsp").forward(request, response);

		} else if (cmd.equals("/naverLogin.members")) {
			String clientId = "9fcJ6ehu7V7mEFnBQABz";// 애플리케이션 클라이언트 아이디값";
			String clientSecret = "otERPitybs";// 애플리케이션 클라이언트 시크릿값";
			String code = request.getParameter("code");
			String state = request.getParameter("state");
			String redirectURI = URLEncoder.encode("http://localhost/naverLogin.members", "UTF-8");
			String apiURL;
			apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			apiURL += "client_id=" + clientId;
			apiURL += "&client_secret=" + clientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + code;
			apiURL += "&state=" + state;
			String access_token = "";
			String refresh_token = "";
			try {
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				int responseCode = con.getResponseCode();
				BufferedReader br;
				System.out.print("responseCode=" + responseCode);
				if (responseCode == 200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					res.append(inputLine);
				}
				br.close();
				if (responseCode == 200) {	// 네이버 로그인 성공!
					String ip = request.getRemoteAddr();
					MemberDTO dto = dao.NaverContentsParse(res.toString(), ip);

					String email = dto.getEmail();
					request.getSession().setAttribute("loginEmail", email);
					request.setAttribute("result", "true");

					if (!dao.isIdExist(email)){	// 처음 로그인 하는 경우
						dao.insertNaverMember(dto);
					}

					request.getRequestDispatcher("/WEB-INF/basics/alertLogin.jsp").forward(request, response);
				}
			} catch (Exception e) {
				System.out.println(e);
				e.printStackTrace();
				response.sendRedirect("error.html");
			}

		}else if(cmd.equals("/kakaoLogin.members")) {
			String nickname = request.getParameter("contents");
			String ip = request.getRemoteAddr();

			String[] contents = nickname.split(",");

			String id = "k_"+contents[0];
			String nickName = contents[1];

			System.out.println(id + " : " + nickName + " : "+ ip);

			MemberDTO dto = new MemberDTO();
			dto.setIpAddress(ip);
			dto.setEmail(id);
			dto.setName(nickName);
			dto.setJoinDate(null);
			dto.setAdmin(null);

			try {
				if (!dao.isIdExist(id)){ // 카카오 로그인을 처음한 경우
					dao.insertNaverMember(dto);
				}
				request.getSession().setAttribute("loginEmail", id);
				request.setAttribute("result", "true");
				request.getRequestDispatcher("/WEB-INF/basics/alertLogin.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(cmd.equals("/myPageUpdate.members")) {

			String phone = request.getParameter("phone");
			String pw = dao.testSHA256(request.getParameter("pw"));
			String zipcode = request.getParameter("zipcode");
			String add1 = request.getParameter("address1");
			String add2 = request.getParameter("address2");
			String email = (String)request.getSession().getAttribute("loginEmail");

			MemberDTO dto = new MemberDTO();

			dto.setPhone(phone);
			dto.setPw(pw);
			dto.setZipCode(zipcode);
			dto.setAddress1(add1);
			dto.setAddress2(add2);
			dto.setEmail(email);

			try {
				int result = dao.updateContents(dto);
				request.getSession().setAttribute("result", result);
				request.getRequestDispatcher("/WEB-INF/basics/myPageUpdateView.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.html");
			}


		}else if(cmd.equals("/myPageUpdateForNaver.members")) {

			String phone = request.getParameter("phone");
			String zipcode = request.getParameter("zipcode");
			String add1 = request.getParameter("address1");
			String add2 = request.getParameter("address2");

			MemberDTO contents = (MemberDTO)request.getSession().getAttribute("navercontents");
			MemberDTO aftercontents = (MemberDTO)request.getSession().getAttribute("realcontents");


			if(contents==null) {
				String naverandkakaoEmail = aftercontents.getEmail();

				MemberDTO dto = new MemberDTO();

				dto.setPhone(phone);
				dto.setZipCode(zipcode);
				dto.setAddress1(add1);
				dto.setAddress2(add2);
				dto.setEmail(naverandkakaoEmail);

				try {
					int result = dao.updateContentsForNaver(dto);
					request.getSession().setAttribute("result", result);
					request.getRequestDispatcher("/WEB-INF/basics/myPageUpdateView.jsp").forward(request, response);

				} catch (Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
			}else {
				String naverandkakaoEmail = contents.getEmail();

				System.out.println(naverandkakaoEmail);

				MemberDTO dto = new MemberDTO();

				dto.setPhone(phone);
				dto.setZipCode(zipcode);
				dto.setAddress1(add1);
				dto.setAddress2(add2);
				dto.setEmail(naverandkakaoEmail);

				try {
					int result = dao.updateContentsForNaver(dto);
					request.getSession().setAttribute("result", result);
					request.getRequestDispatcher("/WEB-INF/basics/myPageUpdateView.jsp").forward(request, response);

				} catch (Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.html");
				}
			}

		}else if(cmd.equals("/myPageUpdateComplete.members")) {

			request.getSession().invalidate();
			request.getRequestDispatcher("/WEB-INF/basics/loginForm.jsp").forward(request, response);

		}else if(cmd.equals("/myPage.members")) {

			String email = (String)request.getSession().getAttribute("loginEmail");
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int currentPage2 = Integer.parseInt(request.getParameter("currentPage2"));
			
			try {
				request.setAttribute("getNavi", dao.getNaviforMySupport(currentPage, email));
				//					request.setAttribute("myDonateContents", dao.myDonateContents(email, currentPage));

				request.setAttribute("getNavi2", dao.getNaviforMySupport2(currentPage2, email));
				//					request.setAttribute("myDonateContents2", dao.myDonateContents2(email, currentPage2));
				MemberDTO dto = dao.getContents(email);
				request.setAttribute("dto",dto);
				request.getRequestDispatcher("/WEB-INF/basics/myPage.jsp").forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(cmd.equals("/myPageUpdateLocation.members")){
			String email = (String)request.getSession().getAttribute("loginEmail");
			try {
				MemberDTO dto = dao.getContents(email);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/WEB-INF/basics/myPageUpdate.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(cmd.equals("/myPageUpdateLocationForNaver.members")) {
			request.getRequestDispatcher("/WEB-INF/basics/myPageUpdateForNaver.jsp").forward(request, response);
		}


	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
