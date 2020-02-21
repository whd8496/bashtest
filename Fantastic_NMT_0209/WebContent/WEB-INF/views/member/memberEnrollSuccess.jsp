<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/join_success.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<style>
.red_bg{
	margin-top:0px;
	margin-bottom:80px;
}
input[type=button]:hover{
	cursor: pointer;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
    <header>
        <div class="red_bg">
            <h1>JOIN US</h1>
            <p>노머니 트립의 멤버가 되어주세요</p>
        </div>
    </header>
    <section>
        <div class="content_wrap">
            <p><i class="fas fa-check-circle"></i><br>NMT의 새로운 멤버가 되었습니다<br>즐거운 여행을 떠나봐요</p>
            <h2>회원가입 성공</h2>
        </div>
        <div class="border"></div>
        <div class="button_wrap">
            <input type="button" id="login_go" value="로그인하기" onclick="location.href='<%=request.getContextPath()%>/member/memberLoginView'">
            <hr>
            <input type="button" id="main_go" value="메인으로" onclick="location.href='<%=request.getContextPath()%>/'">
        </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
