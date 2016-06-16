<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_session_check.jsp" %>
<%@ page import="com.imhangoo.shopping.*" %>

<%
	// get user id to be deleted, then call deleteUser method
	int userID = Integer.parseInt(request.getParameter("id"));
	UserManager.deleteUser(userID);
	// redirect to userlist page
	response.sendRedirect("userlist.jsp");
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>