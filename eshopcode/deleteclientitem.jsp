<HTML>
<Head><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00> Choose The Item To Be Removed<hr color=#99CC00></CENTER> </font></head>
<body bgcolor >
<form method="POST" action="Deletedclientitem.jsp" >
<pre>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%
	 
	Connection con;
	con=dcon.getCon();
	String tname=request.getParameter("usr");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select pcode,pname from "+tname+"");
%>	
	<br><br><br><FONT  face='comic sans ms' size=2 COLOR=#006600>Product Code & Name:</font><select name='list' style='width:150'><br><br><br><br>
<%	
		 while(rs.next())
		  { 
			  String str1 = rs.getString(1);
			  String str2 = rs.getString(2);
			  String str = str1+"--"+str2;
%>
		<option value=<%=str1%>><%=str%></option>
<%	  
		  }
        
%>
         </select>
	<input type=hidden name="T2" value=<%=tname%>>					  
    <br>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Remove Item">       
</pre>
</form>

</body>
</HTML>
