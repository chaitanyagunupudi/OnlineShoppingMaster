<HTML>
<Head><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00> Choose The Product Code To Be Deleted<hr color=#99CC00></CENTER> </font></head>
<body bgcolor >
<form method="POST" action="Delete_prod_jsp.jsp" >
<pre>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%
	 
	Connection con;
	con=dcon.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select p_code,p_name from prod_det order by p_code");
%>	
	<br><br><br><FONT  face='comic sans ms' size=2 COLOR=#006600>Product Code & Name:</font><select name='list' style='width:150'><br><br><br><br>
<%	
		 while(rs.next())
		  {
                    String s1 = rs.getString(1);
                    String s2 = rs.getString(2);

%>
                <option value=<%=s1%>><%=s1.toUpperCase()%>---<%=s2.toUpperCase()%></option>
<%	  
		  }
        
%>
         </select>
						  
    <br>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Get Record  ">       
</pre>
</form>

</body>
</HTML>
