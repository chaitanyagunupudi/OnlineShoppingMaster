<HTML><SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT>
<body bgcolor>

<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />

<%! 
	Connection con;
	ResultSet rs,rs1;
	Statement st,st1,st2;
	String pname;
	float price,tot;
	int pstock;
%>
<%  

	con = dcon.getCon();
	st=con.createStatement();
	
	String pcode=request.getParameter("list");
	int qty=Integer.parseInt(request.getParameter("T1"));
	String tname1=request.getParameter("T2");
	
System.out.println("+++++rk"+tname1);
	st1=con.createStatement();
	st2=con.createStatement();
	String sql1 = "select * from prod_det where p_name='"+pcode+"'";
	rs1=st1.executeQuery(sql1);
	System.out.println("------hi ------"+sql1);
	while(rs1.next())
	{
		pcode=rs1.getString(1);
		pname=rs1.getString(2);
		price=rs1.getFloat(3);
		pstock=rs1.getInt(5);
	}
	System.out.println("-----test1-----");
	System.out.println(qty);
	System.out.println(pstock);
	System.out.println(pname);
	if(qty>pstock)
	{

	System.out.println("------test2----");
%>		
	<br><br><br><br><br><br><br>
	<center><font face='comic sans ms'  size='4' COLOR='#FF0000'>Required Quantity Not Available</font></center>
	<br><br><br>
	 <center><a href='clientpurchases.jsp?usr=<%=tname1%>'><font face='comic sans ms'  size='3' COLOR='#99CC00'>More Purchases</font</a></center>


<%
	}
	else
	{
		tot=price*qty;
/*		ResultSet rsss = st.executeQuery("select * from "+tname1+" where pcode='"+pcode+"'");
		if(rsss.next())
		{
%>
			<font face='comic sans ms'  size='3' COLOR='#CC0000'><center>Product already purchased</center></font>

			<center><a href='clientpurchases.jsp?usr=<%=tname1%>'><font face='comic sans ms'  size='3' COLOR='#99CC00'>More Purchases</font</a></center>
<%
		}
		else
		{*/
		String sql2 = "insert into "+tname1+" values('"+pcode+"','"+pname+"',"+qty+","+price+","+tot+")";
		System.out.println("---test3-----"+sql2);
		int i=st.executeUpdate(sql2);
		if(i==1)
		{
		String sql3 = "select * from "+tname1+"";
		System.out.println("----test4---"+sql3);
		rs=st.executeQuery(sql3);
		}
		else
		{ 
		System.out.println("----test5----");
		out.println("<center><h1><FONT face='comic sans ms' SIZE='+1' COLOR='#006600'>Not Added To Your List<h1><center></font>");
		}
		System.out.println("-----test6----");
		st1.executeUpdate("update prod_det set present_stock=present_stock - "+qty+" where p_code='"+pcode+"'");
		//st2.executeUpdate("insert into sales_det values('"+pcode+"','"+pname+"',"+qty+","+price+",sysdate)");


	
%>

         
   <html>
   <body >    

<form method="post" action="makebill.jsp" 

 <head><FONT  face="comic sans ms" size=3 COLOR=#006600><center><hr color=#99CC00>Your List Of Purchases<hr color=#99CC00></center></font></head> 
  </body> 
<table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 0.5pt solid teal" fpstyle="8,011111100">
                         <th bgcolor=#999900>Product code</th><th bgcolor=#999900> Name</th><th bgcolor=#999900>Quantity</th><th bgcolor=#999900>Unit Price</th><th bgcolor=#999900>Total Price</th>

                          
<% 
    while(rs.next())
        {
           System.out.println("----tes7----");
           out.println("  <tr  >");

	     out.println("<td width='10%' style='font-weight: bold; color: black; border-style:; background-color:' align=center>"
   +rs.getString(1)+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: ; background-color: ' align=center>"
   +rs.getString(2).toUpperCase()+"</td>");        
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: ; background-color: ' align=center>"
   +rs.getString(3)+"</td>");
            out.println("<td width='10%' style='font-weight: bold; color: black; border-style: ; background-color:' align=center>"
   +rs.getString(4)+"</td>");            
             out.println("<td width='10%' style='font-weight: bold; color: black; border-style: ; background-color:' align=center>"
   +rs.getString(5)+"</td>"); 
             
   
           out.print("</tr>");
            
   }st.close();
    st1.close();
    st2.close();
    
   out.println("</table>");
   out.println("");  

%>


        <center><a href='clientpurchases.jsp?usr=<%=tname1%>'><font face='comic sans ms'  size='3' COLOR='#99CC00'>More Purchases</font</a></center>

	<center><a href='deleteclientitem.jsp?usr=<%=tname1%>'> <pre><font face='comic sans ms'  size='3' COLOR='#99CC00'>Delete an item from the list</font></pre></a></center> 
	<input type=hidden name="tname" value=<%=tname1%>>
	<center><input type=submit value="Make Bill"></center>
<% } 
%>
 </form> 
</body>
</html>