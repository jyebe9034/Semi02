package ncs.kh.limchang;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LimChart")
public class LimChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String barNum1 = request.getParameter("barNum");
		String barNum = barNum1+"%";
		String percentNum1 = request.getParameter("percentNum");
		int percentNum = Integer.parseInt(percentNum1);
		request.setAttribute("barNum", barNum);
		request.setAttribute("percentNum", percentNum);
		request.getRequestDispatcher("limChart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
