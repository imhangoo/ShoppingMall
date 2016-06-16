<%
// check if the user is admin, if not, redirect to login page
String isAdmin = (String)session.getAttribute("admin");
if(isAdmin == null || !"true".equals(isAdmin)){
	session.setAttribute("url", request.getRequestURI());

%>
<jsp:forward page="login/login.jsp"></jsp:forward>
<%}%>