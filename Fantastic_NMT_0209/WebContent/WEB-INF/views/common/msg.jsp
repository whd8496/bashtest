<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*, java.io.IOException" %>
<!-- 민희 / 200205 /
	 alert생성 및 페이지이동 공통jsp -->
<%
    String msg = (String)request.getAttribute("msg");
    String loc = (String)request.getAttribute("loc");
    //servlet에서 setAttribute하는 script 반영
    String script = (String)request.getAttribute("script");
%>
<script>
	alert("<%=msg%>");
	
	<%= script != null?script:""%> //스크립트 입력이 있는 경우에면 script 출력 
			
	location.href = "<%=request.getContextPath() +loc%>";
</script>
</head>
<body>
</body>
</html>