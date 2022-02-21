<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="db.connection.ConnectionManager" %>

<!DOCTYPE html>
<html>
<% 
String adminId=session.getAttribute("adminId").toString();
String orderId=request.getParameter("orderId");
try{
	Connection conn = null;
	PreparedStatement ps = null;
	Statement st = null;
	ResultSet res = null;
	
	conn = ConnectionManager.getConnection();
	
    st = conn.createStatement();
    st.executeUpdate("update orders set orderStatus = 'Completed' ,adminId='"+adminId+"' where orderId='"+orderId+"'");
    response.sendRedirect("admin-order.jsp?msg=updated");	
}
catch (Exception e){
	System.out.println(e);

}



%>

</html>
