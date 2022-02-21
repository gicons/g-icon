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
String orderId=request.getParameter("orderId");
try{
	Connection conn = null;
	PreparedStatement ps = null;
	Statement stat = null;
	ResultSet res = null;
	
	conn = ConnectionManager.getConnection();
	
	Statement st=conn.createStatement();
    st.executeUpdate("delete from orders where orderId='"+orderId+"'");
    response.sendRedirect("admin-status.jsp?msg=order-deleted");	
%>

<script>
function myFunction() {
  alert("Succefully delete an order!");
}
</script>
<%
}
catch (Exception e){
	System.out.println(e);

}

%>

