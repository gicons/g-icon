<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.connection.ConnectionManager" %>


<%
String productId = request.getParameter("d");

Connection conn = null;
Statement stat = null;

conn = ConnectionManager.getConnection();

stat = conn.createStatement();

stat.executeUpdate("delete from product where productId ='"+ productId +"'");
response.sendRedirect("admin-home.jsp");
%>

<script>
function myFunction() {
  alert("Succefully add new product!");
}
</script>