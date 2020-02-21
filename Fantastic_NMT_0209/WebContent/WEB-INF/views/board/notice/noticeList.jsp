<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "board.model.vo.Notice" %>
<%
	List<Notice> list = (List<Notice>)request.getAttribute("list");
	Notice notice = (Notice)request.getAttribute("notice");
			
%>
<!-- 여주
	만든날짜 : 200205
	목적 : 게시판 view jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeView</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/notice/notice.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
 <script>
      $(function(){
          $("#scroll_bnt").click(function(){
              $("#scroll_up_bnt").css("display","block");
              $("#bg_scroll").css("display","block").show();
          });
      });
      
      $(function(){
          $("#scroll_up_bnt").click(function(){
              $("#bg_scroll").css("display","none");
              $("#scroll_up_bnt").css("display","none");
          });
      });
    </script>
<style>
.bg_img{
    height: 700px;
    background-image: url('<%=request.getContextPath()%>/images/notice/semiproject_sub6_01.png');
    background-repeat: no-repeat;
    background-position: top center;
    background-size: cover;
}
</style>
</head>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<body>
    <header>
        <div class="bg_img">
            <div class="title">
                <h1>NOTICE</h1>
                <p>불편한 점이나 개선점을 적어주세요<br>노머니 트립에게 궁금한 것을 물어봐도 좋아요</p>
            </div>
        </div>
    </header>
    <section>
        <div class="title_wrap">
            <h2>게시판</h2>
            <p>노머니트립에 궁금한 점을 물어보세요</p>
        </div>
        <div class="first_wrap">
            <div class="call_wrap">
                <div class="gray_bg2">
                    <div class="call_content_wrap">
                        <i class="fas fa-circle"></i>
                        <br>
                        <h3>문의전화</h3>
                        <h2>1688-0898</h2>
                        <p>평일 9:00 - 18:00</p>
                        <p>주말 10:00 - 13:00 공휴일 휴무</p>
                    </div>
                </div>
            </div>
            <div class="notice_wrap">
                <div class="notice_bar">
                    <div class="notice_title">
                        <h3>공지사항</h3>
                    </div>
<!--                     <i class="fas fa-plus" onclick="more();"></i>  -->
                    <div class="red_border"></div>
                </div>
                <table class="notice_table">
                	<% for(Notice n : list){ %>
                    <tr>
                    <td>
	                    <span><%=n.getBoardNo() %></span>
	                    <h3><%=n.getBoardTitle() %></h3>
	                    <p><%=n.getBoardDate() %></p>
                    </td>
                    </tr>
                    <%} %>
                </table>
            </div>
            <input type="button" id="write_btn" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/board/noticeWrite'"/>
        </div>
        <div class="qna_wrap">
            <div class="qna_bar">
                <div class="qna_title">
                    <h3>1:1 문의</h3>
                </div>
                <i class="fas fa-plus"></i>
                <div class="red_border_2"></div>
            </div>
            <table class="qna_table">
                <th>
                    <td>
                        <div class="qna_q">
                            <h2>Q.</h2>
                            <p>항공권예약을 취소하고 싶어요</p>
                            <i class="fas fa-angle-down" id="scroll_bnt"></i>
                            <i class="fas fa-angle-up" id="scroll_up_bnt"></i>
                        </div>
                        <span id="bg_scroll">
                            <p>숙박일은 변경이 불가능합니다<br>변경을 원하신다면 구매하신 후 환불신청을 받으세요</p>
                        </span>
                    </td>
                </th>
                <tr></tr>
                <th>
            </table>
        </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>