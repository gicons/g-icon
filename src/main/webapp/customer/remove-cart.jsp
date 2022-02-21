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
String custEmail= session.getAttribute("custEmail").toString();
String id = session.getAttribute("id").toString();
String product_id=request.getParameter("productId");
try{
	Connection conn = null;
	PreparedStatement ps = null;
	Statement st = null;
	ResultSet res = null;
	
	conn = ConnectionManager.getConnection();
	
    st = conn.createStatement();
    st.executeUpdate("delete from cart where product_id='"+product_id+"'and cust_id='"+id+"'");
    response.sendRedirect("customer-cart.jsp?msg=removed");	
}
catch (Exception e){
	System.out.println(e);

}



%>

</html>
