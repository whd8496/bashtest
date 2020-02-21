<%@page import="board.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeWrite</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/notice/noticeWrite.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script>
function noticeValidate(){
	return true;
}
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
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
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
            <h2>공지사항</h2>
            <p>관리자 공지사항 업로드 페이지 입니다</p>
        </div>
        <form action="<%=request.getContextPath() %>/board/noticeWriteEnd"
        	  method="GET"
        	  enctype="multipart/form-data">
            <table id="tbl_notice_write">
                <tr>
                    <td id="notice_title_wrap">
                        <div class="red_circle"></div>
                        <h2>제목</h2>
                        <input type="text" name="noticeTitle" required>
                    </td>
                </tr>
                <tr>
                    <td id="notice_content_wrap">
                        <div class="red_circle"></div>
                        <h2>내용</h2>
                        <textarea rows="5" cols="50" name="noticeContent"></textarea>
                    </td>
                </tr>
            </table>
            <div class="btn_wrap">
                <input type="submit" value="등록하기" onclick="return noticeValidate();" id="btn_write_submit">
            </div>
        </form>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>