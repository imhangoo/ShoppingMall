<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*,com.imhangoo.shopping.*,com.imhangoo.shopping.category.*, java.util.*"%>
<%@ include file="_session_check.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	CategoryService service = CategoryService.getInstance();
	if (action != null && action.equals("add")) {
		Category c = new Category();
		c.setName(request.getParameter("name"));
		c.setDescr(request.getParameter("descr"));
		c.setGrade(0);
		c.setLeaf(false);
		c.setPid(Integer.parseInt(request.getParameter("parent")));
		service.add(c);
	}
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
				<%
					if (action != null && action.equals("add")) {
				%>
				<h3>Succeed adding a category</h3>
				<br>
				<a href="category_list.jsp">View Category List</a><br/><br/><br/>
				<a href="category_add.jsp">Add one more</a>
				<%
					} else {
				%>
				<form action="category_add.jsp" method="post"
					onsubmit="return addCategyConfirm()">
					<input type="hidden" name="action" value="add">
					<table>
						<tr>
							<td>Parent Category</td>
							<td><select name="parent">
							<option value="0">No Parent</option>
							<% 
							List<Category> categoryList = service.getCategoryList();
							Iterator<Category> it = categoryList.iterator();
							while(it.hasNext()){
								Category c = it.next();
								int id = c.getId();
								String name = c.getName();
							%>
							
							<option value="<%=id %>"><%=name %></option>
							<%
								
							}
							
							%>
								
							</select>
							</td>
						</tr>
						<tr>
							<td>Category Name</td>
							<td><input type="text" name="name" size="50"></td>
						</tr>
						<tr style="">
							<td>Category Description</td>
							<td><textarea name="descr" rows="8" cols="40"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><input
								type="submit" value="submit"></td>
						</tr>

					</table>
				</form>
				<%
					}
				%>
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
