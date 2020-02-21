<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member"%>
<%
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
%>
	 <nav>
        <div class="nav_bar"></div>
        <div class="nav_wrap">
            <div class="nav_content">
                <img src="<%=request.getContextPath() %>/images/main/logo.png" class="logo" 
                onclick="location.href='<%=request.getContextPath()%>/'">
                <div class="left_select">
                    <ul>
                        <li id="searchli">search</li>
                        <li id="noticeli" onclick="location.href='<%=request.getContextPath()%>/board/noticeList'">notice</li>
                        <li id="reviewli">review</li>
                    </ul>
                </div>
               <% if(memberLoggedIn == null) { %>
                <%-- 로그인 하지 않은 경우 --%>
                <div class="rigth_select">
                    <input type="button" id="btn_login" value="LOGIN" onclick="location.href='<%=request.getContextPath()%>/member/memberLoginView'">
                    <input type="button" id="btn_join" value="JOIN" onclick="location.href='<%=request.getContextPath()%>/member/memberEnrollView'">
                </div>
                <% } else { %>
                <%-- 로그인한 경우 --%>
                <div class="rigth_select">
                	<%-- <p><%=memberLoggedIn.getMemberName() %>님</p> --%>
                    <input type="button" id="btn_login" value="LOGOUT" onclick="location.href='<%=request.getContextPath()%>/member/memberLogoutView'">
                    <input type="button" id="btn_join" value="MYPAGE" onclick="location.href='<%=request.getContextPath()%>/member/memberPageView?memberId=<%=memberLoggedIn.getMemberId()%>'">
                </div>
                <% } %>
            </div>
        </div>
    </nav>
    <script>
    $(function(){
    	$("#searchli").click(function(){
    		location.href="<%=request.getContextPath()%>/main/mainfunction";
    	});
    });
    
    </script>