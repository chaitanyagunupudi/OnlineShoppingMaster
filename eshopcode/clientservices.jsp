<HTML>
<Head><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Client Services<hr color=#99CC00></CENTER></font></head>
<BODY BGCOLOR>

<form method="post" > 
<%! String user;%>
<%

	user=request.getParameter("usr");
	System.out.println("cservice"+user);
%>
<FONT  face="comic sans ms" size=3 COLOR=#006600><center>Welcome <%=user.toLowerCase()%> !</center></font>
<UL>
<pre>

<a href="view_jsp.jsp?usr=<%= user %>"><FONT  face="comic sans ms" size=2 COLOR=#006600><LI>View Items </a>



<a href="clienttable.jsp?usr=<%= user %>"><FONT  face="comic sans ms" size=2 COLOR=#006600><LI>Purchase Items</font></a>

</UL>
</pre>
</form>

</BODY>
</HTML>
