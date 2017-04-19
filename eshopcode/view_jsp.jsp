<html><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT>
<body bgcolor>

<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />
<%! String usr; %>
 <%
        Connection con;
	con=dcon.getCon();
	Statement st=con.createStatement();
	usr=request.getParameter("usr");
        ResultSet rs=st.executeQuery("select * from prod_det order by p_code");
        ResultSetMetaData rd=rs.getMetaData();
        int  count=rd.getColumnCount();
 %> 
   <html>
   <body >    



 <head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Availability Of Stock<hr color=#99CC00></center></font></head> 
  </body> 
<table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 1.5pt solid teal" fpstyle="8,011111100">
                         <th bgcolor=#A9F1A5>Product code</th><th bgcolor=#A9F1A5> Name</th><th bgcolor=#A9F1A5>Price</th><th bgcolor=#A9F1A5>Stock Available</th>

                          
<% 
    while(rs.next())
        {
           
           out.println("  <tr  >");

	     out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none size:2; background-color:' align=center>"
   +rs.getString(1).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none size:2; background-color: ' align=center>"
   +rs.getString(2).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none size:2; background-color: ' align=center>"
   +rs.getString(3)+"</td>");
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none size:2; background-color:' align=center>"
   +rs.getString(5)+"</td>"); 
             
     
           out.print("</tr>");
            %>    
	    
      <%
   }
   out.println("</table>");
   out.println("");  

%>
<pre>
                                                 <a href="clientservices.jsp?usr=<%= usr %>"><font face="comic sans ms" color=#66FF99>Back </font></a>

</pre>
</body>
