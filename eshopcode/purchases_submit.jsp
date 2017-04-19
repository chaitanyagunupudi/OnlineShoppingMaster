<SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT><%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<% 
	try	
	{
	String pcode=request.getParameter("PCode");
	String pname=request.getParameter("PName");
	String qty=request.getParameter("Qty");
	String price=request.getParameter("Price");
	String dt=request.getParameter("tDate");
	
	Connection con; 
	
	con=dcon.getCon();
	Statement st=con.createStatement();
	System.out.println("hi");
	String query="insert into purchase_det values('"+pcode+"','"+pname+"',"+Integer.parseInt(qty)+","+Float.parseFloat(price)+",'"+dt+"')";
	System.out.println(query);
	int i=st.executeUpdate(query);
	System.out.println(i);
	if(i==1)
        {
	out.println("<br><br><br><br><br><center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>"+i+" Record successfully Added<h1></font><center>");
        }
        else
	{ 
        out.println("<center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Not Added<h1><center></font>");
        }
        out.println("<center><a href='Add_prod.jsp'><font face='comic sans ms'  size='4' COLOR='#99CC00'>Add New</font</a></center>");	
	out.println("<center><a href='Adminservices.html'> <pre><font face='comic sans ms'  size='3' COLOR='#99CC00'>Back To Administrative Services</font></pre></a></center>");
	}
	catch(Exception e){System.out.println(e);}
 %>