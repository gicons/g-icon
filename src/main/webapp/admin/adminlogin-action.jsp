<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="db.connection.ConnectionManager" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");
if("email".equals(email) && "password".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("admin-home.jsp");
}
else
{
	int z=0;
	int adminId;
	try
	{
		Connection conn = null;
		Statement stat = null;
		ResultSet res = null;
		
		conn = ConnectionManager.getConnection();
		
	    stat = conn.createStatement();
	       String data = "select * from admin where adminEmail='"+email+"'and adminPassword ='" + password + "'";
	       res = stat.executeQuery(data);
	       while(res.next())
	       {
	    	   z=1;
	    	   session.setAttribute("email",email);
	    	   session.setAttribute("adminId",res.getString("adminId"));
	    	   response.sendRedirect("admin-home.jsp");
	       }
	       if(z==0)
	    	   response.sendRedirect("admin-login.jsp?msg=notexist");
	}
	catch(Exception e)
	{
		response.sendRedirect("admin-login.jsp?msg=invalid");	
	}
}
%>
