<HTML>
<Head><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Bill<hr color=#99CC00></CENTER></font></head>

<BODY BGCOLOR>
<%@ page import="java.sql.*,java.lang.Math" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%!	
		
	String usr;
	float grandtot=0;
	double ids;
%>
<%
	Connection con=dcon.getCon();
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	Statement st2=con.createStatement();
	

	usr=request.getParameter("tname");
	ids=Math.random()*10;
	String id1="ES"+ids;
	String id=id1.substring(0,10);
	System.out.println(id);
	ResultSet rs=st.executeQuery("select sum(totprice)from "+usr+"");
	System.out.println(usr);
	while(rs.next())
	{
		grandtot=rs.getFloat(1);
		System.out.println(grandtot);
	}
	
	
	ResultSet rs1=st.executeQuery("select * from "+usr+"");
	
	try{
	while(rs1.next())
	{
		System.out.println(rs1.getString(1));
		System.out.println(rs1.getString(2));
		System.out.println(rs1.getInt(3));
		System.out.println(rs1.getFloat(4));
		System.out.println(rs1.getFloat(5));
		System.out.println(id);
		System.out.println(usr);
		st1.executeUpdate("insert into orders values('"+rs1.getString(1)+"','"+rs1.getString(2)+"',"+rs1.getInt(3)+","+rs1.getFloat(4)+","+rs1.getFloat(5)+",'"+id+"','"+usr+"',sysdate)");
		System.out.println("----1--------");
	st2.executeUpdate("insert into sales_det values('"+rs1.getString(1)+"','"+rs1.getString(2)+"',"+rs1.getInt(3)+","+rs1.getFloat(4)+",sysdate)");
	}
	st.executeUpdate("drop table "+usr+"");	
	
st.close();
st1.close();
%>
<br><br>	
<FONT  face="comic sans ms" size=5 COLOR=#C6BB6C><center>Your order has been placed.<br><br><FONT  face="comic sans ms" size=3 COLOR=#006600>Your order number is<u> <%=id%></u> and your total m amount is <%=grandtot%></center></font>
<br><br><br><br><br>
<a href="main.html" target=_top><font face="comic sans ms" size=3 COLOR=#C6BB6C><center>Logout</center></font></a>


</BODY>
</HTMl>
<%
	}
	catch(Exception e){
		System.out.println(e);
		System.out.println("This is makebill.jsp error");}
		%>