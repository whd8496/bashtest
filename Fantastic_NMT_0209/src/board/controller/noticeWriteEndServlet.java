package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.noticeService;
import board.model.vo.Notice;

/**
 * Servlet implementation class noticeWriteEndServlet
 */
@WebServlet("/board/noticeWriteEnd")
public class noticeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 핸들링
		
		String boardTitle = request.getParameter("noticeTitle");
		String boardContent = request.getParameter("noticeContent");
		
		System.out.println(boardTitle);
		System.out.println(boardContent);
		
		Notice n = new Notice(0, 00000001, "A1", boardTitle, boardContent, null, null, null, 0);
		System.out.println("notice:before@servlet="+n);
		
		//2.업무로직
		int result = new noticeService().insertNotice(n);
		System.out.println("notice:after@servlet="+n);
		
		//3.뷰단 처리
		String msg = result>0?"게시글 등록 성공":"게시글 등록 실패";
		
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
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
