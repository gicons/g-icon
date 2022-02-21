<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.io.*" %>
<%@page import="db.connection.ConnectionManager" %>


<% 
String email=session.getAttribute("email").toString();
String phone = request.getParameter("phone");
String address=request.getParameter("address");
String city = request.getParameter("city");
int postcode = Integer.parseInt(request.getParameter("postcode"));
String state = request.getParameter("state");

try
{   
	Connection conn = null;
	PreparedStatement ps = null;
	Statement stat = null;
	ResultSet res = null;
	
	conn = ConnectionManager.getConnection();
	
    stat = conn.createStatement();
    ps = conn.prepareStatement("update admin set adminPhoneNum=?, adminAddress=?, adminPostcode=?, adminCity=?, adminState=? where adminEmail='" + email + "'");
    ps.setString(1, phone);
    ps.setString(2, address);
    ps.setInt(3, postcode);
    ps.setString(4, city);
    ps.setString(5, state);
    ps.executeUpdate();
    response.sendRedirect("admin-account.jsp?msg=valid");
    
    
    
}
catch(Exception e)
{
	response.sendRedirect("admin-account.jsp?msg=invalid");
}


%>