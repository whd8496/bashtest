package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
/**
 * @author 신형철
 * 작성일 : 20200205
 * 내용 : 회원가입 ajax(keyup)을 이용한 유효성검사 
 *
 */
@WebServlet("/enroll/EnrollDuplicate.do")
public class MemberDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDuplicateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String msg = "";
		
		Member m = new MemberService().selectOne(memberId);
		
		if(m != null) {
			msg = "이미 사용중인 아이디입니다.";
		}else {
			msg = "사용가능한 아이디입니다.";
		}
	
		response.setContentType("text/csv; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(msg.toString());
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
