<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="db.connection.ConnectionManager" %>

<%
String custName=request.getParameter("custName");
String custEmail=request.getParameter("custEmail");
String custPassword=request.getParameter("custPassword");
String custConfirmPassword=request.getParameter("custConfirmPassword");


try {
	Connection conn = null;
	PreparedStatement ps = null;
	Statement stat = null;
	ResultSet res = null;
	
	conn = ConnectionManager.getConnection();
	
    stat = conn.createStatement();
     ps = conn.prepareStatement("INSERT INTO customer (custEmail,custName,custPassword,custConfirmPassword) values (?,?,?,?)");
    ps.setString(1,custEmail);
    ps.setString(2,custName);
    ps.setString(3,custPassword);
    ps.setString(4,custConfirmPassword);
    
    ps.executeUpdate();
    response.sendRedirect("customer-login.jsp");
}
catch(Exception e)
{ 
	response.sendRedirect("customer-signup.jsp?msg=notsuccess");
	System.out.println(e);
}
%>
