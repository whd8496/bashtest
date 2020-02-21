package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * @author Minhee
 * 생성날짜 : 202005
 * 생성목적 : nav의 mypage버튼 클릭시 내정보보기창으로 이동
 */
@WebServlet(urlPatterns = "/member/memberPageView", name = "MemberPageViewServlet")
public class MemberPageViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPageViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터핸들링
		String memberId = request.getParameter("memberId");
		System.out.println("memberId@servlet="+memberId);
		//업무처리
		Member m = new MemberService().selectOne(memberId);
		//view단으로 ~
		String view = "";
		
//		if(m != null) {
			view = "/WEB-INF/views/member/memberMypage.jsp";
			request.setAttribute("member", m);
			System.out.println("member@sevlet="+m);
//		}
//		else {
//			view = "/WEB-INF/views/common/msg.jsp";
//			String loc = "/";
//			String msg = "해당 회원은 존재하지 않습니다.";
//			request.setAttribute("msg", msg);
//			request.setAttribute("loc", loc);
//		}
		
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
