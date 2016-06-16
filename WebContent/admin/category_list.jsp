<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*,com.imhangoo.shopping.*,com.imhangoo.shopping.category.*, java.util.*"%>
<%@ include file="_session_check.jsp"%>
<%
	String action = request.getParameter("action");
	CategoryService service = CategoryService.getInstance();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shopping Backstage</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/admin.js"></script>


</head>

<body>
	<div class="top"></div>
	<div id="header">
		<div class="logo">Shopping Backstage</div>
		<div class="navigation">
			<ul>
				<li>Welcome!</li>
				<li><a href="" style="text-decoration: underline">admin</a></li>
				<li><a href="">Settings</a></li>
				<li><a href="">Quit</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<%@ include file="sidebar.jsp"%>
		<div class="m-right">
			<div class="right-nav">
				<ul>
					<li><img src="images/home.png"></li>
					<li style="margin-left: 25px;">Your current location:</li>
					<li><a href="#">User</a></li>
					<li>></li>
					<li><a href="#">User List</a></li>
				</ul>
			</div>
			<div class="main" align="center">
				<h3>Category List</h3>
				<br>
		
					<table>
						<tr>
							<td>Category Name</td>
							<td>Category ID</td>
							<td>Category Grade</td>
						
						</tr>
							
							
							
							<% 
							List<Category> categoryList = service.getCategoryList();
							Iterator<Category> it = categoryList.iterator();
							while(it.hasNext()){
								Category c = it.next();
								int id = c.getId();
								String name = c.getName();
							%>
							<tr>
							<td><%=c.getName() %></td>
							<td><%=c.getId() %></td>
							<td><%=c.getGrade() %></td>
							</tr>
							<%
								
							}
							
							%>
								
					
						
						
						

					</table>
				
			</div>
		</div>
	</div>
	<div class="bottom"></div>
	<div id="footer">
		<p>Copyright© 2016</p>
	</div>
	<script>
		navList(12);
	</script>
</body>
</html>
