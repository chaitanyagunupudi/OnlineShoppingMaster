<Head><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Purchases <hr color=#99CC00></CENTER></font></head>
<body>

<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<% 
String pcode="",pname="";float price=0f;
 %>
<% 
	try
	{
	Connection con; 
	String prod=request.getParameter("product_list");
	System.out.println("prod:"+prod);
	pcode=prod.substring(0,1);
	System.out.println("prod:"+pcode);
	pname=prod.substring(4,prod.length());
	System.out.println("prod:"+pname);
	con=dcon.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select p_price from prod_det where p_code='"+pcode+"'");
	rs.next();
	price=rs.getFloat(1);
	}
	catch(Exception e){System.out.println(e);}
 %>
<br><br>
<form action="purchases_submit.jsp">
<font face="comic sans ms" color=#006600 size=2> 
<b>Product Code: &nbsp;&nbsp;&nbsp;&nbsp;</b><input type="text"  readonly name="PCode"   value="<%=pcode%>"size="20">
<br><br><br>
<b>Product Name: &nbsp;&nbsp;&nbsp;</b><input type="text"  readonly name="PName"   value="<%=pname%>" size="20">
<br><br><br>
<b>Quantity: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><input type="text"  name="Qty" size="20">
<br><br><br>
<b>Product Price:&nbsp;&nbsp;&nbsp;&nbsp; </b><input type="text"  readonly name="Price"   value="<%=price%>"size="20">
<br><br><br>
<b>Date: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><input type="text"  name="tDate" size="20">&nbsp;(dd-MON-yy)
<br><br><br>
<input type="submit" value="Add to Purchases">&nbsp;&nbsp;<input type="reset" value="Reset">
</font>
</form>