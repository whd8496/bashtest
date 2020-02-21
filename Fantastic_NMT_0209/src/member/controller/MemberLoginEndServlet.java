package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
/**
 * @author Minhee
	만든날짜 : 200203
	목적 : 로그인완료 / 세션 / 쿠키
 *
 */

@WebServlet("/member/memberLoginEndServlet")
public class MemberLoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberLoginEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터핸들링
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
//		System.out.println("memberId@servlet="+memberId);
//		System.out.println("password@servlet="+password);
		
		//업무로직
		//a. 로그인 성공
		//b. 로그인 실패: 비밀번호 오류
		//c. 로그인실패: 존재하지 않는 아이디
		
		Member m = new MemberService().selectOne(memberId);
//		System.out.println("member@controller="+m);
		
		String msg = "";
		String loc = "/WEB-INF/views/member/memberLogin.jsp";
		
		if(m != null) {
			//a. 로그인 성공
			if(password.equals(m.getPassword())) {
				msg = "로그인 성공!";
				
			HttpSession session = request.getSession();
			
			Member memberLoggedIn = m;
			session.setAttribute("memberLoggedIn", memberLoggedIn);
			
			//로그인한 사용자 세션객체 타임아웃 설정 (30분)
			session.setMaxInactiveInterval(60 * 30);
			
			/////////////////////쿠키 설정하고 아이디저장
			String saveId = request.getParameter("saveId");
			System.out.println("saveId@servlet="+saveId);
			
			Cookie c = new Cookie("saveId", memberId);
			c.setPath("/"); //도메인 전역에서 쿠키 사용
			if(saveId != null) { //아이디 저장에 체크한 경우
				c.setMaxAge(7 * 24 * 60 * 60); //7일 영속쿠키
			}
			else { //아이디 저장에 체크해제한 경우
				c.setMaxAge(0); //세션쿠키
			}
			response.addCookie(c);
			
			//로그인 후 홈페이지로 리다이렉트
			response.sendRedirect(request.getContextPath());
			
			//사용자가 있었던 페이지로 리다이렉트 --> 입력안한 로그인폼으로 돌아가버림.
//			String referer = request.getHeader("Referer");
//			System.out.println("referer="+referer);
//			response.sendRedirect(referer);
			
			return;
			}
			//b. 로그인 실패
			else {
				msg = "비밀번호가 틀렸습니다.";
			}
		}
		//2.c. memberId가 존재하지 않는 경우
		else {
			msg = "존재하지 않는 아이디입니다.";
		}
		System.out.println("msg="+msg);
		
		//view단 처리
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(loc)
				.forward(request, response);
		
//		RequestDispatcher reqDispatcher
//			= request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
//		reqDispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
