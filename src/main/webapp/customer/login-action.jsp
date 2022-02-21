<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="db.connection.ConnectionManager" %>

<%
String custEmail = request.getParameter("custEmail");
String password = request.getParameter("password");

	int z=0;
	int id;
	try
	{
		Connection conn = null;
		Statement stat = null;
		ResultSet res = null;
		
		conn = ConnectionManager.getConnection();
		
	    stat = conn.createStatement();
	       String data = "select * from customer where custEmail='"+custEmail+"'and custPassword ='" + password + "'";
	       res = stat.executeQuery(data);
	       while(res.next())
	       {
	    	   z=1;
	    	   session.setAttribute("custEmail",custEmail);
	    	   session.setAttribute("id",res.getString("custId"));
	    	   response.sendRedirect("customer-home.jsp");
	       }
	       if(z==0)
	    	   response.sendRedirect("customer-login.jsp?msg=notexist");
	}
	catch(Exception e)
	{
		response.sendRedirect("customer-login.jsp?msg=invalid");	
	}
%>
