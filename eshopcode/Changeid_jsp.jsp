<HTML>
<Head><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Change An Id<hr color=#99CC00></CENTER></font></head>

<BODY BGCOLOR>
<form method=post action="Changeid_final_jsp.jsp">
<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />

<%	
try
{
	Connection con;
	con=dcon.getCon();
	System.out.println("hi");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select p_code,p_name from prod_det order by p_code");
	System.out.println("hiiii");%>
	<br><br><br>
	<center><FONT  face="comic sans ms" size=2 COLOR=#006600>Product Code & Name:</font><select name="list" style='width:150'><br><br><br><br>
	<%
		 while(rs.next())
		  { 
		 %>
		<option><%=rs.getString(1).toUpperCase()%> --- <%=rs.getString(2).toUpperCase()%></option>
		<%	  
		  }
}
catch(Exception e){System.out.println(e);}		
  %>
  </select></center>
  <br>
<center><input type="submit" value=" Get "></center>

</form>
</BODY>
</HTML>
