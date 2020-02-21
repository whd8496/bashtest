package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
/**
 * @author Minhee
 * 생성날짜 : 200205
 * 생성목적 : mypage에서 정보수정페이지로 넘어가는 서블릿
 */
@WebServlet(urlPatterns = "/member/memberUpdateView", name = "MemberUpdateViewServlet")
public class MemberUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		
		Member m = new MemberService().selectOne(memberId);
		
		String view = "";
		
		if(m != null) {
			view = "/WEB-INF/views/member/memberUpdate.jsp";
			request.setAttribute("member", m);
			System.out.println("member@sevlet="+m);
		}
		else {
			view = "/WEB-INF/views/common/msg.jsp";
			String loc = "/";
			String msg = "해당 회원은 존재하지 않습니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		
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
