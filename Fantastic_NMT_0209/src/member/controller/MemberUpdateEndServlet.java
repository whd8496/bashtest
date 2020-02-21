package member.controller;

import java.io.IOException;
import java.sql.Date;

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
 * 생성목적 : 정보수정버튼 클릭시 DB까지갔다와서 jsp에 반영
 *
 */
@WebServlet(urlPatterns = "/member/updateMemberEnd")
public class MemberUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 핸들링
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String address = request.getParameter("address");
		//jsp에서 받은 년/월/일 Date로 바꿔주기
		String birthDay = request.getParameter("birthday1")+"-"+request.getParameter("birthday2")+"-"+request.getParameter("birthday3");
		Date birth = Date.valueOf(birthDay);
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		
		
		
//		String password_new = request.getParameter("password_new");
		
		
		//서비스로직 호출
		Member m = memberService.selectOne(memberId);
		//updateMember()로 가기 전 jsp에서 받은 값 member에 set해주기
		m.setMemberName(memberName);
		m.setAddress(address);
		m.setBirthDay(birth);
		m.setEmail(email);
		m.setPhone(phone);
		
		//view단 처리
		String msg = "";
		String loc = "/member/memberUpdateView?memberId="+m.getMemberId();
		String view = "/WEB-INF/views/common/msg.jsp";
		int result = 0;
		System.out.println("DAO갔다오기 전 servlet="+m);
		
		//memberUpdate.jsp에서 비밀번호가 맞는지 검사했음
		if(m != null) {
			result = memberService.updateMember(m);
			System.out.println("updateMember@servlet="+m);
			if(result > 0) {
				msg = "입력하신대로 정보수정 되었습니다.";
				
				//팝업창을 닫기 위해
//				String script = "self.close();";
//				request.setAttribute("script", script);
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
