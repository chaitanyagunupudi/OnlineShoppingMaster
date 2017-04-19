<Head><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Purchases <hr color=#99CC00></CENTER></font></head>
<body>
<br><br><br><br><br>
<form method="POST" action="purchases_get.jsp" name=frmPurchase onSubmit="">
<font face="comic sans ms" color=#006600 size=2> 
<b>Product Code & Name</b>
</font>

<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<select name="product_list">
<option><-- Select a Product --></option>
<% 
	try
	{
	Connection con; String prod="";
	con=dcon.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select p_code,p_name from prod_det");
	while(rs.next())
	{ prod=rs.getString(1).toUpperCase()+" - "+rs.getString(2).toUpperCase();
	 %>
	 <option><%=prod%></option> 	
	<% }
	}
	catch(Exception e){System.out.println("e:"+e);}
 %>
 </select>
 <input type="submit" value="  Get  " ></button>
 </form>
 
</body>