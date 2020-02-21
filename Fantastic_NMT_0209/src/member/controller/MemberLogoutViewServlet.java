package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * @author Minhee
	만든날짜 : 200203
	목적 : 로그아웃서블릿 (세션무효화)
 *
 */
@WebServlet("/member/memberLogoutView")
public class MemberLogoutViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogoutViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//해당 세션이 존재하면, 그 세션을 리턴하고, 존재하지 않으면 null을 리턴 
				HttpSession session = request.getSession(false);
				
				//세션이 존재하는 경우, 무효화처리함.
				//세션에 속성으로 담긴 값도 무효화됨.
				if(session != null) session.invalidate();
				
				response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
