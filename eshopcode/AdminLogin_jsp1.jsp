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

	con=dcon.getCon();
	System.out.println("ccccc:"+con);
	/*
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
          String url="jdbc:odbc:eshop";

          
          con = DriverManager.getConnection(url,"eshop","eshop");
*/
	Statement st=con.createStatement();

	String eno=request.getParameter("T1");
	String pwd=request.getParameter("T2");
System.out.println(eno);System.out.println(pwd);
	String str = "select * from emp_det where eno="+eno+" and pwd='"+pwd+"'";
	System.out.println("........"+str);	
	ResultSet rs=st.executeQuery(str);

	
	if(rs.next()) 
	{
%>
		
		<jsp:forward page="Adminservices.html" />
<%
	}
	else
	{
%>
		 <jsp:forward page="Admlogfail.html" />
<%
	}
	}
	catch(Exception e)
	{
		System.out.println("ERROR>>>>>Database Not Availble");
		e.printStackTrace();
	}
%>

</BODY>
</HTML>
