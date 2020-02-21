<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String city = (String) request.getAttribute("city");
	String days = (String) request.getAttribute("days");
	String price = (String) request.getAttribute("price");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="#">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/travelpackage/mainfunction.css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js"
	crossorigin="anonymous"></script>

<title>Insert title here</title>

<script>
$(document).ready(function () {
    $('#form-ul .li-style').click(function () {
        $('#form-ul .li-style').css('color', 'white').css('background', '#ed4848');
        $(this).css('color', '#ed4848').css('background', 'white');
    });
   $("#hotel").css('display','none');
   $("#place").css('display','none');
   
  	/*  $("#form-ul").css('display','none'); */
    /* $("#air-containter").css('display','none'); */
    /* $("#article-select-price").css('display','none'); */
});

$(function(){
	
	
    $("#letgo").click(function(){
        $("#article-select-price").css('display','block');
        $("#form-ul").css('display','block');
        $("#air-containter").css('display','block');
        let val = $("select[name=select-days]").val();
        console.log(val);
        
        console.log($("select[name=select-continent").val());
        console.log($("select[name=select-country").val());
        console.log($("select[name=select-days").val());
    }); 
    
    
   <%--  $("select[name=select-country]").val("<%=city%>").prop("selected",true);
    $("select[name=select-days]").val("<%=days%>").prop("selected",true);
    $("#input-price").val("<%=price%>"); --%>
    /* $("#letgo").trigger("click"); */
    
});

$(function(){
        $("#input-price").change(function(){
            let price = $("#input-price").val();
            $("#input-price-result").html(price);
        });
    });

$(function(){
	
/*     $("#li-airplane").click(function(){ 
    	$(".airplane").css('display','block');
        $(".air-card").css('display','block');
        $("#hotel").css('display','none');
        $("#place").css('display','none');
    });
    $("#li-hotel").click(function(){
    	$(".airplane").css('display','none');
        $("#hotel").css('display','block');
        $(".air-card").css('display','none');
        $("#place").css('display','none');
    });
    $("#li-place").click(function(){
        $(".airplane").css('display','none');
        $(".air-card").css('display','none');
        $("#hotel").css('display','none');
        $("#place").css('display','block');
    }); */
})


$(function () {
    
	
    $('.btn-plus').click(function () {
		let day1 = Number($("#hotel-days1").text());
		let day2 = Number($("#hotel-days2").text());
		let day3 = Number($("#hotel-days3").text());
    	
		
    	console.log('days',$("select[name=select-days]").val()); 
    	
        if( (day1+day2+day3) < $("select[name=select-days]").val()){
        
        let temp = Number($(this).next().text())+1;
        $(this).next().html(temp);
        
        }else{
            alert($("select[name=select-days]").val()+"일 이상 입력할 수 없습니다.");
        }
        console.log( day1, day2, day3);
    });
    
    $('.btn-minus').click(function () {
    	let day1 = Number($("#hotel-days1").text());
		let day2 = Number($("#hotel-days2").text());
		let day3 = Number($("#hotel-days3").text());				
		$thisVal = $(this).parent().children().eq(4).text();
		if($thisVal != 0){
			$(this).parent().children().eq(4).text($thisVal-1);
		}
       
    });
});

</script>

<style>
.select_menu {
	position: relative;
	float: left;
	width: 28%;
	height: 70%;
	margin-right: 5%;
	padding-left: 1%;
	font-size: 1em;
	background:
		url('<%=request.getContextPath()%>/images/mainfunction/optionBG.jpg')
		no-repeat;
	background-size: 100% 98%;
	cursor: pointer;
	-webkit-appearance: none;
	left: 6%;
	border: 0px;
}

#inputUser>input {
	background-image:
		url('<%=request.getContextPath()%>/images/mainfunction/manwon.png');
	background-repeat: no-repeat;
	background-position: right;
	background-size: 80px 50px;
}

nav {
	width: 100%;
}

.nav_wrap {
	z-index: 100;
}

footer {
	position: relative;
	float: right;
	width: 100%;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<header>
		<img src="<%=request.getContextPath()%>/images/mainfunction/0001.jpg"
			alt="headerIMG">
		<div id="header-container">
			<div id="header-welcome-box">
				<h2>
					MAKE <br> YOUR TRIP
				</h2>

				<p>세계로 떠나는 여행 떠나세요!</p>
				<p>NMT에서 응원합니다!</p>
			</div>
		</div>
	</header>
	<section id="section1">
		<article id="article-container">
			<div id="article-selectinfo">
				<ul>
					<li id="li_map"><i class="fas fa-map-marker-alt"></i> <span>국가명,
							도시명</span></li>
					<li id="li_calendar"><i class="far fa-calendar-alt"><span>숙박일수</span></i>
						선택일수</li>
					<li id="li_departure"><i class="fas fa-plane-departure"></i> <span>departure:</span></li>
					<li id="li_arrival"><i class="fas fa-plane-arrival"></i> <span>arrival:
					</span></li>
				</ul>
			</div>
			<div id="article-select">
				<form action="" method="GET">
					<br> <br>
					<div id="choose">
						<select class="select_menu" name="select-continent">
							<option value="" selected>출발지</option>
							<option value="incheon">인천</option>
							<option value="busan">부산</option>
						</select> <select class="select_menu" name="select-country">
							<option value="" selected>도착지</option>
							<option value="france">프랑스</option>
							<option value="swiss">스위스</option>
							<option value="englind">영국</option>
						</select> <select class="select_menu" name="select-days">
							<option value="" >며칠?</option>
							<option value="5" selected>5일</option>
							<option value="10">10일</option>
							<option value="15">15일</option>
						</select>
					</div>
					<div id="inputUser">
						<input type="text" id="input-price" value="">
						<button type="button" id="letgo">LET'S GO</button>
					</div>
				</form>
			</div>
			<div id="article-select-price">
				<h1>
					여행 경비 <span id="input-price-result"><%=price%></span> 만원 에 맞는
					상품들이에요!
				</h1>
			</div>

			<br> <br>

			<ul id="form-ul">
				<li id="li-airplane" class="li-style">항공권</li>
				<li><i class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i></li>
				<li id="li-hotel" class="li-style">호텔/숙소</li>
				<li><i class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i></li>
				<li id="li-place" class="li-style">관광지/시설</li>
			</ul>
			<br />
<div id="main-div-airplane">
			<div class="airplane">
				<i class="fas fa-circle"
					style="font-size: 10px; margin: 10px; color: #ed4848;"></i><span
					style="font-size: 18px; font-family: 'Noto Sans KR', sans-serif; margin-right: 10px;">출발</span>
				<span
					style="font-size: 20px; font-family: 'Noto Sans KR', sans-serif">2020.2.12</span>
			</div>
			<div id="air-containter" class="air-card">
				<table>
					<thead>
						<tr>
							<th>항공사</th>
							<th>운항편명</th>
							<th>출발시간</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>가격</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_01.png"
								alt="대힌항공"></td>
							<td>KE159</td>
							<td>12:00</td>
							<td>인천</td>
							<td>파리</td>
							<td>896,300</td>
							<td><input type="radio" name="plane-check" id=""></td>
						</tr>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_02.png"
								alt="아시아나항공"></td>
							<td>OZ339</td>
							<td>12:20</td>
							<td>인천</td>
							<td>파리</td>
							<td>905,120</td>
							<td><input type="radio" name="plane-check" id=""></td>
						</tr>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_03.png"
								alt="중국동방항공"></td>
							<td>MU550</td>
							<td>12:40</td>
							<td>인천</td>
							<td>파리</td>
							<td>678,240</td>
							<td><input type="radio" name="plane-check" id=""></td>
						</tr>
					</tbody>
				</table>

			</div>
			<div class="airplane">
				<i class="fas fa-circle"
					style="font-size: 10px; margin: 10px; color: #ed4848;"></i><span
					style="font-size: 18px; font-family: 'Noto Sans KR', sans-serif; margin-right: 10px;">도착</span>
				<span
					style="font-size: 20px; font-family: 'Noto Sans KR', sans-serif">2020.2.12</span>
			</div>
			<div id="air-containter" class="air-card">
				<table>
					<thead>
						<tr>
							<th>항공사</th>
							<th>운항편명</th>
							<th>출발시간</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>가격</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_01.png"
								alt="대힌항공"></td>
							<td>KE159</td>
							<td>12:00</td>
							<td>인천</td>
							<td>파리</td>
							<td>896,300</td>
							<td><input type="radio" name="plane-check" id=""></td>
						</tr>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_02.png"
								alt="아시아나항공"></td>
							<td>OZ339</td>
							<td>12:20</td>
							<td>인천</td>
							<td>파리</td>
							<td>905,120</td>
							<td><input type="radio" name="plane-check" id=""></td>
						</tr>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_03.png"
								alt="중국동방항공"></td>
							<td>MU550</td>
							<td>12:40</td>
							<td>인천</td>
							<td>파리</td>
							<td>678,240</td>
							<td><input type="radio" name="plane-check" id=""></td>
						</tr>
					</tbody>
				</table>
			</div>
</div>			
<div id="main-div-hotel">
			<div class="card-container" id="hotel">
				<div id="hotel-cards">
					<div class="card-box">
						<img
							src="<%=request.getContextPath()%>/images/mainfunction/semiimg_04.jpg"
							alt="호텔사진1">
						<div id="lower-price">
							<p>최저가</p>
						</div>
						<br>
						<div class="card-box-1-info">
							<!-- <span>므제브호텔</span> -->
							<p class="hotel-name">므제브호텔</p>
							<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>

							<button class="btn-plus">더하기</button>
							<span name="hotel-days" id="hotel-days1">0</span>
							<button class="btn-minus">빼기</button>

						</div>
					</div>
					<div class="card-box">
						<img
							src="<%=request.getContextPath()%>/images/mainfunction/semiimg_06.jpg"
							alt="호텔사진1" width="300px">
						<div id="lower-price">
							<p>최저가</p>
						</div>
						<br>
						<div class="card-box-1-info">
							<!-- <span>주네브아에로포트페르니볼</span> -->
							<p class="hotel-name">주네브아에로포트페르니볼</p>
							<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
							<!-- <i class="fas fa-plus"></i><span>value</span><i class="fas fa-minus"></i> -->
							<button class="btn-plus">더하기</button>
							<span name="hotel-days" id="hotel-days2">0</span>
							<button class="btn-minus">빼기</button>
						</div>
					</div>
					<div class="card-box">
						<img
							src="<%=request.getContextPath()%>/images/mainfunction/semiimg_05.jpg"
							alt="호텔사진1">
						<div id="lower-price">
							<p>최저가</p>
						</div>
						<br>
						<div class="card-box-1-info">
							<!-- <span>다이아몬드베이터레이스</span> -->
							<p class="hotel-name">다이아몬드베이터레이스</p>
							<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
							<button class="btn-plus">더하기</button>
							<span name="hotel-days" id="hotel-days3">0</span>
							<button class="btn-minus">빼기</button>
						</div>
					</div>
				</div>
			</div>
	</div>
<style>
.hotel-name {
	padding-top: 10px;
}
</style>
			<div class="card-container" id="place">
				<div class="card-box">
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/switzerland-1547270_1920.jpg"
						alt="호텔사진1" width="300px"> <br>
					<div class="card-box-1-info">
						<p>루브르 미술관</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />
						<button class="btn-plus">더하기</button>
						<button class="btn-minus">빼기</button>
					</div>
				</div>
				<div class="card-box">
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_07.jpg"
						alt="호텔사진1"> <br>
					<div class="card-box-1-info">
						<p>오르세 미술관</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />
						<button class="btn-plus">더하기</button>
						<button class="btn-minus">빼기</button>
					</div>
				</div>

				<div class="card-box">
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_08.jpg"
						alt="호텔사진1"> <br>
					<div class="card-box-1-info">
						<p>스위스 기차여행</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />
						<button class="btn-plus">더하기</button>
						<button class="btn-minus">빼기</button>
					</div>

				</div>
			</div>
			
			<div class="next-button">
				
				<button class = "btn-loc-to" id="next-to-hotel">다음</button>								
				<button class = "btn-loc-to" id="next-to-place">다음</button>
										
				<button class = "btn-loc-to" id="add-plan">담기</button>
				<button class = "btn-loc-to" id="before-to-hotel">이전</button>
				<button class = "btn-loc-to" id="before-to-air">이전</button>
				
				
			</div>
			
			<script>
			$(function(){
				$("#li-airplane").trigger("click");
				$("#before-to-air").css("display","none");
				$("#next-to-place").css("display","none");
				$("#before-to-hotel").css("display","none");
				$("#add-plan").css("display","none");
				
				$("#li-airplane").click(function(){
					$("#before-to-air").trigger("click");
				});
				$("#li-hotel").click(function(){
					$("#next-to-hotel").trigger("click");
				})
				$("#li-place").click(function(){
					$("#next-to-place").trigger("click");
				});
				
				$("#next-to-hotel").click(function(){
					$("#main-div-airplane").css("display","none");
					$(this).css("display","none");
					$("#before-to-air").css("display","block");					
					$("#next-to-place").css("display","block");
					$("#hotel").css("display","block");
					$("#place").css("display","none");
					$("#before-to-hotel").css("display","none");
					$("#add-plan").css("display","none");
				});
				
				$("#before-to-air").click(function(){
					$("#main-div-airplane").css("display","block");
					$("#next-to-hotel").css("display","block");
					$("#next-to-place").css("display","none");
					$("#add-plan").css("display","none");
					$(this).css("display","none");
					$("#hotel").css("display","none");
					$("#place").css("display","none");
					$("#next-to-hotel").css("display","block");
					$("#before-to-hotel").css("display","none");
				});
				
				$("#next-to-place").click(function(){
					$("#main-div-airplane").css("display","none");
					
					$("#hotel").css("display","none");
					$(this).css("display","none");
					$("#place").css("display","block");
					$("#before-to-air").css("display","none");
					$("#before-to-hotel").css("display","block");
					$("#next-to-hotel").css("display","none");
					$("#add-plan").css("display","block");
					
				});
				
				$("#before-to-hotel").click(function(){
					$("#hotel").css("display","block");
					$(this).css("display","none");
					$("#place").css("display","none");
					$("#next-to-place").css("display","block");
					$("#before-to-air").css("display","block");
					$("#add-plan").css("display","none");
					
				});
			});
			
			</script>
			<style>
.btn-loc-to {
	width: 180px;
	height: 40px;
	background: #ed4848;
	border: 2px solid #ed4848;
	border-radius: 10px;
	color: white;
	float:right;
	font-size: 18px;
}

.next-button {
	position: relative;
	bottom: 10%;
	float: right;
	width: 380px;
	margin-bottom: 20px;
}
</style>

		</article>
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>