package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * @author Minhee
 * 생성날짜 : 200206
 * 생성목적 : 탈퇴버튼을 누른 회원 삭제하기 서블릿
 *
 */
@WebServlet(urlPatterns = "/member/deleteMember", name = "MemberDeleteServlet")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파라미터 핸들링
		String memberId = request.getParameter("memberId");
		
		//서비스로직 호출
		Member m = memberService.selectOne(memberId);
//		System.out.println("memberDelete@servlet="+m); 
		
		String msg = "";
		String loc = "/";
		String view = "/WEB-INF/views/common/msg.jsp";
		int result = 0;
		
		if(m != null) {
			result = memberService.deleteMember(m);
			if(result > 0) {
				msg = "탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.";
				
				//로그아웃상태 만들기 
				HttpSession session = request.getSession(false);
				
				if(session != null) session.invalidate();
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view)
			   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
