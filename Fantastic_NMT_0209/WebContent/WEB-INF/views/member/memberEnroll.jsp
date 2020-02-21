<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberEnroll</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<style>
.outer{
  background: #ED4848;
  background-size: 100%;
  height:425px;
  position: relative;
}
.maintitle{
  width: 610px;
  text-align: center;
  color: white;
  font-family: 'Josefin Sans',sans-serif;
  /* margin:0 auto; */
  position: relative;
  left:50%;
  top:60%;
  transform:translateX(-50%) translateY(-50%);
}
.maintitle h1{
  font-size:87px;
}
.maintitle p{
  font-size: 20px;
}  
section{
  font-family:'Noto Sans KR',sans-serif ;
}
.outsection{
  max-width: 100%;
  font-family:'Noto Sans KR',sans-serif ;
  margin:0 auto;
}
input[type]::placeholder { color: #3B3B3B; font-size: 18px; opacity: 0.8; left: 20px;}
.insection{
  /* position: absolute; */
  /* left:34%;
  bottom: 10%; */
 width:630px;
 margin: 0 auto;
}
.insection input{
  width:580px;
  height:85px;
  background-color: #EBEBEB;
  border:none;
  font-size:25px;
  padding-left: 30px;
}
.formtitle{
  text-align: center;
  margin-top: 30px;
}
.servetitle{
  /* margin-left: 12%; */
  margin-top:15px;
  font-size: 16px;
}
p.title{
  /* margin-left: 17%; */
  font-size: 30px;
  margin-top:60px;
  font-weight:bold;
 }
.pclass{
  	margin-top:10px;
  	margin-bottom:10px;
}
select::-ms-expand{
  display:none;
}
#genderspan{
  margin-left: 260px;
}
input[id=birthday1],input[id=birthday2],input[id=birthday3]{
  width:170px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
input[id=birthday2],input[id=birthday3]{
  /* margin-left: 10px; */
}
.outendtitle{
  width:584px;
  text-align: center;
  margin-bottom:100px;
}
.outendtitle input{
  /* padding-top: 25px; */
  color: white;
  font-size: 30px;
  cursor: pointer;
  background-color: #ED4848;
}
p.checkmsg{
  color:#ed4848;
}
/* footer{
	margin-top:1300px;
} */
nav{
	width:100%;
	height:100px;
	z-index:100;
	position: absolute;
}
#enroll{
width:610px;
}
input[type=submit]{
	padding-left:0;
}
input[name=address]{
	font-size:18px;
}
</style>
<script>
$(function(){
	$("#memberId").keyup(function(){
		let memberId = $("#memberId").val();
		
		let msg = "";
		let regex = /^[a-zA-Z]{1}[a-zA-Z0-9_]{5,11}$/;
		
		if(!regex.test(memberId) || memberId ==''){
			msg = "사용불가능한 형식의 아이디입니다.";
			$("#checkId").html(msg).css("color","#ed4848");
		}else{
			$.ajax({
				url:"<%=request.getContextPath()%>/enroll/EnrollDuplicate.do",
				data:{memberId:memberId},
				dataType:"text",
				success:data=>{
					msg = data;
					if("이미 사용중인 아이디입니다." == msg){
						$("#checkId").html(data).css("color","#ed4848");
					}else{
						$("#checkId").html(data).css("color","#4EC407");
					}
				},
				error:(x,s,e)=>{
					console.log(x,s,e);
				}
			});
		}
	});
	
	$("#password").keyup(function(){
		
		let password = $("#password").val();
		
		let msg = "";
		let regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		
		if(regex.test(password)){
			msg = "사용가능한 비밀번호입니다.";
			$("#checkpas").html(msg).css("color","#4EC407");
		}
		else{
			msg = "올바른 형식이아닙니다."
			$("#checkpas").html(msg).css("color","#ed4848");
		}
		
	});
	
	
	$("#passwordChk").keyup(function(){
		
		let password = $("#password").val();
		let passchk = $("#passwordChk").val();
		
		let	msg = "비밀번호가 일치하지않습니다.";
		if(password.trim() == passchk.trim()){
			$("#checkpaschk").text('');
		}else{
			$("#checkpaschk").html(msg).css("color","#ed4848");
		}		
		
	});
	
	$("#memberName").keyup(function(){
		
		let name = $("#memberName").val();
		let reg = /^[가-힣]{2,4}$/;
		let msg = "올바른 형식이 아닙니다.";	
		
		if(reg.test(name)){
			$("#checkname").text('');
		}else{
		$("#checkname").html(msg).css("color","#ed4848");
		}
		
	});
	
	$("#address").click(function(){
		var pop = window.open("<%=request.getContextPath()%>/api/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

		
		
	});
	
	$("#birthday1").keyup(function(){
		let year = $(this).val();
		let today = new Date();
		let yearNow = today.getFullYear();
		
		
		if(1900 > year || year > yearNow){
			$("#checkbirth1").text("년도가 올바르지않습니다.").css("color","#ed4848");
		}else{
			$("#checkbirth1").text("");
		}
		
	});
	
	$("#birthday2").keyup(function(){
		let month = $(this).val();
		if(month<1 || month>12){
			$("#checkbirth2").text("월이 올바르지않습니다.").css("color","#ed4848");
		}else{
			$("#checkbirth2").text("");
		}
		
	});
	$("#birthday3").keyup(function(){
		let year = $("#birthday1").val();
		let month = $("#birthday2").val();
		let day = $(this).val();
		console.log(year);
		console.log(month);
		console.log(day);
		
		if(day<1 || day>31){
			$("#checkbirth3").text("일이 올바르지않습니다.").css("color","#ed4848");
		}else if((month==4 || month==6 || month==9 || month==11) && day==31){
			$("#checkbirth3").text("");
		}else if(month==2){
			let isleap = (year%4 == 0 && (year%100 != 0 || year%400 == 0));
			
			if(day>29 || (day==29 && !isleap)){
				$("#checkbirth3").text("일이 올바르지않습니다.").css("color","#ed4848");
			}else{
				$("#checkbirth3").text("");
			}
		}else{
			$("#checkbirth3").text("");
		}
		
	});
	
	$("#email").keyup(function(){
		let email = $(this).val();
		let reg = /^[A-Za-z0-9]+[-A-Za-z0-9_]*[@]{1}[A-Za-z0-9]+[-A-Za-z0-9_]*[.]{1}[A-Za-z]{2,5}$/;
		
		if(reg.test(email)){
			$("#checkemail").text("");
		}else{
			$("#checkemail").text("이메일형식이 올바르지 않습니다.");
		}
		
	});
	
	$("#phone").keyup(function(){
		
		let phone = $(this).val();
		let reg = /^01([0|1|6|7|8|9]?)+([0-9]{3,4})([0-9]{4})$/;
		
		if(reg.test(phone)){
			
			$("#checkphone").text("");
		}else{
			$("#checkphone").text("핸드폰번호형식이 올바르지 않습니다.");
		}
		
	});
	
	
});

function duplicate(){
	let memberId = $("#memberId").val();
	let password = $("#password").val();
	let passwordChk = $("#passwordChk").val();
	let memberName = $("#memberName").val();
	let birthday1 = $("#birthday1").val();
	let birthday2 = $("#birthday2").val();
	let birthday3 = $("#birthday3").val();
	let email = $("#email").val();
	let phone = $("#phone").val();
	
	let checkId = $("#checkId").text();
	let checkpas = $("#checkpas").text();
	let checkpaschk = $("#checkpaschk").text();
	let checkname = $("#checkname").text();
	let checkbirth1 = $("#checkbirth1").text();
	let checkbirth2 = $("#checkbirth2").text();
	let checkbirth3 = $("#checkbirth3").text();
	let checkemail = $("#checkemail").text();
	let checkphone = $("#checkphone").text();
	
	
	
	if(memberId.trim()=="" || checkId == "사용불가능한 형식의 아이디입니다." || checkId=="이미 사용중인 아이디입니다."){
		$("#memberId").focus();
		return false;
	}
	else if(password.trim()=="" || checkpas=="올바른 형식이아닙니다."){
		$("#password").focus();
		return false;
	}
	else if(passwordChk.trim()=="" || checkpaschk=="비밀번호가 일치하지않습니다."){
		$("#passwordChk").focus();
		return false;
	}
	else if(memberName.trim()=="" || checkname=="올바른 형식이아닙니다."){
		$("#memberName").focus();
		return false;
	}
	else if(birthday1.trim()=="" || checkbirth1=="올바른 형식이아닙니다."){
		$("#birthday1").focus();
		return false;
	}
	else if(birthday2.trim()=="" || checkbirth2=="올바른 형식이아닙니다."){
		$("#birthday2").focus();
		return false;
	}
	else if(birthday3.trim()=="" || checkbirth3=="올바른 형식이아닙니다."){
		$("#birthday3").focus();
		return false;
	}
	else if(email.trim()=="" || checkemail=="올바른 형식이아닙니다."){
		$("#email").focus();
		return false;
	}
	else if(phone.trim()=="" || checkphone=="올바른 형식이아닙니다."){
		$("#phone").focus();
		return false;
	}else{
		return true;
	}
	
	return true;	
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.formapi.address.value = roadFullAddr;
	
}



/* 생년월일 글자수제한 함수 */
function maxLengtYear(object){
  if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }  
}
function maxLengtMonth(object){
	  if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }  
	}
function maxLengtDay(object){
	  if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }  
	}	


</script>
</head>
<body>
	<header>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
    <div class="outer">
      <div class="maintitle">
        <h1>JOIN US</h1>
        <p>loream</p>
      </div>
    </div>
  </header>
  <section>
    <div class="outsection">
          <div class="formtitle">
            <p class="title">회원가입</p>
            <p class="servetitle">노머니 트립의 멤버가 되어주세요</p><br>
          </div>
      <div class="insection">
        <form action="<%=request.getContextPath() %>/member/memberEnrollEnd" method="post" onsubmit="return duplicate();"
        		autocomplete="off" name="formapi" id="formapi">
          <p class="pclass">아이디</p>
          <input type="text" name="memberId" id="memberId" placeholder="영문자숫자로이루어진 6~12자리">
          <p class="checkmsg" id="checkId"></p>
          <p class="pclass">비밀번호</p>
          <input type="password" name="password" id="password" placeholder="영문,숫자,특수문자가포함된 8~12자리">
          <p class="checkmsg" id="checkpas"></p>
          <p class="pclass">비밀번호 확인</p>
          <input type="password" name="passwordChk" id="passwordChk" placeholder="비밀번호를 입력하세요">
          <p class="checkmsg" id="checkpaschk"></p>
          <p class="pclass">이름</p>
          <input type="text" placeholder="이름을 입력하세요" name="memberName" id="memberName">
          <p class="checkmsg" id="checkname"></p>
          <p class="pclass">주소</p>
          <input type="text" placeholder=" 클릭하세요" name="address" id="address" readonly>
          <p class="checkmsg" id="checkaddress"></p>
          <p class="pclass">생년월일</p>
          <input type="number" name="birthday1" id="birthday1" 
          placeholder=" 년  ex)1990" maxlength="4" oninput="maxLengtYear(this)">
          <input type="number" name="birthday2" id="birthday2" 
          placeholder=" 월 ex)6" maxlength="2" oninput="maxLengtMonth(this)">
          <input type="number" name="birthday3" id="birthday3" 
          placeholder=" 일 ex)20" maxlength="2" oninput="maxLengtDay(this)">
          <p class="checkmsg" id="checkbirth1"></p>
          <p class="checkmsg" id="checkbirth2"></p>
          <p class="checkmsg" id="checkbirth3"></p>
          <p class="pclass">이메일</p>
          <input type="email" name="email" id="email" placeholder=" ex) abcd@naver.com">
          <p class="checkmsg" id="checkemail"></p>
          <p class="pclass">전화번호</p>
          <input type="text" name="phone" id="phone" placeholder="- 없이 입력해주세요">
          <p class="checkmsg" id="checkphone"></p>
          <div class="outendtitle">
          <br>
            <input type="submit" value="가입하기" id="enroll">
             
          </div>
        </form>
      </div>
    </div>
  </section> 
  <br />
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

