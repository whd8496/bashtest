package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 작성자:신형철
 * 작성일자:20200203
 * 내용:Login페이지View단
 *
 */

@WebServlet("/member/memberEnrollView")
public class MemberEnrollViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberEnrollViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/member/memberEnroll.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
