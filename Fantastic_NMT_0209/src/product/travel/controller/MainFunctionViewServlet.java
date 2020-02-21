package product.travel.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 작성자 : 신형철
 * 작성일 : 20200203
 * 작업내용 : 메인기능 뷰로이동하는 서블릿
 * 
 * 수정자 : 문보라 
 * 수정일 2020년 2월 6일
 * 수정내용 : view단에 뿌려줄 파라미터 변경 
 *
 */
@WebServlet("/main/mainfunction")
public class MainFunctionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainFunctionViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//view단에 뿌려줄 파라미터값
		String depart = request.getParameter("depart");
		String arrive = request.getParameter("arrive");
		String days = request.getParameter("days");
		String price = request.getParameter("price");
		
		
		System.out.println(depart +", "+arrive +", "+days +", "+price);
		
		//view단
		request.setAttribute("depart", depart);
		request.setAttribute("arrive", arrive);
		request.setAttribute("days", days);
		request.setAttribute("price", price);
		request.getRequestDispatcher("/WEB-INF/views/travelpackage/mainfunction.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}