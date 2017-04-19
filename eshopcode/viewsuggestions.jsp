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

 <%
        Connection con;
	con=dcon.getCon();
	Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from suggest ");
       
         %> 
   <html>
   <body >    



 <head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Client Suggestions<hr color=#99CC00></center></font></head> 
  </body> 
<table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 0pt solid teal" fpstyle="8,011111100">
                         <th bgcolor=#999900>Name</th><th bgcolor=#999900>Phone Number</th><th bgcolor=#999900>Address</th><th bgcolor=#999900>Suggestion</th>

                          
<% 
    while(rs.next())
        {
           
           out.println("  <tr  >");

	     out.println("<td width='10%' style='font-weight: ; color: black; border-style: ; background-color:' align=center>"
   +rs.getString(1).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight:; color: black; border-style: ; background-color: ' align=center>"
   +rs.getString(2)+"</td>");        
             out.println("<td width='10%' style='font-weight: ; color: black; border-style:; background-color: ' align=center>"
   +rs.getString(4).toUpperCase()+"</td>");
            out.println("<td width='10%' style='font-weight: ; color: black; border-style:; background-color:' align=center>"
   +rs.getString(5).toUpperCase()+"</td>");            
             
     
           out.print("</tr>");
            %>    
	    
      <%
   }
   out.println("</table>");
   out.println("");  

%>
<pre>
                                                 <a href="Adminservices.html"><font face="comic sans ms" color=#99CC00>Back</font></a>

</pre>
</body>
