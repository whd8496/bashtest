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
 * @author 신형철
 * 작성일 : 20200206
 * 내용 : 새로운멤버 insert 후 MemberEnrollSuccess.jsp로 이동
 *
 */


@WebServlet("/member/memberEnrollEnd")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberEnrollEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("passwordChk");
		String memberName = request.getParameter("memberName");
		String address = request.getParameter("address");
		int birthdayyear = Integer.parseInt(request.getParameter("birthday1"));
		int birthdaymonth = Integer.parseInt(request.getParameter("birthday2"));
		int birthdayday = Integer.parseInt(request.getParameter("birthday3"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String month = "";
		String birthday = "";
		
		if(birthdaymonth<10) {
			month = "0"+birthdaymonth;
		}else {
			month = ""+birthdaymonth;
		}
		
		birthday = birthdayyear+"-"+month+"-"+birthdayday;
		Date d = Date.valueOf(birthday);
		System.out.println("birthday@servlet="+d);
		
		Member m = new Member(0, memberId, password, phone, email, address, null, 0, d, memberName);
		
		int result = new MemberService().memberInsert(m);
		String msg = "";
		String loc = "";
		
		if(result > 0) {
			request.getRequestDispatcher("/WEB-INF/views/member/memberEnrollSuccess.jsp").forward(request, response);
		}else {
			msg = "회원가입에 실패했습니다.";
			loc = "/member/memberEnrollView";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
