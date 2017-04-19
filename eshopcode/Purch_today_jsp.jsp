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
	
	/*String day1=request.getParameter("list1");
	String mon1=request.getParameter("list2");
	String yr1=request.getParameter("list3");
	String day2=request.getParameter("list4");
	String mon2=request.getParameter("list5");
	String yr2=request.getParameter("list6");

	String date1=day1+"-"+mon1+"-"+yr1;
	String date2=day2+"-"+mon2+"-"+yr2;*/
	
	ResultSet rs1=st.executeQuery("select to_char(sysdate,'dd-mon-yy') from dual");
	String pdate="";
	if(rs1.next());
	pdate=rs1.getString(1);
	rs1.close();
        ResultSet rs=st.executeQuery("select  p_code,p_name,p_qty,p_price,to_char(pursc_date,'dd-mon-yy') dd from purchase_det where pursc_date ='"+pdate+"'");
         %> 
   


 <head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Purchases Of Today <hr color=#99CC00></center></font></head> 
 <table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 1.5pt solid teal" fpstyle="8,011111100">
                         <th bgcolor=#999900>Product Code</th><th bgcolor=#999900>Name</th><th bgcolor=#999900>Quantity</th><th bgcolor=#999900>Price</th><th bgcolor=#999900>Date</th>

                          
<% 
        
    while(rs.next())
        {
           out.println("  <tr  >");

	     out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(1).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(2).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(3)+"</td>");
            out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color: ' align=center>"
   +rs.getString(4)+"</td>");            
            out.println("<td width='10%' style='font-weight: bold; color: black; border-style: none; background-color:' align=center>"
   +rs.getString(5)+"</td>");            
             
     
           out.print("</tr>");
            %>    
	    
      <%
   }
   out.println("</table>");
   out.println("");  

%>
<pre>
   <a href="Reports.html"><font face="comic sans ms">Back To Reports</font></a>
</pre>
</body>
</html>