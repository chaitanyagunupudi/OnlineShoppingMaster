<HTML>
<HEAD><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT>
<TITLE> E-Store </TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%  Connection con;

  con = dcon.getCon();

  out.println("Connection Created :"+con);
  %>

</BODY>
</HTML>
