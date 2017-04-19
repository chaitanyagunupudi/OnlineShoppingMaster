<HTML>
<HEAD>
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
	ResultSet rs=st.executeQuery("select * from user_det where uname='"+user+"' and pwd='"+pwd+"'");
	String usr=user.toUpperCase();
	
	System.out.println("logsucc"+usr);

	ResultSet rs1=st1.executeQuery("select tname from tab where tname='"+usr+"'");
	while(rs1.next())
	{
		st1.executeUpdate("drop table "+usr+" ");
	}
	
	if(rs.next())
	{
%>
			
		<jsp:forward page='clientservices.jsp?usr="+usr+"' />
<%
	}
	else
	{
%>
		 <jsp:forward page="clientlogfail.html" />
<%
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
