<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome User</title>
<meta name="viewpost" content="width=device-width,initial-scale=1.0"/>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
response.setHeader("Cache-control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%
if(session.getAttribute("USER")!=null){
%>	
<div style="float: right">
Welcome<%=session.getAttribute("USER")%>
<a href="Logout">Logout</a>
</div>
<%
}
else{
	response.sendRedirect("login.jsp");
}
%>

<div class="table-responsive">
<header class="page-head"><h1 style="font-size:200%; color: #C70039;text-align: center; "><i>Educative Academy Teachers Data</i></h1></header>
<table class="table table-hover table-bordered">

<tr>
<th>Action</th>
<th>Name</th>
<th>Phone</th>
<th>Email</th>
</tr>
<%
//Load The database Driver
Class.forName("com.mysql.cj.jdbc.Driver");
//create the connection with my sql server
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadata","root","");
//sending sql command here.....
PreparedStatement stmt = null;
/* Authorization Code Goes here*/
if(session.getAttribute("USERROLE").equals("admin"))
	stmt = con.prepareStatement("select * from `user`");
else 
	stmt = con.prepareStatement("select * from `user` where id="+session.getAttribute("USERID"));
//Execute the SQL statement
ResultSet rs = stmt.executeQuery();
while(rs.next()){
	%>
	<tr>
	<td><a href="editform.jsp?id=<%=rs.getInt("id") %>" class="btn-primary btn-sm">Edit</a>
	<a href="delete?id=<%=rs.getInt("id") %>" class="btn-danger btn-sm" onclick="return confirm('Do You want to Delete This Record ?');">Delete</a></td>
	<td><%=rs.getString("cname") %></td>
	<td><%=rs.getString("phone") %></td>
	<td><%=rs.getString("email") %></td>
	</tr>
	<%
}
rs.close();
stmt.close();
con.close();
	%>
</table>
</div>
<%
if(session.getAttribute("USERROLE").equals("admin")){


%>
<a href="add.jsp">Add new record</a>
<% }%>

</body>
</html>