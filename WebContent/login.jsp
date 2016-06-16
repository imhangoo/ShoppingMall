<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.imhangoo.shopping.*, java.sql.*" %>    
<%
request.setCharacterEncoding("utf-8");
// get action type: login or register
String action = request.getParameter("action");
// get user parameters
String username = request.getParameter("username");
String password = request.getParameter("password");

if(action != null && action.equals("login")){
	// login check, if not correct, catch exception
	User u = null;
	try{
		u = UserManager.validate(username, password);
	}catch (UserNotFoundException e){
		out.println("User not found!");
		return;
	}catch (PasswordNotCorrectException e){
		out.println("Password not correct!");
		return;
	}
	
	// create session for current user and redirect
	session.setAttribute("user", u);
	response.sendRedirect("index.jsp");	
}
if(action != null && action.equals("register")){
	User u = new User();
	u.setUsername(username);
	u.setPassword(password);
	u.setRdate(new Timestamp(System.currentTimeMillis()));
	u.save();
	session.setAttribute("user", u);
	response.sendRedirect("index.jsp");
}

%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Interface</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />

<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="js/regcheckdata.js"></script>

<script type="text/javascript">
$(function() {
	$('#login').click(function() {
		var name_state = $('#name');
		var psd_state = $('#psd');
		var name = $('#name').val();
		var psd = $('#psd').val();
		if (name == '') {
			name_state.parent().next().next().css("display", "block");
			return false;
		} else if (psd == '') {
			name_state.parent().next().next().css("display", "none");
			psd_state.parent().next().next().css("display", "block");
			return false;
		} else {
			name_state.parent().next().next().css("display", "none");
			psd_state.parent().next().next().css("display", "none");
			$('.login').submit();
		}
	});
	$('#register').click(function() {
		var name_r_state = $('#name_r');
		var psd_r_state = $('#psd_r');
		var affirm_psd_state = $('#affirm_psd');
		var name_r = $('#name_r').val();
		var psd_r = $('#psd_r').val();
		var affirm_psd = $('#affirm_psd').val();
		if (name_r == '') {
			name_r_state.parent().next().next().css("display", "block");
			return false;
		} else if (psd_r == '') {
			psd_r_state.parent().next().next().css("display", "block");
			return false;
		} else if (affirm_psd == '') {
			affirm_psd_state.parent().next().next().css("display", "block");
			return false;
		} else if (psd_r != affirm_psd) {
			return false;
		} else {
			$('.register').submit();
		}
	})
})

function ok_or_errorBylogin(l) {
	var content = $(l).val();
	if (content != "") {
		$(l).parent().next().next().css("display", "none");
	}
}

function ok_or_errorByRegister(r) {
	var affirm_psd = $("#affirm_psd");
	var psd_r = $("#psd_r");
	var affirm_psd_v = $("#affirm_psd").val();
	var psd_r_v = $("#psd_r").val();
	var content = $(r).val();
	if (content == "") {
		$(r).parent().next().next().css("display", "block");
		return false;
	} else {
		$(r).parent().next().css("display", "block");
		$(r).parent().next().next().css("display", "none");
		if (psd_r_v == "") {
			$(psd_r).parent().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "block");
			return false;
		}
		if (affirm_psd_v == "") {
			$(affirm_psd_v).parent().next().css("display", "none");
			$(affirm_psd_v).parent().next().next().css("display", "none");
			$(affirm_psd_v).parent().next().next().css("display", "block");
			return false;
		}
		if (psd_r_v == affirm_psd_v) {
			$(affirm_psd).parent().next().css("display", "none");
			$(affirm_psd).parent().next().next().css("display", "none");
			$(psd_r).parent().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "none");
			$(affirm_psd).parent().next().css("display", "block");
			$(psd_r).parent().next().css("display", "block");
		} else {
			$(affirm_psd).parent().next().css("display", "none");
			$(affirm_psd).parent().next().next().css("display", "none");
			$(psd_r).parent().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "none");
			$(psd_r).parent().next().css("display", "block");
			$(affirm_psd).parent().next().next().css("display", "block");
			return false;
		}
	}
}

function barter_btn(bb) {
	$(bb).parent().parent().fadeOut(1000);
	$(bb).parent().parent().siblings().fadeIn(2000);
}
</script>
</head>

<body class="login_body">

<div class="login_div">
	<div class="col-xs-12 login_title">Login</div>
	<form action="" class="login" method="post">
	<input type="hidden" name="action" value="login" />
		<div class="nav">
			<div class="nav login_nav">
				<div class="col-xs-4 login_username">
					UserName:
				</div>
				<div class="col-xs-6 login_usernameInput">
					<input type="text" name="username" id="name" value="" placeholder="&nbsp;&nbsp;User Name"  onblur="javascript:ok_or_errorBylogin(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav login_psdNav">
				<div class="col-xs-4">
					Password:
				</div>
				<div class="col-xs-6">
					<input type="password" name="password" id="psd" value="" placeholder="&nbsp;&nbsp;Password" onBlur="javascript:ok_or_errorBylogin(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="col-xs-12 login_btn_div">
				<input type="submit" class="sub_btn" value="Login" id="login" />
			</div>
		</div>
	</form>

	<div class="col-xs-12 barter_btnDiv">
		<button class="barter_btn" onClick="javascript:barter_btn(this)">Without an account? Register Now</button>
	</div>
</div>

<div class="register_body">
	<div class="col-xs-12 register_title">Register</div>
	<form name="reg_form" action="" class="register" method="post">
		<input type="hidden" name="action" value="register" />
		<div class="nav">
			<div class="nav register_nav">
				<div class="col-xs-4">
					UserName:
				</div>
				<div class="col-xs-6">
					<input type="text" name="username" id="name_r" value="" placeholder="&nbsp;&nbsp;User Name" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav register_psdnav">
				<div class="col-xs-4">
					Password:
				</div>
				<div class="col-xs-6">
					<input type="password" name="password" id="psd_r" value="" placeholder="&nbsp;&nbsp;Password" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav register_affirm">
				<div class="col-xs-4">
					Confirm:
				</div>
				<div class="col-xs-6">
					<input type="password" name="password2" id="affirm_psd" value="" placeholder="&nbsp;&nbsp;Confirm Password" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="col-xs-12 register_btn_div">
				<input type="submit" class="sub_btn" value="submit" id="register" />
			</div>
		</div>
	</form>
	<div class="col-xs-12 barter_register">
		<button class="barter_registerBtn" onClick="javascript:barter_btn(this)" style="">Already registered? Return and login </button>
	</div>
</div>
<div style="text-align:center;">
</div>

</body>
</html>