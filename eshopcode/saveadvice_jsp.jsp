<HTML><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT>
<body bgcolor>

<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%  
        Connection con;
	con = dcon.getCon();
	Statement st=con.createStatement();
	
	String name=request.getParameter("T1");
	String phone=request.getParameter("T2");
	String id=request.getParameter("id");
	String address=request.getParameter("T3");
	String advice=request.getParameter("S1");
	String str = "insert into suggest values('"+name+"','"+phone+"','"+id+"','"+address+"','"+advice+"')";
	System.out.println("in service......."+str);
	int i=st.executeUpdate(str);
	if(i==1)
        {
	
        out.println("<br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Thanks For Your Suggestions<h1></font><center>");
        }
	else
	{ 
        out.println("<center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Not Accepted<h1><center></font>");
        }
        out.println("<center><a href='suggestions.html'><font face='comic sans ms'  size='4' COLOR='#99CC00'>More Suggestions</font</a></center>");
	out.println("<center><a href='main.html' target=_top> <pre><font face='comic sans ms'  size='3' COLOR='#99CC00'>Home</font></pre></a></center>");                                                                                 
		
	%>
  
</body>
</html>