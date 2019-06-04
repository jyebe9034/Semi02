package kh.semi.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.dao.ManagerDAO;
import kh.semi.dto.BoardDTO;
import kh.semi.dto.BoardDTO2;
import kh.semi.dto.MemberDTO2;
import kh.semi.dto.PaymentDTO;
import kh.semi.dto.TimePersonCountDTO;
import kh.semi.scheduler.TimeVisiterCount;

@WebServlet("*.manager")
public class managerController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter write = response.getWriter();
		
			
		String requestURI = request.getRequestURI();
		String comtextPath = request.getContextPath();
		String cmd = requestURI.substring(comtextPath.length());
		ManagerDAO dao = new ManagerDAO();

		if (cmd.equals("/bar.manager")) {
			int visitPersonCount;
			String totalMoney;
			int nowingProjectCount;
			int joinMemberCount;
			List<TimePersonCountDTO> line = new ArrayList<>();
			List<BoardDTO> pie = new ArrayList<>();
			List<Object> bestRecommendCount = new ArrayList<>();
			List<Object> worstRecommendCount = new ArrayList<>();
			List<Object> bestViewCount = new ArrayList<>();
			List<Object> worstViewCount = new ArrayList<>();
			List<PaymentDTO> donationManyPeople = new ArrayList<>();
			List<MemberDTO2> memberInfo = new ArrayList<>();
			List<BoardDTO2> totalDonationProject = new ArrayList<>();
			try {
				visitPersonCount = dao.visitPersonCount();
				totalMoney = dao.totalMoney();
				nowingProjectCount = dao.nowingProjectCount();
				joinMemberCount = dao.joinMemberCount();
				line = dao.timePersonCount();
				pie = dao.recommendTopFour();
				bestRecommendCount = dao.bestRecommendCount();
				worstRecommendCount = dao.worstRecommendCount();
				bestViewCount = dao.bestViewCount();
				worstViewCount = dao.worstViewCount();
				donationManyPeople = dao.donationTopThree();
				memberInfo = dao.memberInfo();
				totalDonationProject = dao.totalDonationProject();
				request.setAttribute("visitPersonCount", visitPersonCount);
				request.setAttribute("totalMoney", totalMoney);
				request.setAttribute("nowingProjectCount", nowingProjectCount);
				request.setAttribute("joinMemberCount", joinMemberCount);
				request.setAttribute("line", line);
				request.setAttribute("pie", pie);
				request.setAttribute("bestRecommendCount", bestRecommendCount);
				request.setAttribute("worstRecommendCount", worstRecommendCount);
				request.setAttribute("bestViewCount", bestViewCount);
				request.setAttribute("worstViewCount", worstViewCount);
				request.setAttribute("donationManyPeople", donationManyPeople);
				request.setAttribute("memberInfo", memberInfo);
				request.setAttribute("totalDonationProject", totalDonationProject);
				request.getRequestDispatcher("manager.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}