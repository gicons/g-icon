<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="db.connection.ConnectionManager" %>

<%
try{
	String id = request.getParameter("id");
	Connection conn = null;
	PreparedStatement ps = null;
	Statement st = null;
	ResultSet res = null;
	
	conn = ConnectionManager.getConnection();
	
    st = conn.createStatement();
     st.executeUpdate("delete from admin where adminId ='"+ id +"'");
     response.sendRedirect("admin-user.jsp");
	
	
}
catch (Exception e){
	
}
%>