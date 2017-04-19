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
	String uname=request.getParameter("T2");
	String pwd=request.getParameter("T3");
	String gender=request.getParameter("D1");
	String phone=request.getParameter("T4");
	String address=request.getParameter("S1");
	String pin=request.getParameter("T5");
		
	ResultSet rs=st.executeQuery("select uname from user_det where uname ='"+uname+"'");
	if(!rs.next())
	{
        int i=st.executeUpdate("insert into user_det values('"+name+"','"+uname+"','"+pwd+"','"+gender+"','"+phone+"','"+address+"','"+pin+"')");
	if(i==1)
        {
      
	out.println("<br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>You have been successfully registered<h1></font><center>");
        }
	else
	{ 
        out.println("<center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Cannot be Registered<h1><center></font>");
        }
        out.println("<center><a href='Client.html'><font face='comic sans ms'  size='4' COLOR='#99CC00'>SignIn</font</a></center>");
	}
	else
	{
	out.println("<center><br><br><br><font face='comic sans ms' size='4' COLOR='#006600'>User name in use</font><center><pre><font face='verdana' size='3'><a href='newclient.html'>Back</a></font></pre>");
	}
	
	%>
  
</body>
</html>