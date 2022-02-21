<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import = "java.util.Date, java.sql.Time, java.sql.Timestamp,java.text.ParseException,java.text.SimpleDateFormat"%>
<%@page import="db.connection.ConnectionManager" %>


<%
String orderPickupDate = request.getParameter("orderPickupDate");
String orderPickupTime = request.getParameter("orderPickupTime");
String custId = request.getParameter("custId");
String store = request.getParameter("pickupStore");
String productId= request.getParameter("productId");
	try
	{
		Connection conn = null;
		PreparedStatement ps = null;
		Statement st = null;
		ResultSet res = null;
		
		conn = ConnectionManager.getConnection();
		
	    st = conn.createStatement();
	       ps = conn.prepareStatement("INSERT INTO orders (orderStatus, orderPickupStore, orderPickupDate, orderPickupTime, custId) VALUES (?,?,?,?,?)");
	       ps.setString(1,"Preparing");
	       ps.setString(2,store);
	       ps.setString(3,orderPickupDate);
	       ps.setString(4,orderPickupTime);
	       ps.setString(5,custId);
	       ps.executeUpdate();
	       response.sendRedirect("customer-summary.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		response.sendRedirect("customer-home.jsp?msg=invalid");	
	}

%>