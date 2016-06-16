function checkdata() {
	var ssn=reg_form.username.value.toLowerCase();
	
	//check user name
	if (!checkUserName(ssn)) return false;  
	
	//check password
	if( strlen(reg_form.pwd.value)<6 || strlen(reg_form.pwd.value)>16 ) {
		alert("Length of password should be between 6 and 16 ！")
		reg_form.pwd.focus()
		return false;
	}
	if( strlen2(reg_form.pwd.value) ) {
		alert("No special chars are allowed in password!")
		reg_form.pwd.focus()
		return false;
	}
	if( reg_form.pwd.value == reg_form.username.value ) {
		alert("User name and password should be distinct!")
		reg_form.pwd.focus()
		return false;
	}
	if( reg_form.pwd2.value =="" ) {
		alert("Please input password confirmation！")
		reg_form.pwd2.focus()
		return false;
	}
	if( reg_form.pwd2.value != reg_form.pwd.value ) {
		alert("Two inputs of password are different!")
		reg_form.pwd.focus()
		return false;
	}
	
	return true;
}

function checkUserName(ssn){
	if( ssn.length<3 || ssn.length>18 ) {
		alert("Length of user name should be between 3 and 8 !")
		reg_form.username.focus()
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("No space is allowed in user name!")
		reg_form.username.focus()
		return false;
	}
	if (!isSsnString(ssn)){
		alert("User name is incorrect or it has been used!")
		reg_form.username.focus()
		return false;
	}
	return true;
}

function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}

function strlen2(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) return true;
	}
	return false;
}

function isWhiteWpace (s)
{
	var whitespace = " \t\n\r";
	var i;
	for (i = 0; i < s.length; i++){   
		var c = s.charAt(i);
		if (whitespace.indexOf(c) >= 0) {
		  	return true;
		}
	}
	return false;
}

function isSsnString (ssn)
{
	var re=/^[0-9a-z][\w-.]*[0-9a-z]$/i;
	if(re.test(ssn))
		return true;
	else
		return false;
}

function checkssn(gotoURL) {
   var ssn=reg_form.username.value.toLowerCase();
   if (checkUserName(ssn)){
	   var open_url = gotoURL + "?username=" + ssn;
	   window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=322,height=200');
	}
}