<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	String loc = (String)request.getAttribute("loc");
	
	Cookie[] cookies = request.getCookies();
	boolean saveIdChecked = false;
	String memberId = "";
	
	
	if(cookies != null){
		for(Cookie c : cookies){
			String name = c.getName();
			String value = c.getValue();
			System.out.println(name + "="+value);
			if("saveId".equals(name)){
				saveIdChecked = true;
				memberId = value;
			}
		}
	}
	
	
%>
<!-- 민희
	만든날짜 : 200202
	목적 : 로그인화면 jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberEnroll</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/login.css">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script>
function loginValidate(){
	let $memberId = $("#login-memberId");
	let $password = $("#login-password");
	//1. 아이디검사 (그냥 4자리 이상이면  ㅇㅋ)
	if($memberId.val().trim().length < 4){
		alert("올바른 아이디를 입력하세요.");
		$memberId.focus();
		return false;
	}
	//2. 비밀번호검사
	if($password.val().trim().length < 4){
		alert("올바른 비밀번호를 입력하세요.");
		$password.select();
		return false;
	}
	//3.
	return true;
}
</script>
</head>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<body id="loginForm">
    <header id="login-header">
        <div>
            <h1 class="thick eng">LOG IN</h1>
            <p class="eng">Sign into our page! We're ready for your trip.</p>
        </div>
    </header>
    <form action="<%=request.getContextPath() %>/member/memberLoginEndServlet"
    	  id="loginFrm" method="POST"
    	  onsubmit="return loginValidate();">
        <div>
            <h3 class="thick kor">로그인</h3>
            <p class="kor">먼저 로그인을 해주세요</p><br/>
            <p class="kor login-label">아이디</p>
            <input type="text" name="memberId" id="memberId"  class="kor"
                   placeholder="아이디를 입력하세요" value="<%=saveIdChecked==true?memberId:""%>"/>
            <% if(msg == "존재하지 않는 아이디입니다."){ %>
            <p class="kor hidden-space"><%=msg %></p>
            <% } %>
            <p class="kor login-label">비밀번호</p>
            <input type="password" name="password" id="password"  class="kor"
                   placeholder="비밀번호를 입력하세요"/>
            <% if(msg == "비밀번호가 틀렸습니다."){ %>
            <p class="kor hidden-space"><%=msg %></p>
            <% } %>
            <div id="float-form">
           		 <div class="checkbox_wrap">
                    <label class="saveId-container kor float" for="saveId">아이디 저장
                        <input type="checkbox" name="saveId" id="saveId" <%=saveIdChecked==true?"checked":"" %>>
                        <span class="saveId-checkmark"></span>
                    </label>
                </div>
                <div id="red-dot" class="float"></div>
                <span class="kor float">회원이 아니신가요?</span>
                <span class="float">
                    <input id="enroll-btn" class="kor" type="button" value="회원가입"
                            onclick="location.href='<%=request.getContextPath()%>/member/memberEnroll'"/>
                </span>
            </div>
            <button id="login-btn" type="submit"><p class="thick kor">로그인</p></button>
        </div>
    </form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>