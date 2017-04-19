<HTML>
<HEAD><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT>
<TITLE> e-shopping </TITLE>
</HEAD>

<BODY BGCOLOR>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />

<%  
        try
	{
	Connection con;
	con = dcon.getCon();
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	String user=request.getParameter("T1");
	String pwd=request.getParameter("T2");
if((user.equals("Admin")) && (pwd.equals("Admin"))) 
	{

		//System.out.println("In If Block");
		response.sendRedirect("Adminservices.html");

	}
else{
System.out.println("++++++"+user+pwd);
	String str1 = "select * from user_det where uname='"+user+"' and pwd='"+pwd+"'";
	System.out.println("---------------------------"+str1);
	ResultSet rs=st.executeQuery(str1);
	String usr=user.toUpperCase();
	System.out.println("logsucc"+usr);

	ResultSet rs1=st1.executeQuery("select tname from tab where tname='"+usr+"'");
	while(rs1.next())
	{
		st1.executeUpdate("drop table "+usr+" ");
	}
	

	 if(rs.next())
	{
			
	RequestDispatcher rd=request.getRequestDispatcher("clientservices.jsp?usr="+usr);
	rd.forward(request,response);
	}
	else
	{
%>
		 <jsp:forward page="clientlogfail.html" />
<%
	}
}
	}
	catch(Exception e)
	{
		System.out.println(e);
		e.printStackTrace();
	}

%>

</BODY>
</HTML>
