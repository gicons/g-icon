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
String product_id=request.getParameter("productId");
String id = session.getAttribute("id").toString();
String incdec=request.getParameter("cartQuantity");
double price=0.0;
double total=0.0;
int quantity=0;
double final_total=0.0;
try{
	Connection conn = null;
	PreparedStatement ps = null;
	Statement st = null;
	ResultSet res = null;
	
	conn = ConnectionManager.getConnection();
	
    st = conn.createStatement();
    ResultSet rs6=st.executeQuery("select *from cart where product_id='"+product_id+"' and cust_id='"+id+"'");
    while (rs6.next()){
    	price=rs6.getDouble(3);
    	total=rs6.getDouble(5);
    	quantity=rs6.getInt(4);
    }
    if(quantity==1 && incdec.equals("dec"))
    	response.sendRedirect("customer-cart.jsp?msg=notPossible");
    else if(quantity!=1 && incdec.equals("dec"))
    {
    	total= total-price;
    	quantity=quantity-1;
    	st.executeUpdate("update cart set cartTotalPrice='"+total+"',cartQuantity='"+quantity+"' where product_id='"+product_id+"' and cust_id='"+id+"'");
    	response.sendRedirect("customer-cart.jsp?msg=decreased");
    }
    else
    {
    	total= total+price;
    	quantity=quantity+1;
    	st.executeUpdate("update cart set cartTotalPrice='"+total+"',cartQuantity='"+quantity+"' where product_id='"+product_id+"' and cust_id='"+id+"'");
    	response.sendRedirect("customer-cart.jsp?msg=increased");
    }

	
}
catch (Exception e){
	System.out.println(e);
}



%>

</html>