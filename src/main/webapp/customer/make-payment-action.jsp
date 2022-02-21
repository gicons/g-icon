<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="db.connection.ConnectionManager" %>

<%
String orderId = request.getParameter("orderId");
String amount = request.getParameter("amount");
String paymentName = request.getParameter("payment");


	try
	{
		Connection conn = null;
		PreparedStatement ps = null;
		Statement stat = null;
		ResultSet res = null;
		
		conn = ConnectionManager.getConnection();
		
	    stat = conn.createStatement();
	        ps = conn.prepareStatement("INSERT INTO payment(paymentName,amount,orderId) VALUES (?,?,?)");
	       ps.setString(1,paymentName);
	       ps.setString(2, amount);
	       ps.setString(3, orderId);
	       
	       ps.executeUpdate();
	       %>
	       <script>
	       	alert("Payment successfull");
	       	window.location.href = "customer-home.jsp";
	       </script>
	       <%
	       // response.sendRedirect("customer-home.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		response.sendRedirect("customer-home.jsp?msg=invalid");	
	}

%>
