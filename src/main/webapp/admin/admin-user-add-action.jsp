<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="db.connection.ConnectionManager" %>

<%

String adminName=request.getParameter("adminName");
String adminPhoneNum=request.getParameter("adminPhoneNum");
String adminEmail=request.getParameter("adminEmail");
String adminAddress=request.getParameter("adminAddress");
String adminPostcode=request.getParameter("adminPostcode");
String adminCity=request.getParameter("adminCity");
String adminState=request.getParameter("adminState");
String adminGender=request.getParameter("adminGender");
String adminPassword=request.getParameter("adminPassword");
String supervisorId=request.getParameter("supervisorId");

try {
	Connection conn = null;
	PreparedStatement ps = null;
	Statement stat = null;
	ResultSet res = null;
	
	conn = ConnectionManager.getConnection();
	
    stat = conn.createStatement();
    
    ps=conn.prepareStatement("INSERT INTO admin (adminName,adminPhoneNum,adminEmail,adminAddress,adminPostcode,adminCity,adminState,adminGender,adminPassword,supervisorId) VALUES (?,?,?,?,?,?,?,?,?,?)");
    ps.setString(1, adminName);
	ps.setString(2, adminPhoneNum);
    ps.setString(3, adminEmail);
	ps.setString(4, adminAddress);
	ps.setString(5, adminPostcode);
	ps.setString(6, adminCity);
	ps.setString(7, adminState);
	ps.setString(8, adminGender);
	ps.setString(9, adminPassword);
	ps.setString(10, supervisorId);
	ps.executeUpdate();
	response.sendRedirect("admin-user-add.jsp?msg=Success");
}
catch (Exception e){
	System.out.println(e);
	System.out.println("error kenot add.");
	response.sendRedirect("admin-user-add.jsp?msg=Invalid");
}
%>