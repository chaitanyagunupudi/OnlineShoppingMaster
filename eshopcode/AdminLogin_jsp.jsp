<SCRIPT language=JavaScript>
<!-- http://www.spacegun.co.uk -->
	var message = "web Page disabled"; 
	function rtclickcheck(keyp){ if (navigator.appName == "Netscape" && keyp.which == 3){ 	alert(message); return false; } 
	if (navigator.appVersion.indexOf("MSIE") != -1 && event.button == 2) { 	alert(message); 	return false; } } 
	document.onmousedown = rtclickcheck;


</SCRIPT>
<%  
        try
	{
	
	String eno=request.getParameter("T1");
	String pwd=request.getParameter("T2");
System.out.println(eno);System.out.println(pwd);
	
	if((eno.equals("Admin")) && (pwd.equals("Admin"))) 
	{

		//System.out.println("In If Block");
		response.sendRedirect("Adminservices.html");

	}
	else
	{
		 //System.out.println("In Else Block");
		 response.sendRedirect("Admlogfail.html");

	}
	}
	catch(Exception e)
	{
		System.out.println("ERROR>>>>>Database Not Availble");
		e.printStackTrace();
	}
%>

