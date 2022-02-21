<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.io.*" %>
<%@page import="db.connection.ConnectionManager" %>


<% 
String custEmail= session.getAttribute("custEmail").toString();
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String address=request.getParameter("address");
String city = request.getParameter("city");
int postcode = Integer.parseInt(request.getParameter("postcode"));
String state = request.getParameter("state");
String gender = request.getParameter("gender");
try
{   
	Connection conn = null;
	PreparedStatement ps = null;
	Statement stat = null;
	ResultSet res = null;
	
	conn = ConnectionManager.getConnection();
	
    stat = conn.createStatement();
 
     ps = conn.prepareStatement("update customer set custPhoneNum=?, custAddress=?, custPostcode=?, custCity=?, custState=?, custGender=?,custName=? where custEmail ='" + custEmail + "'");
    ps.setString(1, phone);
    ps.setString(2, address);
    ps.setInt(3, postcode);
    ps.setString(4, city);
    ps.setString(5, state);
    ps.setString(6, gender);
    ps.setString(7, name);
    ps.executeUpdate();
    response.sendRedirect("customer-account.jsp?msg=valid");
    
    
    
}
catch(Exception e)
{
 response.sendRedirect("customer-account.jsp?msg=invalid");
}


%>