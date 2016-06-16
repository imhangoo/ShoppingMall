<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="_session_check.jsp" %>


<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shopping Backstage</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>

<body>
<div class="top"></div>
<div id="header">
	<div class="logo">Shopping Backstage</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href=""><%=session.getAttribute("adminName") %></a></li>
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li>
			<li><a href="">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<%@ include file="sidebar.jsp" %>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><img src="images/home.png"></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">系统公告</a></li>
								<li>></li>
								<li><a href="#">最新公告</a></li>
						</ul>
			</div>
			<div class="main">
				
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2016 </p></div>
<script>navList(12);</script>
</body>
</html>
